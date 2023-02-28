    drop table TB_MORADORES;
    drop table TB_VISITANTES;
    drop table TB_PRESTADORES;
    drop table TB_UNIDADES;
    drop table TB_PESSOAS;
    drop table TB_EMPRESAS;
 
    
   CREATE TABLE TB_PESSOAS(
        ID NUMBER(10,0) NOT NULL,
        NOME VARCHAR2(200),
        DOC_RG VARCHAR2(10),
        data_nascimento DATE,
        NUMERO_TELEFONE NUMBER(10,0),
        EMAIL VARCHAR2(150),
        ENDERECO VARCHAR2(100),
        NUMERO NUMBER(10,0),
        COMPLEMENTO VARCHAR2(50),
        SEXO CHAR( 1 ) CHECK (SEXO IN ( 'F',  'M' ))
        );
    
    CREATE TABLE TB_EMPRESAS(
        ID NUMBER (10,0),
        CNPJ NUMBER (15,0),
        RAZAO_SOCIAL VARCHAR2(200),
        NOME_FANTASIA VARCHAR2 (200)
    );
    
    
    CREATE TABLE TB_UNIDADES(
        EMPRESA_ID NUMBER (10,0),
        ID NUMBER (10,0),
        UNIDADE NUMBER(5,0),
        BLOCO VARCHAR2 (10),
        QUADRA VARCHAR2 (10),
        LOTE VARCHAR2 (10),
        PROPRIETARIO_ID NUMBER(10,0)
        
    );
    
    CREATE TABLE TB_MORADORES(
        PESSOA_ID NUMBER(10,0),
        UNIDADE_ID NUMBER (10,0),
        PRIORIDADE NUMBER (2,0),
        PERMISSAO VARCHAR2(10)
        
    );
    
    CREATE TABLE TB_VISITANTES(
        PESSOA_ID NUMBER(10,0),
        UNIDADE_ID NUMBER (10,0)
        
    );
    
    CREATE TABLE TB_PRESTADORES(
        PESSOA_ID NUMBER(10,0),
        UNIDADE_ID NUMBER (10,0),
        NOME_EMPRESA VARCHAR2(100)
        
    );
    
    -- Adicionando as PKs
    ALTER TABLE TB_PESSOAS
    ADD CONSTRAINT PK_PESSOA_ID PRIMARY KEY(ID);
    
    ALTER TABLE TB_EMPRESAS
    ADD CONSTRAINT PK_EMPRESA_ID PRIMARY KEY (ID);
    
    ALTER TABLE TB_UNIDADES
    ADD CONSTRAINT PK_UNIDADE_ID PRIMARY KEY(ID);
    
    ALTER TABLE TB_MORADORES
    ADD CONSTRAINT PK_MORADOR_ID PRIMARY KEY(PESSOA_ID,UNIDADE_ID);
    
    ALTER TABLE TB_VISITANTES
    ADD CONSTRAINT PK_VISITANTE_ID PRIMARY KEY(PESSOA_ID,UNIDADE_ID);
    
    ALTER TABLE TB_PRESTADORES
    ADD CONSTRAINT PK_PRESTADOR_ID PRIMARY KEY(PESSOA_ID,UNIDADE_ID);
    
    
    -- Adicionando as FKs
    ALTER TABLE TB_UNIDADES
    ADD CONSTRAINT FK_UNIDADE_EMPRESA_ID FOREIGN KEY (EMPRESA_ID) REFERENCES TB_EMPRESAS;
  
    ALTER TABLE TB_UNIDADES
    ADD CONSTRAINT FK_UBIDADE_PROPRIETARIO_ID FOREIGN KEY (PROPRIETARIO_ID) REFERENCES TB_PESSOAS;
    
    ALTER TABLE TB_MORADORES
    ADD CONSTRAINT FK_PESSOA_MORADOR_ID FOREIGN KEY (PESSOA_ID) REFERENCES TB_PESSOAS;
    
    ALTER TABLE TB_MORADORES
    ADD CONSTRAINT FK_UNIDADE_MORADOR_ID FOREIGN KEY (UNIDADE_ID) REFERENCES TB_UNIDADES (ID);
    
    ALTER TABLE TB_VISITANTES
    ADD CONSTRAINT FK_VISITANTE_PESSOA_ID FOREIGN KEY (PESSOA_ID) REFERENCES TB_PESSOAS;
    
    ALTER TABLE TB_VISITANTES
    ADD CONSTRAINT FK_VISITANTE_UNIDADE_ID FOREIGN KEY (UNIDADE_ID) REFERENCES TB_UNIDADES;
    
    ALTER TABLE TB_PRESTADORES
    ADD CONSTRAINT FK_PRESTADOR_PESSOA_ID FOREIGN KEY (PESSOA_ID) REFERENCES TB_PESSOAS;
    
    ALTER TABLE TB_PRESTADORES
    ADD CONSTRAINT FK_PRESTADOR_UNIDADE_ID FOREIGN KEY (UNIDADE_ID) REFERENCES TB_UNIDADES;
    
    
     -- MORADORES
    INSERT INTO TB_PESSOAS VALUES (100,'EVANDRO RODRIGUES', '348875452', date '1964-04-12', '998420001', 'evandrogames@gmail.com', 'Rua Baldeana', '87', 'Apartamento N53', 'M');
    INSERT INTO TB_PESSOAS VALUES (101,'GABRIEL LEITE', '883454634', date '2003-03-24', '998332401', 'gabrielleitecardoso123@gmail.com', 'Rua Pinduca Soares', '54', 'Apartamento K30', 'M');
    INSERT INTO TB_PESSOAS VALUES (102,'GUILHERME KHOLER', '788748983', date '1999-01-13', '996046496', 'kohlerguilherme@gmail.com', 'Rua Santo Sergio', '64', 'Apartamento J32', 'M');
    INSERT INTO TB_PESSOAS VALUES (103,'LUCAS ROSSI', '993496344', date '2003-02-03', '998051796', 'lucaobublemusicas@gmail.com', 'Rua Maria Das Dores', '75', 'Apartamento C32', 'M');
    INSERT INTO TB_PESSOAS VALUES (104,'REGIANE LARA', '534954323', date '1995-10-09', '996497005', 'regianeeratop@gmail.com', 'Rua Octagono', '56', 'Apartamento Z23', 'F');
    
    
    -- CONDOMINIOS
    INSERT INTO TB_EMPRESAS VALUES (10,12765478000115,'Vale LTDA', 'Vale');
    INSERT INTO TB_EMPRESAS VALUES (11,12345678000188,'Gremista LTDA', 'Gremista');
    INSERT INTO TB_EMPRESAS VALUES (12,85214758000199,'Quadradas LTDA', 'Quadrada');
    INSERT INTO TB_EMPRESAS VALUES (13,95178538000127,'Tijolo LTDA', 'Cimento');
    INSERT INTO TB_EMPRESAS VALUES (14,14796578000133,'Saleme LTDA', 'Salame');
    
    -- UNIDADES DE CONDOMINIOS
    INSERT INTO TB_UNIDADES VALUES (10,100,1,'A', '34', '02', 101);
    INSERT INTO TB_UNIDADES VALUES (10,101,2,'A', '65', '01', 102);
    INSERT INTO TB_UNIDADES VALUES (10,102,3,'A', '37', '03', 103);
    INSERT INTO TB_UNIDADES VALUES (10,103,4,'A', '38', '05', 103);
    INSERT INTO TB_UNIDADES VALUES (10,104,11,'A', '39', '06', 103);
    INSERT INTO TB_UNIDADES VALUES (11,220,1,'B', '40', '07', 104);
    INSERT INTO TB_UNIDADES VALUES (11,221,2,'B', '41', '08', 100);
    INSERT INTO TB_UNIDADES VALUES (11,222,3,'B', '42', '09', 101);
    INSERT INTO TB_UNIDADES VALUES (11,223,4,'B', '43', '10', 104);
    INSERT INTO TB_UNIDADES VALUES (11,224,5,'B', '44', '11', 103);
    
    
    -- VISITANTES
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,SEXO) VALUES (3000,'JOSE','332903596', date '1996-04-28', '889532953', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,SEXO) VALUES (3001,'MATHES','413617683', date '1989-07-13', '223439503', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,SEXO) VALUES (3002,'PRISCILA','278087780', date '1996-04-28', '946939593', 'F');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,SEXO) VALUES (3003,'ALBERTO','320830694', date '1996-04-28', '995953432', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,SEXO) VALUES (3004,'TAIS','468350217', date '1996-04-28', '349539432', 'F');
    
    INSERT INTO TB_VISITANTES VALUES (3000,100);
    INSERT INTO TB_VISITANTES VALUES (3001,100);
    INSERT INTO TB_VISITANTES VALUES (3002,100);
    INSERT INTO TB_VISITANTES VALUES (3003,101);
    INSERT INTO TB_VISITANTES VALUES (3004,101);

    -- MORADORES
    INSERT INTO TB_MORADORES VALUES (100,100,1,'Total');
    INSERT INTO TB_MORADORES VALUES (101,101,1,'Parcial');
    INSERT INTO TB_MORADORES VALUES (102,102,1,'Parcial');
    INSERT INTO TB_MORADORES VALUES (103,103,1,'Minima');
    INSERT INTO TB_MORADORES VALUES (104,104,1,'Total');
    
    -- PRESTADORES
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,EMAIL,SEXO) VALUES (3015,'ELIAS','305477045', date '1995-01-23', '939494975', 'eliastrabalhos@hotmail.com', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,EMAIL,SEXO) VALUES (3016,'JOSAFÁ','435057011', date '1986-03-16',  '366893925', 'josafavarredor@gmail.com', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,EMAIL,SEXO) VALUES (3017,'URIAS','446922322', date '2004-10-03', '173633965', 'contateuriasorei@gmail.com', 'M');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,EMAIL,SEXO) VALUES (3018,'OBADIAS','237146978', date '1993-06-29', '945991234', 'obadiadadesdas@hotmail.com', 'F');
    INSERT INTO TB_PESSOAS (ID,NOME,DOC_RG,DATA_NASCIMENTO,NUMERO_TELEFONE,EMAIL,SEXO) VALUES (3019,'NATÃ','232129915', date '2001-01-08', '939459235', 'mikaelnatasilva@gmail.com', 'M');
    
    INSERT INTO TB_PRESTADORES VALUES (3015,101,'GBTEC');
    INSERT INTO TB_PRESTADORES VALUES (3016,101,'IBIUTEC');
    INSERT INTO TB_PRESTADORES VALUES (3017,104,'ROSSI CONSULTORIA');
    INSERT INTO TB_PRESTADORES VALUES (3018,104,'KohlerCompuiters');
    INSERT INTO TB_PRESTADORES VALUES (3019,100,'ServicosGratiseDequalidade');

    
    select * from tb_pessoas;
    select * from tb_empresas;
    select * from tb_unidades;
    select * from tb_moradores;
    select * from tb_visitantes;
    select * from tb_prestadores;
    
    
    -- 1- Acrescente uma coluna nova “data de inclusão” no formato date, na primeira tabela criada. 
        ALTER TABLE TB_PESSOAS 
        ADD DATA_INCLUSAO date;
        
    -- 2- Altere o valor desta coluna colocando a data do sistema.
        update TB_PESSOAS SET DATA_INCLUSAO = to_date(sysdate,'dd-MM-yyyy');
        
    -- 3- Altere o tamanho de qualquer campo da tabela principal de seu sistema e acrescente a restrição de não permitir valores nulos.
        ALTER TABLE TB_PESSOAS
        MODIFY NOME VARCHAR2(150) NOT NULL;
    
    -- 4- Excluir a coluna acrescentada na questão 1.
        ALTER TABLE TB_PESSOAS
        DROP COLUMN DATA_INCLUSAO;
    
    -- 5- Escreva um comando que altere o conteúdo de uma coluna (escolha qq tabela).
    -- Objetivo: Alterar o conteúdo da coluna Bloco de TB_UNIDADES do tipo varchar2(10) para  o tipo char(1).
        ALTER TABLE TB_Unidades MODIFY(BLOCO CHAR(1));
    
    -- 6- Escreva um comando Select  utilizando a cláusula LIKE.
    -- Objetivo: Selecionar o ID da unidade e o ID do respectivo proprietário das unidades que estão no bloco A.
        select ID, PROPRIETARIO_ID from TB_UNIDADES where Bloco like 'A';
        
    -- 7- Escreva um comando Select que utilize a cláusula where com 2 condições, e order by.
    -- Objetivo: Mostrar o id, nome, email, endereço e permissão dos moradores que são do sexo masculino e possuem o tipo de permissão Parcial ordenando os pelos nomes.
        select id, Nome, email, endereco, permissao from TB_MORADORES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID where TB_PESSOAS.SEXO = 'M' and TB_MORADORES.PERMISSAO = 'Parcial' order by NOME;
        
    -- 8- Escreva um comando Select  utilizando a cláusula distinct
    -- Objetivo: Mostrar o id e o nome dos proprietários de unidades no condomínio 
        select distinct proprietario_id, nome from TB_UNIDADES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_UNIDADES.PROPRIETARIO_ID;
        
    -- 9- Escreva um comando que utilize uma função de soma de datas dentro da cláusula where.
    -- Objetivo: Mostrar a média da soma das idades dos moradores masculinos.
        select (round(SUM((SYSDATE - data_nascimento)/365.25)))/COUNT(*) "Media da soma de idade dos moradores masculinos" from TB_MORADORES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.pessoa_id where sexo = 'M'
        
    -- 10- Escreva um comando select para listar a data do sistema mostrando dia, mês, ano, hora, minuto e segundo.
        select TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') "Agora" FROM DUAL;
        
    -- 11- Escreva um exemplo de junção entre 2 tabelas que retorne várias linhas.
    -- Objetivo: Mostrar todos os dados das pessoas que são prestadores os ordenando por unidades.
        select * from TB_PRESTADORES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_PRESTADORES.PESSOA_ID order by UNIDADE_ID;
    
    -- 12- Escreva um exemplo de junção entre 3 tabelas.
    -- Objetivo: Mostrar o nome da empresa, o id das unidades em sua posse e os seus referentes proprietários.
        select TB_EMPRESAS.NOME_FANTASIA, TB_UNIDADES.ID "ID DA UNIDADE", TB_PESSOAS.NOME from TB_UNIDADES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_UNIDADES.PROPRIETARIO_ID inner join TB_EMPRESAS ON TB_UNIDADES.EMPRESA_ID = TB_EMPRESAS.ID;
        
    -- 13- Dê um exemplo de comando DML  que utilize a função  count(*).
    -- Objetivo: Mostrar o id das unidades e o número de prestadores que trabalham em cada unidade.
        select TB_PRESTADORES.UNIDADE_ID, COUNT(*) "Prestador por Unidade" from TB_PRESTADORES inner join TB_UNIDADES on TB_UNIDADES.id = TB_PRESTADORES.UNIDADE_ID  group by TB_PRESTADORES.UNIDADE_ID
        
    -- 14- Dê um exemplo de comando DML  que utilize a função  Sum().
    -- Objetivo: Mostrar a soma da quantidade de visitantes que são do sexo feminino
        select SUM(COUNT(*)) "Soma das visitantes femininas" from TB_VISITANTES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_VISITANTES.PESSOA_ID where sexo = 'F' group by PESSOA_ID
        
    -- 15- Explique para que serve a claúsula group by e dê 1 exemplo de sua utilização.
    -- Objetivo: Mostrar a contagem de unidades por bloco.
        select bloco, count(*)"Qtd de unidades" from TB_UNIDADES group by bloco order by bloco;
    
    -- 16- Dê um exemplo usando com junção de tabelas com a clausula Group by.
    -- Objetivo: Mostrar a quantidade de unidades que cada condomínio possui.
        select TB_EMPRESAS.NOME_FANTASIA "Nome da Empresa", COUNT(*) "Unidades da empresa" from TB_UNIDADES inner join TB_EMPRESAS on TB_UNIDADES.EMPRESA_ID = TB_EMPRESAS.ID  group by TB_UNIDADES.EMPRESA_ID, TB_EMPRESAS.NOME_FANTASIA;
    
    -- 17- Explique para que serve a claúsula having e dê 1 exemplo de sua utilização.
    -- Objetivo: Mostrar o id, nome dos moradores e a quantidade de visitantes para os moradores que já tiveram mais de 1 visitante.
        select TB_MORADORES.PESSOA_ID "Id morador", TB_PESSOAS.NOME "Nome morador", COUNT(*) "Numero de visitantes" from TB_VISITANTES inner join TB_UNIDADES on TB_VISITANTES.UNIDADE_ID = TB_UNIDADES.ID inner join TB_MORADORES on TB_MORADORES.PESSOA_ID = TB_UNIDADES.PROPRIETARIO_ID INNER JOIN TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID group by TB_MORADORES.PESSOA_ID, TB_PESSOAS.NOME having COUNT(*) > 1;

    
    -- 18- Usando junção de várias tabelas, escreva um comando que liste os campos do documento principal gerado pelo seu sistema.  Onde houver chave estrangeira liste a descrição correspondente.
    -- Por exemplo=> em “Assinatura de Revista”, deve haver um código de assinante. Neste caso, liste o nome do assinante além do código deste.
    -- Objetivo: Mostrar o id da pessoa, nome e quantos visitantes e prestadores cada um tem por sua unidade.
        select TB_MORADORES.PESSOA_ID "Id morador", TB_PESSOAS.NOME "Nome morador", NULL "Numero de visitantes", COUNT(TB_PRESTADORES.UNIDADE_ID) "Numero de prestadores"  from TB_MORADORES inner join TB_UNIDADES 
        on TB_MORADORES.PESSOA_ID = TB_UNIDADES.PROPRIETARIO_ID 
        inner join TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID 
        inner join TB_PRESTADORES on TB_PRESTADORES.UNIDADE_ID = TB_UNIDADES.ID 
        group by TB_MORADORES.PESSOA_ID, TB_PESSOAS.NOME, TB_PRESTADORES.UNIDADE_ID
        union
        select TB_MORADORES.PESSOA_ID "Id morador", TB_PESSOAS.NOME "Nome morador", COUNT(*), NULL "Numero de prestadores" from TB_VISITANTES 
        inner join TB_UNIDADES on TB_VISITANTES.UNIDADE_ID = TB_UNIDADES.ID 
        inner join TB_MORADORES on TB_MORADORES.PESSOA_ID = TB_UNIDADES.PROPRIETARIO_ID 
        INNER JOIN TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID 
        group by TB_MORADORES.PESSOA_ID, TB_PESSOAS.NOME
    
    
    -- 19- Dê um exemplo de como você pode criar uma tabela a partir de outra já existente.
    -- Objetivo: Criar uma nova tabela com apenas os moradores da geração Z (nascidos entre 1990 e 2010) a partir das tabelas existentes.
        CREATE TABLE TB_MORADORES_GEN_Z as select * FROM TB_MORADORES inner join TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID where TB_PESSOAS.DATA_NASCIMENTO between date '1990-01-01' and date '2010-01-01';
        
        select * from TB_MORADORES_GEN_Z;

    -- 20- Para a criação das tabelas deste exercício foi necessário estabelecer uma ordem? Justifique.
    -- Explicacao no pdf do trabalho.
    
    
    -- 21- Dê um exemplo de uma consulta usando a operação de união
    -- Objetivo: Mostrar apenas os nomes dos moradores e dos visitantes da tabela pessoas.
        select NOME from TB_MORADORES inner join TB_PESSOAS on TB_MORADORES.PESSOA_ID = TB_PESSOAS.ID union select NOME from TB_VISITANTES inner join TB_PESSOAS on TB_VISITANTES.PESSOA_ID = TB_PESSOAS.ID;
        
    -- 22- Dê um exemplo de uma consulta usando a operação de interseção.
    -- Objetivo: Mostrar todos os moradores que receberam visitantes.
        select TB_UNIDADES.PROPRIETARIO_ID, TB_PESSOAS.NOME "Nome morador" from TB_UNIDADES INNER JOIN TB_PESSOAS on TB_PESSOAS.ID = TB_UNIDADES.PROPRIETARIO_ID
        intersect 
        select TB_MORADORES.PESSOA_ID, TB_PESSOAS.NOME "Nome morador" from TB_VISITANTES inner join TB_UNIDADES on TB_VISITANTES.UNIDADE_ID = TB_UNIDADES.ID  inner join TB_MORADORES on TB_MORADORES.PESSOA_ID = TB_UNIDADES.PROPRIETARIO_ID  inner join TB_PESSOAS on TB_PESSOAS.ID = TB_MORADORES.PESSOA_ID; 
        
        
    -- 23- Dê um exemplo de uma consulta usando a operação de diferença.   
    -- Objetivo: Mostrar os IDs das pessoas excluindo os visitantes.
        select ID from TB_PESSOAS minus select  PESSOA_ID from TB_VISITANTES;
    