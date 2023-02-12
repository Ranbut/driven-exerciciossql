/*Utilizando uma query, obtenha todos os cursos (courses) que o usuário com 
id 30 já finalizou, incluindo o nome da escola. O que indica que um usuário*/
SELECT t1.id, t1.name, t2.name AS course, t3.name AS school, "endDate"
FROM educations
INNER JOIN users AS t1
ON educations."userId"=t1.id
INNER JOIN courses AS t2
ON educations."courseId"=t2.id
INNER JOIN schools AS t3
ON educations."schoolId"=t3.id
WHERE t1.id=30 AND status='finished';