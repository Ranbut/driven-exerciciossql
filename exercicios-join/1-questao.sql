/*Utilizando uma query, obtenha todos os usuários (users) que 
vivem na cidade (cities) cujo nome seja “Rio de Janeiro”.*/
SELECT users.id, users.name, cities.name AS city
FROM users
INNER JOIN cities
ON users."cityId"=cities.id
WHERE cities.name='Rio de Janeiro';
