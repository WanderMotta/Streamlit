import os
import pandas as pd
from ofxparse import OfxParser
import streamlit as st
from io import BytesIO
import locale
from openpyxl.styles import Alignment
import plotly.express as px
import plotly.graph_objects as go
from datetime import datetime
import calendar
from difflib import SequenceMatcher
import numpy as np
from sentence_transformers import SentenceTransformer
import re

# Configuração da página
st.set_page_config(
    page_title="Dashboard Financeiro",
    page_icon="",
    layout="wide"
)

# Inicializar session_state
if 'df' not in st.session_state:
    st.session_state.df = None
if 'categorias' not in st.session_state:
    st.session_state.categorias = None

# CSS personalizado
st.markdown("""
    <style>
    .main {
        padding: 2rem;
    }
    .stDataFrame {
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 0.5rem;
        margin: 1rem 0;
    }
    .st-emotion-cache-1v0mbdj {
        margin-top: 1rem;
    }
    .st-emotion-cache-16idsys p {
        font-size: 1.1rem;
        font-weight: 500;
    }
    .download-button {
        background-color: #4CAF50;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 0.3rem;
        text-decoration: none;
        margin: 1rem 0;
    }
    /* Alinhamento das colunas de valor */
    [data-testid="stDataFrame"] div[data-testid="StyledDataFrameDataCell"]:nth-child(3) {
        text-align: right !important;
    }
    [data-testid="stDataFrame"] div[data-testid="StyledDataFrameDataCell"]:nth-child(2) {
        text-align: right !important;
    }
    </style>
""", unsafe_allow_html=True)

# Configurar locale para português do Brasil
try:
    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
except:
    try:
        locale.setlocale(locale.LC_ALL, 'Portuguese_Brazil.1252')
    except:
        pass

def formatar_valor(valor):
    """Formata o valor para o padrão brasileiro"""
    try:
        return f"{valor:,.2f}".replace(",", "X").replace(".", ",").replace("X", ".")
    except:
        return valor

def load_categories():
    """Carrega categorias do arquivo Excel"""
    try:
        # Tenta encontrar o arquivo no mesmo diretório do script
        script_dir = os.path.dirname(os.path.abspath(__file__))
        excel_path = os.path.join(script_dir, 'categorias.xlsx')
        
        if not os.path.exists(excel_path):
            st.error(f" Arquivo não encontrado: {excel_path}")
            return {}
        
        # Tenta ler o arquivo Excel
        try:
            df = pd.read_excel(excel_path)
        except Exception as e:
            st.error(f" Erro ao ler o Excel: {str(e)}")
            return {}
        
        # Verifica as colunas necessárias
        if 'categoria' not in df.columns or 'palavras_chave' not in df.columns:
            st.error(" O arquivo Excel deve conter as colunas 'categoria' e 'palavras_chave'")
            st.write("Colunas encontradas:", list(df.columns))
            return {}
        
        # Converte para dicionário
        categorias = {}
        for _, row in df.iterrows():
            categoria = str(row['categoria']).strip()
            palavras = str(row['palavras_chave']).strip()
            if categoria and palavras:  # Ignora linhas vazias
                categorias[categoria] = palavras
        
        if not categorias:
            st.warning(" Nenhuma categoria válida encontrada no arquivo Excel")
            return {}
        
        st.success(f" {len(categorias)} categorias carregadas com sucesso!")
        if st.session_state.get('debug_mode', False):
            st.write("Categorias carregadas:")
            for cat, palavras in categorias.items():
                st.write(f"- {cat}: {palavras}")
        
        return categorias
        
    except Exception as e:
        st.error(f" Erro ao carregar categorias: {str(e)}")
        return {}

def read_ofx_files(directory):
    transactions = []
    for filename in os.listdir(directory):
        if filename.endswith('.ofx'):
            with open(os.path.join(directory, filename), 'rb') as fileobj:
                try:
                    ofx = OfxParser.parse(fileobj)
                    for transaction in ofx.account.statement.transactions:
                        transactions.append({
                            'Data': transaction.date.strftime('%d/%m/%y'),
                            'Historico': transaction.memo,
                            'Valor': transaction.amount
                        })
                except Exception as e:
                    st.error(f" Erro ao processar arquivo {filename}: {str(e)}")
    return pd.DataFrame(transactions)

