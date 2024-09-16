----------------------------------

      --FUNÇÔES SINGLE ROW--

----------------------------------

-- O que é? --

-- Uma função que retorna um valor para cada linha recuperada/exibida pelo seu SELECT.
-- Há tambem funções de multiple rows onde retornará mais um valor por linha recuperada pelo SELECT.

-- Características --

-- Podem manipular itens de dados
-- Receber argumentos e retornar valor
-- Atuam sobre cada linha retornada
-- Retornam um resultado por linha
-- podem modificar o tipo de dado
-- Podem ser aninhados 
-- Recebem argumentos que podem ser colunas ou expressões

-- Sintaxe --

--nome_função [(arg1,agr2,...)]

-- Funções que manipulam caracteres --

-- CASE-CONVERSION FUNCTIONS

-- lower - Torna todas os caracteres em minusculo. 
-- upper - Torna todos os caracteres em maiusculo.
-- initcap - Torna o primeiro caracter maisculo.

-- CHARACTER-MANIPULATION FUNCTIONS

-- concat - Concatena Strings na pesquisa.
-- substr - Retorna um trecho de uma string, com base no numero usado como parametro
-- length - Retorna o tamanho, em caracteres, do dado utilizado como parametro.
-- instr - Retorna a posição da primeira ocorrencia do parametro utulizado.
-- lpad | rpad - Utilizado para adicionar caracteres em uma determinada area do valor retornado, sendo este começando da direita ou esquerda.
-- trim - Utilizado para remover um um parametro especifico do valor retornado pela query.
-- replace - Utilizado para substituir valores retornados na query.


-------------------------

-------------------------

-- Se executarmos esta query, ela não retornará valor algum, pois em querys os caracteres são case sensitiva
-- Ou seja, se a String comparada nao for identica ao valor armazenado, não será comparado como iguais
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

-- Mas para solucionarmos este tipo de problema, podemos utilizar a função UPPER
-- Aqui convertemos todos os valores na colum 'last_name' para maisculo, sendo assim possivel de se comparar as Strings
SELECT employee_id, last_name, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

-- Assim podemos usar o LOWER e o INITCAP com a mesma lógica, facilitando assim buscas por valores presentes nas tabelas.


-------------------------

-------------------------

-- Funçoes numericas --


-- Round - Arredonda para a casa decimal especificada.
-- Trunc - Trunca (corta) o valor para a casa decimal especificada.
-- Mod - Retorna o resto da divisão.   
-- ABS - Retorna o valor absoluto do valor.
-- SQRT - Retorna a raiz quadrada do valor.


-- Neste caso a primeira ocorrencia do ROUND arredondara na segunda casa decimal. Ou seja 45.92
-- Já na segunda como não há digito de precisão, Sendo assim arredondado com base no valor total. ou seja 46
SELECT ROUND(45.923,2), ROUND(45.923,0)
FROM dual;


-------------------------

-------------------------

-- Funçoes tipo date --

-- Sysdate - Retorna a data atual.
-- Months_between - Retorna o numero de meses entre as datas.
-- Add_months - Adiciona meses a uma data.
-- Next_day - Retorna o proximo dia relativo a data especificada.
-- Last_day - Retorna o ultimo dia do mes.
-- Round - Arredonda datas
-- Trunc - Trunca datas

-- Retorna o dia atual
SELECT SYSDATE
FROM dual;

--Retorna os meses entre as datas usadas como parametro.
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date),2) "MESES DE TRABALHO"
FROM employees;



-- Podemos também executar calculos com datas --

-- por exemplo, ao manipularmos uma data com um numero, data + numero. 
-- ela manipulará com base em dias, seja adicionando ou subtraindo. + 3 adicionará 3 dias, -3 subtrairá 3 dias.
-- podemos tambem calcular uma data com outra, seja subtraindo ou adicionando.

-- As possibilidades são inumeras
-- Neste exemplo retornará as semanas em que um funcionario já trabalhou na empresa
SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO'"
FROM employees;
