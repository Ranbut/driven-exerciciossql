# Descrição

Nesta prática vocês receberão um banco de dados já existente com alguns dados. Configure o banco seguindo as instruções e faça os exercícios :)

# Como configurar o banco

1. Baixe o database-fornecido:
   
2. Extraia o conteúdo e abra um terminal na pasta extraída
3. Execute o seguinte comando para configurar o banco de dados
    
    ```bash
    sudo bash create-database
    ```
    
4. Por fim, execute o seguinte comando para se conectar ao banco de dados
    
    ```bash
    sudo bash connect-database
    ```
    

# Estrutura do banco

<img src="https://raw.githubusercontent.com/Ranbut/driven-exerciciossql/main/exercicios-join/db-join.png" alt="database"/>

O banco possui as seguintes tabelas e elas se relacionam dessa forma:

**Explicando cada tabela:**

- Tabela central:
    - `users`: armazena os usuários da plataforma
- Depoimentos:
    - `testimonials`: armazena os depoimentos deixados de um usuário para outro. `writerId` é o id do usuário que escreveu o depoimento, enquanto `recipientId` é o id do usuário que recebeu o depoimento
- Educação:
    - `educations`: armazena todas as experiências de educação que os usuários tiveram. Pra isso, ela se relaciona com outras duas tabelas: `schools` e `courses`
    - `schools`: são as escolas onde o usuário pode ter estudado (ex: Driven, Unicamp, etc)
    - `courses`: são os cursos que os usuários podem ter feito (ex: Software Engineering, Computer Science, etc)
- Experiências de Trabalho:
    - `experiences`: armazena as experiências de trabalho que os usuários tiveram. Pra isso ela se relaciona com outras duas tabelas: `companies` e `roles`
    - `companies`: são as empresas onde o usuário pode ter trabalhado (ex: OLX, IBM)
    - `roles`: são os cargos que os usuários podem ter atuado (ex: Software Engineer, Consultant, etc)
- Vagas de emprego:
    - `jobs`: são todas as vagas de emprego cadastradas na plataforma. Cada vaga está associada a uma empresa e a um cargo, e por isso essa tabela se relaciona também com `companies` e `roles`
    - `applicants`: é uma tabela meio que indica que usuários se inscreveram pra quais vagas

# Exercícios

Com um terminal aberto conectado ao banco (com o comando `sudo bash connect-database`), execute as seguintes consultas:

### Questão 1:

Utilizando uma query, obtenha todos os usuários (`users`) que vivem na cidade (`cities`) cujo nome seja “**Rio de Janeiro**”.

A resposta deve vir no formato (Provavelmente o dados mostrados não serão os mesmos, foque nos campos mostrados):

```
|---id---|---name---|-------city-------|
    1        João      Rio de Janeiro
    2        Maria     Rio de Janeiro
   ...        ...            ...
```

**OBS:** a coluna `id` se refere ao id do usuário

**Dica:** utilize apelidos para os nomes de colunas ficarem como você deseja (ex: `SELECT cities.name AS city`)

**Dica:** na query, todo nome de coluna que tenha letras maiúsculas precisa estar entre aspas duplas (ex: `ON users."cityId" = ...`). Repare que somente o nome da coluna fica entre aspas duplas.

### Questão 2:

Utilizando uma query, obtenha todos os depoimentos (`testimonials`) cadastrados, incluindo o nome do remetente e do destinatário.

A resposta deve vir no formato (Provavelmente o dados mostrados não serão os mesmos, foque nos campos mostrados):

```
|---id---|---writer---|---recipient---|--------------message------------------|
    1        João           Maria         Foi ótimo trabalhar com a Maria...
    2        Maria          João           Adorei trabalhar com o João...
   ...        ...            ...                     ...
```

**OBS:** a coluna `id` se refere ao id do depoimento

**Dica:** para fazer múltiplos joins com uma mesma tabela, use apelidos para cada join (ex: `JOIN tabela t1`)

### Questão 3:

Utilizando uma query, obtenha todos os cursos (`courses`) que o usuário com id **30** já finalizou, incluindo o nome da escola. O que indica que um usuário terminou um curso é o campo `status` da tabela `educations`, que deve estar como "**finished**".

A resposta deve vir no formato (Provavelmente o dados mostrados não serão os mesmos, foque nos campos mostrados):

```
|---id---|---name---|---course---|----school----|---endDate---|
    1        João      HTML/CSS       Driven       2021-12-01
    2        João      JavaScript     Driven       2022-01-20
   ...        ...         ...           ...          ...
```

**OBS:** a coluna `id` se refere ao id do usuário

### Questão 4:

Utilizando uma query, obtenha as empresas (`companies`) para as quais o usuário com id **50** trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o campo `endDate` da tabela `experiences`. Se ele estiver null (`IS NULL`), significa que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá.

A resposta deve vir no formato (Provavelmente o dados mostrados não serão os mesmos, foque nos campos mostrados):

```
|---id---|---name---|--------role--------|----company----|---startDate---|
    1        João      Software Engineer        OLX          2020-06-01
    2        João         Consultant            IBM          2022-02-01
   ...        ...            ...                ...              ...
```

**OBS:** a coluna `id` se refere ao id do usuário

### Desafio Bônus

Utilizando uma query, obtenha a lista das diferentes escolas (`schools`) e cursos (`courses`) onde estudaram as pessoas que estão aplicando pra posição de **“Software Engineer”** na empresa com id **10**. Só devem ser consideradas as vagas que estiverem ativas, ou seja, quando o campo `active` da tabela `jobs` estiver **true**.

A resposta deve vir no formato (Provavelmente o dados mostrados não serão os mesmos, foque nos campos mostrados):

```
|---id---|---school---|--------course--------|----company----|--------role-------|
    1        Driven       Software Engineer        OLX         Software Engineer
    2        Unicamp      Computer Science         OLX         Software Engineer
   ...        ...               ...                 ...              ...
```

**OBS:** a coluna `id` se refere ao id da escola