# Inicializar o modelo de embeddings globalmente
@st.cache_resource(show_spinner="Carregando modelo...")
def get_embedding_model():
    return SentenceTransformer('neuralmind/bert-base-portuguese-cased')

# Cache para embeddings já calculados
@st.cache_data(show_spinner=False)
def get_text_embedding(text, _model):
    return _model.encode(text.lower().strip(), convert_to_tensor=False)

# Função para normalizar texto
def normalize_text(text):
    """Normaliza o texto removendo acentos, caracteres especiais e convertendo para minúsculo"""
    if not isinstance(text, str) or not text.strip():
        return ""
    
    # Remove acentos e converte para minúsculo
    text = text.lower().strip()
    # Remove caracteres especiais mantendo números e pontos
    text = re.sub(r'[^a-z0-9\s\.]', ' ', text)
    # Remove espaços múltiplos
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

# Função para processar palavras-chave
def process_keywords(keywords_text):
    """Processa texto de palavras-chave em uma lista"""
    if not keywords_text or not isinstance(keywords_text, str):
        return []
    
    # Divide por vírgula, ponto e vírgula ou nova linha
    separators = r'[,;\n]'
    keywords = re.split(separators, keywords_text)
    
    # Remove espaços em branco e filtra palavras vazias
    return [k.strip() for k in keywords if k.strip()]

# Cache para embeddings de palavras-chave
@st.cache_data(show_spinner=False)
def prepare_keyword_embeddings(categorias, _model):
    """Prepara embeddings para palavras-chave"""
    keyword_data = []
    
    # Debug para verificar as categorias
    print("Categorias recebidas:", categorias)
    
    for categoria, palavras_texto in categorias.items():
        # Processa as palavras-chave do texto
        palavras = process_keywords(palavras_texto)
        print(f"Categoria: {categoria}, Palavras processadas: {palavras}")  # Debug
        
        for palavra in palavras:
            if not palavra:
                continue
            # Calcula embedding e armazena com metadados
            embedding = get_text_embedding(palavra, _model)
            keyword_data.append({
                'categoria': categoria,
                'palavra': palavra,
                'embedding': embedding
            })
    
    # Debug para verificar os dados processados
    print(f"Total de palavras-chave processadas: {len(keyword_data)}")
    
    # Converter para arrays numpy para operações vetorizadas
    if keyword_data:
        embeddings = np.stack([item['embedding'] for item in keyword_data])
        categorias = [item['categoria'] for item in keyword_data]
        palavras = [item['palavra'] for item in keyword_data]
        return embeddings, categorias, palavras
    return np.array([]), [], []

def calculate_match_score(historico, palavra_chave):
    """Calcula um score de correspondência usando múltiplas técnicas"""
    if not historico or not palavra_chave:
        return 0.0
    
    # Normaliza os textos
    historico = normalize_text(historico)
    palavra_chave = normalize_text(palavra_chave)
    
    # 1. Match exato (peso 1.0)
    if palavra_chave == historico:
        return 1.0
    
    # 2. Contém palavra completa (peso 0.9)
    palavras_historico = set(historico.split())
    palavras_chave = set(palavra_chave.split())
    if palavras_chave.issubset(palavras_historico):
        return 0.9
    
    # 3. Contém parte da palavra-chave (peso 0.8)
    if palavra_chave in historico:
        return 0.8
    
    # 4. Similaridade de sequência
    similarity = SequenceMatcher(None, historico, palavra_chave).ratio()
    
    # 5. Palavras em comum
    palavras_comuns = palavras_historico.intersection(palavras_chave)
    if palavras_comuns:
        word_match_ratio = len(palavras_comuns) / len(palavras_chave)
        # Combina similaridade de sequência com palavras em comum
        return max(similarity * 0.7, word_match_ratio * 0.6)
    
    return similarity * 0.5  # Peso menor para similaridade pura

