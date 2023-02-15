/*Utilizando 1 query, obtenha a quantidade de depoimentos (testimonials) que o usuário com id 435 efetuou, incluindo o seu nome.*/
SELECT users.name AS "writer", count(*) AS "testimonialCount"
FROM testimonials
JOIN users
ON testimonials."writerId" = users.id
WHERE users.id=435
Group BY users.name;