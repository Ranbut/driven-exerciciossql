/**Utilizando uma query, obtenha todos os depoimentos (`testimonials`) 
cadastrados, incluindo o nome do remetente e do destinatário*/
SELECT testimonials.id, t1.name AS writer, t2.name AS recipient,testimonials.message
FROM testimonials
INNER JOIN users AS t1
ON testimonials."writerId"=t1.id
INNER JOIN users AS t2
ON testimonials."recipientId"=t2.id;