def categorize_transaction(historico, categorias):
    """Categoriza uma transação baseado no histórico"""
    # Debug - mostrar entrada
    if st.session_state.get('debug_mode', False):
        st.write(" Analisando transação:")
        st.write(f"- Histórico: '{historico}'")
        st.write("- Categorias disponíveis:")
        for cat, palavras in categorias.items():
            if palavras and palavras.strip():
                st.write(f"  • {cat}: {palavras}")
    
    if not isinstance(historico, str) or not historico.strip():
        return 'Outros'
    
    # Normaliza o histórico
    historico_norm = normalize_text(historico)
    
    # Debug - mostrar normalização
    if st.session_state.get('debug_mode', False):
        st.write(f"- Histórico normalizado: '{historico_norm}'")
    
    max_score = 0
    best_categoria = 'Outros'
    best_palavra = None
    
    for categoria, palavras_texto in categorias.items():
        # Pula categorias vazias
        if not palavras_texto or not palavras_texto.strip():
            continue
        
        palavras = process_keywords(palavras_texto)
        for palavra in palavras:
            palavra_norm = normalize_text(palavra)
            
            # Match exato
            if palavra_norm == historico_norm:
                if st.session_state.get('debug_mode', False):
                    st.write(f" Match exato: '{palavra}' -> {categoria}")
                return categoria
            
            # Contém palavra
            if palavra_norm in historico_norm:
                if st.session_state.get('debug_mode', False):
                    st.write(f" Palavra encontrada: '{palavra}' -> {categoria}")
                return categoria
            
            # Similaridade
            similarity = SequenceMatcher(None, historico_norm, palavra_norm).ratio()
            if similarity > max_score:
                max_score = similarity
                best_categoria = categoria
                best_palavra = palavra
    
    # Debug - resultado
    if st.session_state.get('debug_mode', False):
        if max_score >= 0.7:
            st.write(f" Melhor match: '{best_palavra}' -> {best_categoria} (score: {max_score:.2f})")
        else:
            st.write(f" Sem match satisfatório (melhor score: {max_score:.2f})")
        st.write("---")
    
    return best_categoria if max_score >= 0.7 else 'Outros'

def calculate_similarities_vectorized(query_embedding, keyword_embeddings):
    # Normalizar os vetores
    query_norm = np.linalg.norm(query_embedding)
    keyword_norms = np.linalg.norm(keyword_embeddings, axis=1)
    
    # Calcular similaridade do cosseno vetorizada
    similarities = np.dot(keyword_embeddings, query_embedding) / (keyword_norms * query_norm)
    return similarities

def to_excel(df):
    """Converte o DataFrame para Excel"""
    output = BytesIO()
    with pd.ExcelWriter(output, engine='openpyxl') as writer:
        # Criar uma cópia do DataFrame para não modificar o original
        df_excel = df.copy()
        
        # Formatar a data no padrão brasileiro
        df_excel['Data'] = df_excel['Data'].dt.strftime('%d/%m/%y')
        
        # Formatar a coluna de valor
        df_excel['Valor'] = df_excel['Valor'].apply(formatar_valor)
        
        # Salvar no Excel
        df_excel.to_excel(writer, index=False, sheet_name='Transações')
        
        # Ajusta a largura das colunas
        worksheet = writer.sheets['Transações']
        
        # Encontrar o índice da coluna 'Valor'
        valor_col_idx = df_excel.columns.get_loc('Valor')
        valor_col_letter = chr(65 + valor_col_idx)
        
        for idx, col in enumerate(df_excel.columns):
            # Ajustar largura da coluna
            max_length = max(df_excel[col].astype(str).apply(len).max(),
                           len(str(col))) + 2
            worksheet.column_dimensions[chr(65 + idx)].width = max_length
            
            # Alinhar coluna de valor à direita
            if col == 'Valor':
                for row in range(1, len(df_excel) + 2):  # +2 para incluir o cabeçalho
                    cell = worksheet[f"{valor_col_letter}{row}"]
                    cell.alignment = Alignment(horizontal='right')
                    
    return output.getvalue()

def criar_grafico_pizza(df, titulo):
    """Cria gráfico de pizza com valores por categoria"""
    dados = df.groupby('Categoria')['Valor'].sum().round(2)
    fig = px.pie(
        values=dados.values,
        names=dados.index,
        title=titulo,
        hole=0.4,
        color_discrete_sequence=px.colors.qualitative.Set3
    )
    return fig

