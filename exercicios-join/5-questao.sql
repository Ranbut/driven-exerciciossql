/*Utilizando uma query, obtenha a lista das diferentes escolas (schools) e cursos 
(courses) onde estudaram as pessoas que estão aplicando pra posição de*/
SELECT school.id, school.name, course.name AS course, company.name AS company, role.name AS role
FROM applicants
INNER JOIN jobs AS job
ON applicants."jobId"=job.id
INNER JOIN educations AS education
ON applicants."userId"=education."userId"
INNER JOIN schools AS school
ON education."schoolId"=school.id
INNER JOIN courses AS course
ON education."courseId"=course.id
INNER JOIN experiences AS experience
ON applicants."userId"=experience."userId"
INNER JOIN companies AS company
ON experience."companyId"=company.id
INNER JOIN roles AS role
ON experience."roleId"=role.id
WHERE company.id=10 AND role.name='Software Engineer' AND job.active=true;