/*Utilizando uma query, obtenha as empresas (companies) para as quais o usuário 
com id 50 trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o
campo endDate da tabela experiences. Se ele estiver null (IS NULL), significa 
que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá.*/
SELECT t1.id, t1.name, t2.name AS role, t3.name AS company, "startDate"
FROM experiences
INNER JOIN users AS t1
ON experiences."userId"=t1.id
INNER JOIN roles AS t2
ON experiences."roleId"=t2.id
INNER JOIN companies AS t3
ON experiences."companyId"=t3.id
WHERE t1.id=50 AND "endDate" IS NOT NULL;