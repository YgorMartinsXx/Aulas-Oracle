-- Iniciando comandos de pesquisas (Query)

-- Strings em consulta são sensitivas, ou seja, é necessário respeitar todas as suas especificações
-- Seja ela maiuscula ou minuscula, acentuação etc.

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

-- Neste exemplo retornará dois funcionários que tem o ultimo nome como 'King'
-- Mas caso usemos 'king' com 'K' minusculo, não aparecerá ninguém.
SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'king';
-- não retornará funcionários.

-- Podemos usar comparações com datas.
SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

--------------------
-- Podemos usar diversos operadores na clausula WHERE.
--------------------

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;
-- Neste caso usamos o Operador de verificação > 'maior' mas também podemos usar o perador < 'menor' com a mesma lógica.


-- Neste caso usaremos a clausula BETWEEN e o AND para verificarmos valores que estejam dentro de um determinado alcance.
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

--Neste caso usaremo a clausula IN, onde fara uma verificação de dominio.
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_FROG', 'FI_ACCOUNT', 'SA_REP');
-- Nos retornara todos os ID que contenham alguma destas Strings.


-- Podemos usar o operador Like para utilizarmos caracteres que podem ser substituidos por outros caracteres.
-- Como '%' e ou '_'.
-- O operador Percent '%' retorna qualquer valor antes ou após sua aparição(sem limite de caracteres).
-- O operador Underline '_' retorna qualquer valor onde há sua aparição. Porém somente um unico valor para cada Underline usado.
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa$';
-- retornará todos os nomes que começaram com Sa. Neste caso Sarah, Samuel, Sarath
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE '_a$';
-- Retornará qualquer nome que tenha a segunda letra de seu nome um 'a'
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE '$a';
-- Retornará qualquer nome que tenha a ultima letra do nome um 'a


-- Devemos tomar cuidado ao manipularmos valores nulos. qualquer expressão usada com Nulo Retornará Nulo. qualquer comparação com Nulo reotornará p boleano NULL
SELECT first_name, manager_id
FROM employees
WHERE manager_id = NULL;
-- Neste caso retornará uma tabela vazia.

-- Para podermos verificar valores Nulos, é necessário usar o operador 'IS'. Este operador verificará a presença de valores Nulos. Diferente dos outros operadores.
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;


                    -- Resumo sobre operadores lógicos --

-- AND compara duas condições, e retorna somente os valores que satisfaça essas duas condições(TRUE)
-- OR compara duas condições, e reotorna os valores que satisfação pelo menos uma das condições(TRUE)
-- NOT retorna a negação da condição

-- AND 
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG';
-- Retorna somente aqueles que tem o salario maior ou igual a 5000, e que tenha o job_id 'It_PROG'

-- OR
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG'
-- Retorna todos aqueles que atendam pelo menos uma dessas condições.

-- NOT
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id NOT IN ('IT_PROG','FI_Account','SA_REP');
-- Retorna todos aqueles que NAO façam parte desta lista.


-----------------------
-----------------------

--ORDER BY Utilizada para ordenar a linhas recuperadas.
--ASC: Ordem Crescente, Default
--DESC: Ordem Decrescente 
-
-- A cláusula ORDER BY deve ser usada sempre no final do comando SELECT(Query).

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC; --Ordem padrão do SELECT

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC; --Alteração para ordem Descrescente.
--

-- Tambem podemos ordenar utilizando a posição numérica da coluna:
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Se pode usar a cláusula ORDER BY para múltiplas colunas ou expressões.
--- Ordenando por multiplas colunas
SELECT last_name, department_id, salario
FROM employees
ORDER BY department_id, salario DESC;

----------------------
----------------------

-- Podemos usar o '&' como variavel de substituição.
-- Por exemplo:
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;
-- Neste caso aparecerá um prompt de valor e como a variavel usada foi a employee_id
-- você poderá escolher o ID desejado para a consulta.(101)(102)etc.
