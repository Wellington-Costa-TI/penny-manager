-- Criar o schema 'penny-manager' se ainda não existir
CREATE SCHEMA IF NOT EXISTS "penny-manager";

-- Alterar o search_path para incluir o novo schema
ALTER DATABASE "penny-manager" SET search_path TO public, "penny-manager";

-- Tabela 'usuario': Armazena informações dos usuários
CREATE TABLE IF NOT EXISTS "penny-manager"."usuario" (
    id_usuario SERIAL PRIMARY KEY, -- Identificador único do usuário
    nome VARCHAR(200), -- Nome do usuário
    login VARCHAR(100), -- Nome de login do usuário
    email VARCHAR(200), -- Endereço de e-mail do usuário
    senha VARCHAR(500) -- Senha do usuário
);

-- Comentários da tabela 'usuario'
COMMENT ON TABLE "penny-manager"."usuario" IS 'Representa os usuários do sitema';

-- Comentários das colunas da tabela 'usuario'
COMMENT ON COLUMN "penny-manager"."usuario".id_usuario IS 'Identificador único do usuário';
COMMENT ON COLUMN "penny-manager"."usuario".nome IS 'Nome do usuário';
COMMENT ON COLUMN "penny-manager"."usuario".login IS 'Nome de login do usuário';
COMMENT ON COLUMN "penny-manager"."usuario".email IS 'Endereço de e-mail do usuário';
COMMENT ON COLUMN "penny-manager"."usuario".senha IS 'Senha do usuário';

-- Sequência 'sequence_usuario_id': Sequência para geração de IDs de usuários
CREATE SEQUENCE IF NOT EXISTS "penny-manager"."sequence_usuario_id";

-- Tabela 'cartao': Armazena informações dos cartões
CREATE TABLE IF NOT EXISTS "penny-manager"."cartao" (
    id_cartao SERIAL PRIMARY KEY, -- Identificador único do cartão
    descricao VARCHAR(100), -- Descrição do cartão
    limite NUMERIC(10, 2), -- Limite do cartão
    vencimento DATE, -- Data de vencimento do cartão
    id_usuario INTEGER, -- Chave estrangeira para o usuário associado ao cartão
    CONSTRAINT id_usuario_cartao
        FOREIGN KEY (id_usuario)
        REFERENCES "penny-manager"."usuario" (id_usuario)
        ON DELETE CASCADE
);

-- Comentários da tabela 'cartao'
COMMENT ON TABLE "penny-manager"."cartao" IS 'Representa os cartoẽs do usuário';

-- Comentários das colunas da tabela 'cartao'
COMMENT ON COLUMN "penny-manager"."cartao".id_cartao IS 'Identificador único do cartão';
COMMENT ON COLUMN "penny-manager"."cartao".descricao IS 'Descrição do cartão';
COMMENT ON COLUMN "penny-manager"."cartao".limite IS 'Limite do cartão';
COMMENT ON COLUMN "penny-manager"."cartao".vencimento IS 'Data de vencimento do cartão';
COMMENT ON COLUMN "penny-manager"."cartao".id_usuario IS 'Chave estrangeira para o usuário associado ao cartão';

-- Sequência 'sequence_cartao_id': Sequência para geração de IDs de cartões
CREATE SEQUENCE IF NOT EXISTS "penny-manager"."sequence_cartao_id";

-- Tabela 'conta': Armazena informações sobre contas
CREATE TABLE IF NOT EXISTS "penny-manager"."conta" (
    id_conta SERIAL PRIMARY KEY, -- Identificador único da conta
    descricao VARCHAR(100), -- Descrição da conta
    montante NUMERIC(10, 2), -- Montante da conta
    id_usuario INTEGER, -- Chave estrangeira para o usuário associado à conta
    CONSTRAINT id_usuario_conta
        FOREIGN KEY (id_usuario)
        REFERENCES "penny-manager"."usuario" (id_usuario)
        ON DELETE CASCADE
);

-- Comentários da tabela 'conta'
COMMENT ON TABLE "penny-manager"."conta" IS 'Representa as entradas de receita do usuário';