def criar_grafico_barras_mensais(df, titulo):
    """Cria gráfico de barras com valores mensais"""
    # Converter data para datetime se ainda não for
    if not pd.api.types.is_datetime64_any_dtype(df['Data']):
        df['Data'] = pd.to_datetime(df['Data'], format='%d/%m/%y')
    
    # Agrupar por mês
    df_mensal = df.copy()
    df_mensal['Mês_Ano'] = df_mensal['Data'].dt.strftime('%Y-%m')
    valores_mensais = df_mensal.groupby('Mês_Ano')['Valor'].sum().reset_index()
    
    # Formatar rótulos dos meses
    valores_mensais['Mês'] = pd.to_datetime(valores_mensais['Mês_Ano'] + '-01').dt.strftime('%b/%y')
    
    # Ordenar por mês
    valores_mensais = valores_mensais.sort_values('Mês_Ano')
    
    # Criar gráfico de barras
    fig = px.bar(
        valores_mensais,
        x='Mês',
        y='Valor',
        title=titulo,
        labels={'Valor': 'Valor (R$)', 'Mês': 'Mês'},
        color_discrete_sequence=['#2ecc71' if titulo == 'Receitas Mensais' else '#e74c3c']
    )
    
    # Personalizar layout
    fig.update_layout(
        xaxis_tickangle=-45,
        showlegend=False,
        height=400
    )
    
    return fig

def criar_indicadores(df):
    """Cria indicadores financeiros"""
    total_receitas = df[df['Valor'] > 0]['Valor'].sum()
    total_despesas = abs(df[df['Valor'] < 0]['Valor'].sum())
    saldo = total_receitas - total_despesas
    
    return {
        'receitas': total_receitas,
        'despesas': total_despesas,
        'saldo': saldo
    }

def filter_transactions(df, search_text, valor_pesquisa=None):
    """Filtra transações por histórico e valor"""
    df_filtrado = df.copy()
    
    # Filtro por texto no histórico
    if search_text:
        df_filtrado = df_filtrado[df_filtrado['Historico'].str.contains(search_text, case=False, na=False)]
    
    # Filtro por valor específico
    if valor_pesquisa is not None and valor_pesquisa != 0:
        # Debug - mostrar valores antes do filtro
        if st.session_state.get('debug_mode', False):
            st.write(" Debug do filtro por valor:")
            st.write(f"Valor pesquisado: {valor_pesquisa}")
            st.write("Primeiros 5 valores no DataFrame:")
            st.write(df_filtrado['Valor'].head())
        
        # Tenta encontrar o valor exato
        mask = df_filtrado['Valor'].apply(lambda x: abs(float(x)) == abs(float(valor_pesquisa)))
        df_filtrado = df_filtrado[mask]
        
        # Debug - mostrar resultado
        if st.session_state.get('debug_mode', False):
            st.write(f"Registros encontrados: {len(df_filtrado)}")
            if not df_filtrado.empty:
                st.write("Valores encontrados:")
                st.write(df_filtrado['Valor'].tolist())
    
    return df_filtrado

