/*Utilizando 1 query, obtenha o maior salário das vagas (`jobs`) ativas (**active** sendo true) e o nome das posições (`roles`) dessas vagas ordenadas de forma ascendente*/
SELECT MAX(salary) AS "maximumSalary", roles.name AS role 
FROM jobs 
JOIN roles
ON jobs."roleId" = roles.id
WHERE active=true 
GROUP BY "roleId", roles.id
order by "maximumSalary" asc;