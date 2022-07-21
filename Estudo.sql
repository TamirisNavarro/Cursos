## Comandos básicos SQL

--Selecionando todos os campos da tabela de clientes (verificando todo o conteúdo).
SELECT * FROM tabela_de_clientes;

--Selecionando campos específicos da tabela de clientes.
SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, 
CEP, DATA_DE_NASCIMENTO,
IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA 
FROM tabela_de_clientes;

--Alterando o nome da coluna CPF para "IDENTIFICADOR" e nome para "CLIENTE" 
SELECT CPF as INDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

--Selecionando todos os campos da tabela de clientes (verificando todo o conteúdo).
SELECT * FROM tabela_de_produtos;

--Filtrando a tabela de produtos pelo código de produto específico. 
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

--Registro genérico que venha antes ou depois do texto que está procurando.
SELECT * FROM tabela_de_clientes WHERE nome LIKE "%Soares%"

--Nenhuma combinação igual de embalagem e tamanho será selecionada, usando o distinct dessa forma.
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

--Ordenando as informações (se só usar o order by, sem desc ou asc, ele já ordenar de forma ascendente).
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

--COUNT E GROUP BY
SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;

--INNER JOIN
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;

--RIGHT JOIN
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B
RIGHT JOIN tabela_de_clientes A ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

--LEFT JOIN
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015

--CASE
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO 
FROM tabela_de_produtos;

