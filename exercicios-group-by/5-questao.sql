/*Utilizando 1 query, obtenha os 3 cursos (courses) e escolas (schools) com a maior quantidade de alunos (educations) que estão cursando (status ongoing) ou finalizaram (status finished)*/
SELECT school.name AS school, course.name AS course, COUNT(*) AS "studentsCount", status
FROM educations
INNER JOIN schools AS school
ON educations."schoolId" = school.id
INNER JOIN courses AS course
ON educations."courseId" = course.id
WHERE status='finished' OR status='ongoing'
GROUP BY status, school.name, course.name
ORDER BY "studentsCount" DESC LIMIT 3;