def main():
    # Área de configuração no sidebar
    with st.sidebar:
        st.title(" Configurações")
        
        # Modo Debug
        st.subheader(" Modo Debug")
        debug_mode = st.checkbox('Ativar modo debug', key='debug_mode', value=False)
        if debug_mode:
            st.info(' Modo debug ativado!')
        
        st.divider()
        
        # Upload do arquivo de categorias
        st.subheader(" Categorias")
        uploaded_file = st.file_uploader("Carregar arquivo Excel", type=['xlsx'])
        
        if uploaded_file is not None:
            try:
                df = pd.read_excel(uploaded_file)
                
                if 'categoria' not in df.columns or 'palavras_chave' not in df.columns:
                    st.error(" O arquivo deve ter as colunas: 'categoria' e 'palavras_chave'")
                    st.write("Colunas encontradas:", list(df.columns))
                    return
                
                categorias = {}
                for _, row in df.iterrows():
                    cat = str(row['categoria']).strip()
                    pal = str(row['palavras_chave']).strip()
                    if cat and pal:
                        categorias[cat] = pal
                
                if not categorias:
                    st.warning(" Nenhuma categoria encontrada no Excel")
                    return
                
                st.session_state.categorias = categorias
                st.success(f" {len(categorias)} categorias carregadas!")
                
                if debug_mode:
                    st.write("Categorias:")
                    for cat, pal in categorias.items():
                        st.write(f"- {cat}: {pal}")
            
            except Exception as e:
                st.error(f" Erro ao carregar Excel: {str(e)}")
                if debug_mode:
                    st.exception(e)
                return
        else:
            st.info(" Carregue o arquivo de categorias")
            if 'categorias' not in st.session_state:
                st.session_state.categorias = {}
            return
        
        # Mostrar categorias
        if st.session_state.categorias:
            st.divider()
            st.subheader("Categorias Carregadas")
            
            for cat, palavras in st.session_state.categorias.items():
                if cat != 'Outros':
                    with st.expander(f" {cat}"):
                        st.text_input('Palavras-chave:', value=palavras, key=f'cat_{cat}')
            
            # Adicionar categoria
            st.divider()
            st.subheader(" Nova Categoria")
            nova_cat = st.text_input('Nome:').strip()
            novas_pal = st.text_area('Palavras-chave:').strip()
            
            if st.button('Adicionar', type='primary'):
                if nova_cat and novas_pal:
                    st.session_state.categorias[nova_cat] = novas_pal
                    st.success(f' Categoria "{nova_cat}" adicionada!')
                    st.rerun()
                else:
                    st.warning(' Preencha todos os campos!')
    # Conteúdo principal
    st.title(" Dashboard Financeiro")
    
    st.markdown("""
        <div style='background-color: #f0f2f6; padding: 1rem; border-radius: 0.5rem; margin-bottom: 2rem;'>
            <h4></h4>
            <p>1. Certifique-se que o arquivo de categorias (categorias.xlsx) está configurado</p>
            <p>2. Digite o caminho da pasta que contém os arquivos OFX</p>
            <p>3. Clique em "Processar Arquivos" para visualizar o dashboard</p>
        </div>
    """, unsafe_allow_html=True)
    
    # Input para o diretório dos arquivos OFX
    col1, col2 = st.columns([3, 1])
    with col1:
        directory = st.text_input(' Caminho da pasta com os arquivos OFX:', 'd:\FluxoCaixa', label_visibility="visible")
    with col2:
        process_button = st.button(' Processar Arquivos', use_container_width=True, type='primary')
    
    if process_button:
        if os.path.exists(directory):
            try:
                with st.spinner(''):
                    # Ler os arquivos OFX
                    df = read_ofx_files(directory)
                
                if len(df) > 0:
                    # Converter data para datetime
                    df['Data'] = pd.to_datetime(df['Data'], format='%d/%m/%y')
                    
                    # Categorizar transações
                    if st.session_state.categorias:
                        df['Categoria'] = df['Historico'].apply(
                            lambda x: categorize_transaction(x, st.session_state.categorias)
                        )
                    else:
                        df['Categoria'] = 'Outros'
                    
                    # Adicionar coluna de operação
                    df['Operação'] = df['Valor'].apply(lambda x: 'Receita' if x > 0 else 'Despesa')
                    
                    # Adicionar colunas de data para filtro
                    df['Ano'] = df['Data'].dt.year
                    df['Mês'] = df['Data'].dt.month
                    
                    # Guardar o DataFrame no session_state
                    st.session_state.df = df
                    
                    st.success('')
                else:
                    st.warning('')
            except Exception as e:
                st.error(f'')
        else:
            st.error('')
            return
    
    # Se temos dados para mostrar
    if st.session_state.df is not None:
        df = st.session_state.df
        
        # Filtros
        st.markdown("### ")
        col1, col2, col3, col4 = st.columns(4)
        
        with col1:
            categorias_unicas = ['Todas'] + sorted(df['Categoria'].unique().tolist())
            categoria_selecionada = st.selectbox(
                'Categoria:',
                categorias_unicas,
                key='categoria_filtro',
                label_visibility="visible"
            )
        
        with col2:
            operacoes_unicas = ['Todas', 'Receita', 'Despesa']
            operacao_selecionada = st.selectbox(
                'Operação:',
                operacoes_unicas,
                key='operacao_filtro',
                label_visibility="visible"
            )
        
        with col3:
            anos_unicos = sorted(df['Ano'].unique().tolist())
            ano_selecionado = st.selectbox(
                'Ano:',
                anos_unicos,
                key='ano_filtro',
                label_visibility="visible"
            )
        
        with col4:
            meses_unicos = [0] + sorted(df['Mês'].unique().tolist())
            mes_selecionado = st.selectbox(
                'Mês:',
                meses_unicos,
                format_func=lambda x: "Todos" if x == 0 else calendar.month_name[x],
                key='mes_filtro',
                label_visibility="visible"
            )
        
        # Aplicar filtros
        df_filtrado = df.copy()
        
        # Filtro de categoria
        if categoria_selecionada != 'Todas':
            df_filtrado = df_filtrado[df_filtrado['Categoria'] == categoria_selecionada]
        
        # Filtro de operação
        if operacao_selecionada != 'Todas':
            df_filtrado = df_filtrado[df_filtrado['Operação'] == operacao_selecionada]
        
        # Filtro de ano
        df_filtrado = df_filtrado[df_filtrado['Ano'] == ano_selecionado]
        
        # Filtro de mês (apenas se não for "Todos")
        if mes_selecionado != 0:
            df_filtrado = df_filtrado[df_filtrado['Mês'] == mes_selecionado]
        
        # Dashboard
        st.markdown("## ")
        
        # Métricas principais (usando dados filtrados)
        indicadores = criar_indicadores(df_filtrado)
        col1, col2, col3 = st.columns(3)
        
        with col1:
            st.metric(
                " Receitas",
                formatar_valor(indicadores['receitas']),
                delta=None
            )
        
        with col2:
            st.metric(
                " Despesas",
                formatar_valor(indicadores['despesas']),
                delta=None
            )
        
        with col3:
            st.metric(
                " Saldo",
                formatar_valor(indicadores['saldo']),
                delta=None
            )
        
        # Gráficos (usando dados filtrados)
        col1, col2 = st.columns(2)
        
        with col1:
            # Gráfico de Pizza - Despesas por Categoria
            df_despesas = df_filtrado[df_filtrado['Valor'] < 0].copy()
            df_despesas['Valor'] = df_despesas['Valor'].abs()
            if not df_despesas.empty:
                fig_pizza = criar_grafico_pizza(df_despesas, "Distribuição de Despesas por Categoria")
                st.plotly_chart(fig_pizza, use_container_width=True)
            else:
                st.info("Sem dados de despesas para o período selecionado")
        
        with col2:
            # Gráfico de Barras - Evolução Mensal
            if not df_filtrado.empty:
                fig_barras = criar_grafico_barras_mensais(df_filtrado, "Evolução Mensal por Categoria")
                st.plotly_chart(fig_barras, use_container_width=True)
            else:
                st.info("Sem dados para o período selecionado")
        
        # Tabelas (usando dados filtrados)
        st.markdown("## ")
        tab1, tab2 = st.tabs([" Transações", " Resumo por Categoria"])
        
        with tab1:
            # Inicializar estados se não existirem
            if 'clear_historico' not in st.session_state:
                st.session_state.clear_historico = False
            if 'clear_valor' not in st.session_state:
                st.session_state.clear_valor = False
            
            # Campo de busca
            col1, col2 = st.columns([3, 1])
            
            with col1:
                search_container = st.container()
                search_col1, search_col2 = search_container.columns([6, 1])
                with search_col1:
                    # Se clear_historico for True, passa string vazia como valor inicial
                    search_text = st.text_input(
                        " Pesquisar no histórico:",
                        value="" if st.session_state.clear_historico else None,
                        placeholder="Digite parte do histórico...",
                        label_visibility="visible",
                        help="Digite para filtrar transações por histórico",
                        key="search_historico"
                    )
                    # Reset flag após usar
                    if st.session_state.clear_historico:
                        st.session_state.clear_historico = False
                
                with search_col2:
                    if search_text:  # Só mostra o botão se houver texto
                        if st.button("❌", key="btn_clear_historico", help="Limpar pesquisa", use_container_width=True):
                            st.session_state.clear_historico = True
                            st.rerun()
            
            with col2:
                valor_container = st.container()
                valor_col1, valor_col2 = valor_container.columns([6, 1])
                with valor_col1:
                    # Se clear_valor for True, usa 0.0 como valor inicial
                    valor_pesquisa = st.number_input(
                        "💰 Valor específico:",
                        value=0.0 if st.session_state.clear_valor else None,
                        step=0.01,
                        format="%.2f",
                        label_visibility="visible",
                        help="Digite um valor específico para filtrar (positivo ou negativo)",
                        key="search_valor"
                    )
                    # Reset flag após usar
                    if st.session_state.clear_valor:
                        st.session_state.clear_valor = False
                
                with valor_col2:
                    if valor_pesquisa != 0:  # Só mostra o botão se houver valor
                        if st.button("❌", key="btn_clear_valor", help="Limpar valor", use_container_width=True):
                            st.session_state.clear_valor = True
                            st.rerun()
            
            # Debug - mostrar valor pesquisado
            if st.session_state.get('debug_mode', False) and valor_pesquisa != 0:
                st.write(f"Valor para filtrar: {valor_pesquisa}")
            
            # Filtrar transações
            filtered_df = filter_transactions(df_filtrado, search_text, valor_pesquisa)
            
            # Mostrar contagem de resultados
            if search_text or valor_pesquisa != 0:
                total_results = len(filtered_df)
                st.write(f"Encontradas {total_results} transações.")
            
            # Criar cópia formatada dos dados filtrados
            df_display_filtrado = filtered_df.copy()
            df_display_filtrado['Data'] = df_display_filtrado['Data'].dt.strftime('%d/%m/%y')
            
            # Remover colunas de filtro
            df_display_filtrado = df_display_filtrado.drop(['Ano', 'Mês'], axis=1)
            
            # Converter para string formatada antes de exibir
            df_display_filtrado['Valor'] = df_display_filtrado['Valor'].apply(formatar_valor)
            
            st.dataframe(
                df_display_filtrado,
                use_container_width=True,
                hide_index=True,
                column_config={
                    "Valor": st.column_config.Column(
                        "Valor",
                        help="Valor da transação",
                        width="medium",
                        required=True
                    )
                }
            )
        
        with tab2:
            # Criar o resumo por categoria
            resumo = df_filtrado.groupby('Categoria').agg({
                'Valor': ['sum', 'count']
            }).round(2)
            resumo.columns = ['Total', 'Quantidade']
            resumo['Total'] = resumo['Total'].apply(formatar_valor)
            
            # Para cada categoria, criar uma seção expansível
            for categoria in sorted(df_filtrado['Categoria'].unique()):
                # Criar o header com os totais
                dados_categoria = resumo.loc[categoria]
                col1, col2, col3 = st.columns([2, 1, 1])
                with col1:
                    expandir = st.expander(f" {categoria}")
                with col2:
                    st.text(f"Total: {dados_categoria['Total']}")
                with col3:
                    st.text(f"Qtd: {dados_categoria['Quantidade']}")
                
                # Mostrar os detalhes dentro do expander
                with expandir:
                    # Filtrar transações da categoria
                    df_categoria = df_filtrado[df_filtrado['Categoria'] == categoria].copy()
                    
                    # Ordenar por data crescente
                    df_categoria = df_categoria.sort_values('Data')
                    
                    # Preparar dados para exibição
                    df_categoria['Data'] = df_categoria['Data'].dt.strftime('%d/%m/%y')
                    df_categoria['Valor'] = df_categoria['Valor'].apply(formatar_valor)
                    
                    # Mostrar apenas as colunas relevantes
                    df_display = df_categoria[['Data', 'Historico', 'Valor', 'Operação']]
                    
                    # Exibir tabela de detalhes
                    st.dataframe(
                        df_display,
                        use_container_width=True,
                        hide_index=True,
                        column_config={
                            "Valor": st.column_config.Column(
                                "Valor",
                                help="Valor da transação",
                                width="medium",
                                required=True
                            )
                        }
                    )
        
        # Botão para download do Excel
        st.markdown("### ")
        excel_data = to_excel(df_filtrado)
        st.download_button(
            label=" Baixar Excel com Transações",
            data=excel_data,
            file_name="transacoes_categorizadas.xlsx",
            mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            use_container_width=True
        )

if __name__ == "__main__":
    main()