---=======================================================================================
---                            INSERÇÃO DE DADOS
---=======================================================================================

-- Inserção de dados na tabela 'usuario'
INSERT INTO "penny-manager"."usuario" (id_usuario, nome, login, email, senha)
VALUES 
    (nextval('"penny-manager"."sequence_usuario_id"'), 'Wellington de Oliveira Costa', 'wcosta', 'wellington.costa.edf@gmail.com', 'fev@2024');

-- Inserção de dados na tabela 'cartao'
INSERT INTO "penny-manager"."cartao" (id_cartao, descricao, limite, vencimento, id_usuario)
VALUES 
    (nextval('"penny-manager"."sequence_cartao_id"'), 'Ourocard', 5200.00, '2024-02-16', 1);

-- Inserção de dados na tabela 'conta'
INSERT INTO "penny-manager"."conta" (id_conta, descricao, montante, id_usuario)
VALUES 
    (nextval('"penny-manager"."sequence_conta_id"'), 'Banco do Brasil', 0.00, 1);

-- Inserção de dados na tabela 'receita'
INSERT INTO "penny-manager"."receita" (id_receita, descricao, data, valor, id_conta)
VALUES 
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-01-15', 7374.99, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Extra',   '2023-01-15',  500.00, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-02-15', 5886.64, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-03-15', 4135.51, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-04-15', 4135.51, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-05-15', 4800.00, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-06-15', 4135.51, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-07-15', 4303.43, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-08-15', 4996.31, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-09-15', 5321.64, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-10-15', 4303.43, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-11-15', 7750.33, 1),
    (nextval('"penny-manager"."sequence_receita_id"'), 'Salário', '2023-12-15', 5249.79, 1);


-- Inserção de dados na tabela 'despesa'
INSERT INTO "penny-manager"."despesa" (id_despesa, descricao, categoria, dt_faturamento, vl_despesa, parcela, id_conta, id_cartao)
VALUES 
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-01-15', 883.40, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-02-15', 1222.48, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'MRCD. LVR. 5/6', '2023-03-15', 20.70, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Uber', '2023-03-15', 26.09, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Amazon', '2023-03-15', 98.98, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Almoço Natal', '2023-03-15', 56.98, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Mistery', '2023-03-15', 112.96, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Roupas', '2023-03-15', 39.90, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Gasolina', '2023-03-15', 27.95, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Farmacia', '2023-03-15', 19.24, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'LANCHES', '2023-03-15', 305.42, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-04-15', 986.36, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-05-15', 1042.12, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-06-15', 654.80, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-07-15', 1159.18, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-08-15', 1086.72, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-09-15', 1178.04, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-10-15', 1476.44, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-11-15', 1547.63, 1, NULL, 1),
    (nextval('"penny-manager"."sequence_despesa_id"'),'GERAL', 'Total cartão', '2023-12-15', 1177.74, 1, NULL, 1);

   