-- Comentários das colunas da tabela 'conta'
COMMENT ON COLUMN "penny-manager"."conta".id_conta IS 'Identificador único da conta';
COMMENT ON COLUMN "penny-manager"."conta".descricao IS 'Descrição da conta';
COMMENT ON COLUMN "penny-manager"."conta".montante IS 'Montante da conta';
COMMENT ON COLUMN "penny-manager"."conta".id_usuario IS 'Chave estrangeira para o usuário associado à conta';

-- Sequência 'sequence_conta_id': Sequência para geração de IDs de contas
CREATE SEQUENCE IF NOT EXISTS "penny-manager"."sequence_conta_id";


-- Tabela 'receita': Armazena informações sobre receita
CREATE TABLE IF NOT EXISTS "penny-manager"."receita" (
    id_receita SERIAL PRIMARY KEY, -- Identificador único da receita
    descricao VARCHAR(200), -- Descrição da receita
    data DATE, -- Data da receita
    valor NUMERIC(10, 2), -- Valor da receita
    id_conta INTEGER, -- Chave estrangeira para a conta associada à receita
    CONSTRAINT id_conta_receita
        FOREIGN KEY (id_conta)
        REFERENCES "penny-manager"."conta" (id_conta)
        ON DELETE CASCADE  
);

-- Comentários da tabela 'receita'
COMMENT ON TABLE "penny-manager"."receita" IS 'Representa as entradas de receita do usuário';

-- Comentários das colunas da tabela 'receita'
COMMENT ON COLUMN "penny-manager"."receita".id_receita IS 'Identificador único da receita';
COMMENT ON COLUMN "penny-manager"."receita".descricao IS 'Descrição da receita';
COMMENT ON COLUMN "penny-manager"."receita".data IS 'Data da receita';
COMMENT ON COLUMN "penny-manager"."receita".valor IS 'Valor da receita';
COMMENT ON COLUMN "penny-manager"."receita".id_conta IS 'Chave estrangeira para a conta associada à receita';

-- Sequência 'sequence_receita_id': Sequência para geração de IDs de receitas
CREATE SEQUENCE IF NOT EXISTS "penny-manager"."sequence_receita_id";

-- Tabela 'despesa': Armazena informações sobre despesas
CREATE TABLE IF NOT EXISTS "penny-manager"."despesa" (
    id_despesa SERIAL PRIMARY KEY, -- Identificador único da despesa
    descricao VARCHAR(100), -- Descrição da despesa
    categoria VARCHAR(25), -- categoria em que a despesa se encaixa
    dt_faturamento DATE, -- Data de faturamento da despesa
    vl_despesa NUMERIC(10, 2), -- Valor da despesa
    parcela INTEGER, -- Número da parcela da despesa
    id_conta INTEGER, -- Chave estrangeira para a conta associada à despesa
    id_cartao INTEGER, -- Chave estrangeira para o cartão associado à despesa
    CONSTRAINT id_conta_despesa
        FOREIGN KEY (id_conta)
        REFERENCES "penny-manager"."conta" (id_conta)
        ON DELETE CASCADE,
    CONSTRAINT id_cartao_despesa
        FOREIGN KEY (id_cartao)
        REFERENCES "penny-manager"."cartao" (id_cartao)
        ON DELETE CASCADE   
);

-- Comentários da tabela 'receita'
COMMENT ON TABLE "penny-manager"."despesa" IS 'Representa as entradas de despesas do usuário';

-- Comentários das colunas da tabela 'despesa'
COMMENT ON COLUMN "penny-manager"."despesa".id_despesa IS 'Identificador único da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".descricao IS 'Descrição da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".categoria IS 'Categoria da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".dt_faturamento IS 'Data de faturamento da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".vl_despesa IS 'Valor da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".parcela IS 'Número da parcela da despesa';
COMMENT ON COLUMN "penny-manager"."despesa".id_conta IS 'Chave estrangeira para a conta associada à despesa';
COMMENT ON COLUMN "penny-manager"."despesa".id_cartao IS 'Chave estrangeira para o cartão associado à despesa';

-- Sequência 'sequence_despesa_id': Sequência para geração de IDs de despesas
CREATE SEQUENCE IF NOT EXISTS "penny-manager"."sequence_despesa_id";

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

   