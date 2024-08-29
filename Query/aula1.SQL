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
-- Podemos usar diversos operadores lógicos na clausula WHERE.
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
