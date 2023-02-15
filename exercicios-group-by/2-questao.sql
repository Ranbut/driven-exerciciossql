/*Utilizando 1 query, obtenha a quantidade de graduações (educations) por usuário, incluindo o seu id.*/
SELECT "userId", COUNT(*) AS educations FROM educations GROUP BY "userId";