
CREATE TABLE IF NOT EXISTS transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    historico VARCHAR(255),
    valor DECIMAL(10,2),
    categoria VARCHAR(100),
    operacao VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Recebimento de Proventos - Data balanc.: 02/01/2024', 8054.82, 'Salario/EB', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Compra com Cartão - Data balanc.: 02/01/2024', -82.50, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Compra com Cartão - Data balanc.: 02/01/2024', -9.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Compra com Cartão - Data balanc.: 02/01/2024', -3.79, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Compra com Cartão - Data balanc.: 02/01/2024', -13.90, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Pagto conta telefone - Data balanc.: 02/01/2024', -119.99, 'Internet/Celular', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Pagto Energia Elétrica - Data balanc.: 02/01/2024', -516.28, 'Eletropaulo/Enel', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-02', 'Pagto Mensalidade Seguro - Data balanc.: 02/01/2024', -223.39, 'Seguro Auto', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-03', 'Compra com Cartão - Data balanc.: 03/01/2024', -210.20, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-03', 'Compra com Cartão - Data balanc.: 03/01/2024', -29.05, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-04', 'Compra com Cartão - Data balanc.: 04/01/2024', -33.82, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-04', 'Compra com Cartão - Data balanc.: 04/01/2024', -150.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-05', 'Compra com Cartão - Data balanc.: 05/01/2024', -8.90, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Recebido - Data balanc.: 08/01/2024', 55.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Recebido - Data balanc.: 08/01/2024', 6350.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Compra com Cartão - Data balanc.: 08/01/2024', -53.51, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Enviado - Data balanc.: 08/01/2024', -500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Enviado - Data balanc.: 08/01/2024', -220.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pagamento de Impostos - Data balanc.: 08/01/2024', -156.51, 'Veiculos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pagamento de Impostos - Data balanc.: 08/01/2024', -284.57, 'Veiculos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Enviado - Data balanc.: 08/01/2024', -2500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Enviado - Data balanc.: 08/01/2024', -290.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-08', 'Pix - Enviado - Data balanc.: 08/01/2024', -1000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-09', 'Compra com Cartão - Data balanc.: 09/01/2024', -45.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-10', 'Compra com Cartão - Data balanc.: 10/01/2024', -14.94, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-10', 'Pagto cartão crédito - Data balanc.: 10/01/2024', -7789.20, 'Outros', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-10', 'Tarifa Pacote de Serviços - Data balanc.: 10/01/2024', -14.55, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-11', 'Pix - Recebido - Data balanc.: 11/01/2024', 100.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-11', 'Compra com Cartão - Data balanc.: 11/01/2024', -8.68, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-11', 'Compra com Cartão - Data balanc.: 11/01/2024', -25.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-11', 'Pagamento de Boleto - Data balanc.: 11/01/2024', -466.58, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-11', 'Vivo Celular - Data balanc.: 11/01/2024', -320.00, 'Internet/Celular', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-12', 'Pix - Recebido - Data balanc.: 12/01/2024', 3512.45, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-12', 'Compra com Cartão - Data balanc.: 12/01/2024', -29.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-12', 'Pix - Enviado - Data balanc.: 12/01/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-15', 'Compra com Cartão - Data balanc.: 15/01/2024', -7.69, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-15', 'Banco 24 Horas - Data balanc.: 15/01/2024', -150.00, 'Saque', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-15', 'Pagamento de Boleto - Data balanc.: 15/01/2024', -3592.67, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-15', 'Pix - Agendamento - Data balanc.: 15/01/2024', -1850.00, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-15', 'Pagamento Pedágio - Data balanc.: 15/01/2024', -249.30, 'SemParar', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-17', 'Compra com Cartão - Data balanc.: 17/01/2024', -7.74, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-17', 'Pagamento Fatura de Água - Data balanc.: 17/01/2024', -410.14, 'Sabesp', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-18', 'Pix - Recebido - Data balanc.: 18/01/2024', 2500.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-19', 'Compra com Cartão - Data balanc.: 19/01/2024', -9.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-19', 'Compra com Cartão - Data balanc.: 19/01/2024', -162.41, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-22', 'Compra com Cartão - Data balanc.: 22/01/2024', -25.77, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-22', 'Pagamento de Impostos - Data balanc.: 22/01/2024', -273.24, 'Veiculos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-22', 'Pagamento de Boleto - Data balanc.: 22/01/2024', -669.14, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-23', 'Pix - Recebido - Data balanc.: 23/01/2024', 3549.37, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-23', 'Compra com Cartão - Data balanc.: 23/01/2024', -7.70, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-23', 'Pix - Enviado - Data balanc.: 23/01/2024', -200.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-24', 'Compra com Cartão - Data balanc.: 24/01/2024', -35.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-25', 'Tarifa MSG - Mês Anterior - Data balanc.: 25/01/2024', -5.00, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-26', 'Compra com Cartão - Data balanc.: 26/01/2024', -15.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-26', 'Compra com Cartão - Data balanc.: 26/01/2024', -14.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Compra com Cartão - Data balanc.: 29/01/2024', -28.64, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Compra com Cartão - Data balanc.: 29/01/2024', -50.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Compra com Cartão - Data balanc.: 29/01/2024', -17.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Compra com Cartão - Data balanc.: 29/01/2024', -36.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Pix - Enviado - Data balanc.: 29/01/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-29', 'Pagamento Fatura de Gás - Data balanc.: 29/01/2024', -50.22, 'ComGas', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-30', 'Pix - Recebido - Data balanc.: 30/01/2024', 230.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-30', 'Pagto Energia Elétrica - Data balanc.: 30/01/2024', -493.19, 'Eletropaulo/Enel', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Pix - Recebido - Data balanc.: 31/01/2024', 4846.57, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Pix - Recebido - Data balanc.: 31/01/2024', 2000.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Compra com Cartão - Data balanc.: 31/01/2024', -48.99, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Pix - Enviado - Data balanc.: 31/01/2024', -1500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Pix - Enviado - Data balanc.: 31/01/2024', -290.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-01-31', 'Pagto Mensalidade Seguro - Data balanc.: 31/01/2024', -223.39, 'Seguro Auto', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-01', 'Recebimento de Proventos - Data balanc.: 01/02/2024', 8054.82, 'Salario/EB', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-01', 'Compra com Cartão - Data balanc.: 01/02/2024', -33.73, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-01', 'Cobrança de Juros - Data balanc.: 01/02/2024', -10.77, 'Juros/IOF', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-01', 'Cobrança de I.O.F. - Data balanc.: 01/02/2024', -7.31, 'Juros/IOF', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-02', 'Compra com Cartão - Data balanc.: 02/02/2024', -20.97, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-02', 'Pix - Enviado - Data balanc.: 02/02/2024', -500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-02', 'Pix - Enviado - Data balanc.: 02/02/2024', -2500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-02', 'Pix - Enviado - Data balanc.: 02/02/2024', -136.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-02', 'Pagamento de Impostos - Data balanc.: 02/02/2024', -284.57, 'Veiculos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Compra com Cartão - Data balanc.: 05/02/2024', -84.36, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Compra com Cartão - Data balanc.: 05/02/2024', -11.07, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Compra com Cartão - Data balanc.: 05/02/2024', -18.90, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Compra com Cartão - Data balanc.: 05/02/2024', -24.40, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Compra com Cartão - Data balanc.: 05/02/2024', -96.28, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-05', 'Pagamento de Boleto - Data balanc.: 05/02/2024', -1407.72, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-06', 'Compra com Cartão - Data balanc.: 06/02/2024', -44.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-06', 'Pix - Enviado - Data balanc.: 06/02/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Compra com Cartão - Data balanc.: 07/02/2024', -10.26, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Compra com Cartão - Data balanc.: 07/02/2024', -29.86, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Compra com Cartão - Data balanc.: 07/02/2024', -54.87, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Compra com Cartão - Data balanc.: 07/02/2024', -25.07, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Compra com Cartão - Data balanc.: 07/02/2024', -6.29, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-07', 'Pix - Enviado - Data balanc.: 07/02/2024', -104.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-08', 'Pix - Enviado - Data balanc.: 08/02/2024', -200.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-09', 'Compra com Cartão - Data balanc.: 09/02/2024', -28.12, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-09', 'Pix - Enviado - Data balanc.: 09/02/2024', -600.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Recebido - Data balanc.: 14/02/2024', 530.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Recebido - Data balanc.: 14/02/2024', 6604.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Recebido - Data balanc.: 14/02/2024', 200.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -7.15, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -94.06, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -40.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -1.06, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -8.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -58.10, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -522.61, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -7.86, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Compra com Cartão - Data balanc.: 14/02/2024', -41.58, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pagamento de Boleto - Data balanc.: 14/02/2024', -185.91, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Enviado - Data balanc.: 14/02/2024', -200.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Enviado - Data balanc.: 14/02/2024', -500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pix - Enviado - Data balanc.: 14/02/2024', -380.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Pagto cartão crédito - Data balanc.: 14/02/2024', -6530.21, 'Outros', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Tarifa Pacote de Serviços - Data balanc.: 14/02/2024', -14.55, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-14', 'Vivo Celular - Data balanc.: 14/02/2024', -320.00, 'Internet/Celular', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Compra com Cartão - Data balanc.: 15/02/2024', -30.49, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Compra com Cartão - Data balanc.: 15/02/2024', -82.97, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Compra com Cartão - Data balanc.: 15/02/2024', -100.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Compra com Cartão - Data balanc.: 15/02/2024', -14.96, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Pagamento de Boleto - Data balanc.: 15/02/2024', -2984.38, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Pix - Enviado - Data balanc.: 15/02/2024', -190.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Pix - Enviado - Data balanc.: 15/02/2024', -690.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-15', 'Pagamento Pedágio - Data balanc.: 15/02/2024', -309.70, 'SemParar', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Compra com Cartão - Data balanc.: 16/02/2024', -13.20, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Compra com Cartão - Data balanc.: 16/02/2024', -30.49, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Pix - Enviado - Data balanc.: 16/02/2024', -2500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Pix - Enviado - Data balanc.: 16/02/2024', -1500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Pix - Enviado - Data balanc.: 16/02/2024', -380.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Pix - Enviado - Data balanc.: 16/02/2024', -45.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-16', 'Pagamento Fatura de Água - Data balanc.: 16/02/2024', -325.72, 'Sabesp', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-19', 'BB MM Juros e Moedas - Data balanc.: 19/02/2024', 2000.00, 'Aplicação', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-19', 'Pix - Recebido - Data balanc.: 19/02/2024', 500.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-19', 'Pix - Enviado - Data balanc.: 19/02/2024', -50.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Pix - Recebido - Data balanc.: 20/02/2024', 2500.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Pix - Recebido - Data balanc.: 20/02/2024', 4992.79, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Compra com Cartão - Data balanc.: 20/02/2024', -4.70, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Banco 24 Horas - Data balanc.: 20/02/2024', -100.00, 'Saque', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Pix - Enviado - Data balanc.: 20/02/2024', -120.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-20', 'Pix - Enviado - Data balanc.: 20/02/2024', -1000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-21', 'Pagamento de Boleto - Data balanc.: 21/02/2024', -485.12, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-22', 'Compra com Cartão - Data balanc.: 22/02/2024', -291.12, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-22', 'Compra com Cartão - Data balanc.: 22/02/2024', -15.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-22', 'Compra com Cartão - Data balanc.: 22/02/2024', -157.38, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-22', 'Pix - Enviado - Data balanc.: 22/02/2024', -500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-23', 'Compra com Cartão - Data balanc.: 23/02/2024', -53.90, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-23', 'Compra com Cartão - Data balanc.: 23/02/2024', -42.92, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-23', 'Pix - Enviado - Data balanc.: 23/02/2024', -2000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -17.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -267.49, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -27.90, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -57.93, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -102.11, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -15.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -69.64, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Compra com Cartão - Data balanc.: 26/02/2024', -69.80, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-26', 'Tarifa MSG - Mês Anterior - Data balanc.: 26/02/2024', -5.00, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-27', 'Compra com Cartão - Data balanc.: 27/02/2024', -43.96, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-28', 'Pix - Enviado - Data balanc.: 28/02/2024', -16.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-28', 'Pagamento Fatura de Gás - Data balanc.: 28/02/2024', -61.96, 'ComGas', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-29', 'Compra com Cartão - Data balanc.: 29/02/2024', -10.26, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-29', 'Compra com Cartão - Data balanc.: 29/02/2024', -33.82, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-29', 'Pix - Enviado - Data balanc.: 29/02/2024', -220.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-29', 'Pagto Energia Elétrica - Data balanc.: 29/02/2024', -420.43, 'Eletropaulo/Enel', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-02-29', 'Pagto Mensalidade Seguro - Data balanc.: 29/02/2024', -223.39, 'Seguro Auto', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Recebimento de Proventos - Data balanc.: 01/03/2024', 8065.86, 'Salario/EB', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Compra com Cartão - Data balanc.: 01/03/2024', -9.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Compra com Cartão - Data balanc.: 01/03/2024', -47.02, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Compra com Cartão - Data balanc.: 01/03/2024', -4.39, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Pix - Agendamento - Data balanc.: 01/03/2024', -2300.00, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Pix - Enviado - Data balanc.: 01/03/2024', -500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Cobrança de Juros - Data balanc.: 01/03/2024', -14.51, 'Juros/IOF', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-01', 'Cobrança de I.O.F. - Data balanc.: 01/03/2024', -7.61, 'Juros/IOF', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Compra com Cartão - Data balanc.: 04/03/2024', -13.63, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Compra com Cartão - Data balanc.: 04/03/2024', -12.20, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Pagamento de Boleto - Data balanc.: 04/03/2024', -1407.72, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Pix - Enviado - Data balanc.: 04/03/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Pix - Agendamento - Data balanc.: 04/03/2024', -500.00, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Pix - Agendamento - Data balanc.: 04/03/2024', -77.42, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-04', 'Pagamento de Impostos - Data balanc.: 04/03/2024', -284.57, 'Veiculos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-05', 'Compra com Cartão - Data balanc.: 05/03/2024', -12.06, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-05', 'Pix - Enviado - Data balanc.: 05/03/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-05', 'Pix - Enviado - Data balanc.: 05/03/2024', -2500.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-06', 'Compra com Cartão - Data balanc.: 06/03/2024', -33.70, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-06', 'Pix - Enviado - Data balanc.: 06/03/2024', -109.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-07', 'Compra com Cartão - Data balanc.: 07/03/2024', -30.50, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-07', 'Pix - Enviado - Data balanc.: 07/03/2024', -375.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-08', 'BB MM Juros e Moedas - Data balanc.: 08/03/2024', 5000.00, 'Aplicação', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-08', 'Pix - Agendamento - Data balanc.: 08/03/2024', -2000.00, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-08', 'Pix - Agendamento - Data balanc.: 08/03/2024', -500.00, 'PIX/Agendado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-08', 'Pix - Enviado - Data balanc.: 08/03/2024', -375.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Pix - Recebido - Data balanc.: 11/03/2024', 500.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Pix - Recebido - Data balanc.: 11/03/2024', 6604.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Compra com Cartão - Data balanc.: 11/03/2024', -4.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Compra com Cartão - Data balanc.: 11/03/2024', -7.95, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Compra com Cartão - Data balanc.: 11/03/2024', -32.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Pagamento de Boleto - Data balanc.: 11/03/2024', -185.91, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Pagto cartão crédito - Data balanc.: 11/03/2024', -8651.55, 'Outros', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-11', 'Tarifa Pacote de Serviços - Data balanc.: 11/03/2024', -14.55, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-12', 'Banco 24 Horas - Data balanc.: 12/03/2024', -150.00, 'Saque', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-12', 'Pix - Enviado - Data balanc.: 12/03/2024', -44.44, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Compra com Cartão - Data balanc.: 13/03/2024', -14.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Compra com Cartão - Data balanc.: 13/03/2024', -20.80, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Pix - Enviado - Data balanc.: 13/03/2024', -135.25, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Pix - Enviado - Data balanc.: 13/03/2024', -128.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Pix - Enviado - Data balanc.: 13/03/2024', -150.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-13', 'Vivo Celular - Data balanc.: 13/03/2024', -320.00, 'Internet/Celular', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-14', 'Pix - Enviado - Data balanc.: 14/03/2024', -230.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'BB MM Juros e Moedas - Data balanc.: 15/03/2024', 4000.00, 'Aplicação', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pix - Recebido - Data balanc.: 15/03/2024', 4687.73, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pagamento de Boleto - Data balanc.: 15/03/2024', -2986.48, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pix - Enviado - Data balanc.: 15/03/2024', -2000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pix - Enviado - Data balanc.: 15/03/2024', -1000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pix - Enviado - Data balanc.: 15/03/2024', -1000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-15', 'Pagamento Pedágio - Data balanc.: 15/03/2024', -184.30, 'SemParar', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -70.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -120.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -15.45, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -39.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -14.82, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Compra com Cartão - Data balanc.: 18/03/2024', -25.60, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-18', 'Pagamento de Boleto - Data balanc.: 18/03/2024', -114.90, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-19', 'Compra com Cartão - Data balanc.: 19/03/2024', -25.00, 'Compra/Debito', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-19', 'Pagamento Fatura de Água - Data balanc.: 19/03/2024', -353.86, 'Sabesp', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-20', 'Pix - Enviado - Data balanc.: 20/03/2024', -200.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-20', 'Pagto Tributo Municipal - Data balanc.: 20/03/2024', -439.88, 'IPTU/Osasco', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-21', 'Pix - Recebido - Data balanc.: 21/03/2024', 2400.00, 'PIX/Recebido', 'Receita');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-21', 'Pagamento de Boleto - Data balanc.: 21/03/2024', -410.85, 'Boletos', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-21', 'Pix - Enviado - Data balanc.: 21/03/2024', -100.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-22', 'Pix - Enviado - Data balanc.: 22/03/2024', -1000.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-25', 'Pix - Enviado - Data balanc.: 25/03/2024', -50.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-25', 'Tarifa MSG - Mês Anterior - Data balanc.: 25/03/2024', -5.00, 'Tarifa Bancaria', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-27', 'Pix - Enviado - Data balanc.: 27/03/2024', -284.00, 'PIX/Enviado', 'Despesa');
INSERT INTO transacoes (data, historico, valor, categoria, operacao)
VALUES ('2024-03-27', 'Pagamento Fatura de Gás - Data balanc.: 27/03/2024', -39.16, 'ComGas', 'Despesa');