# Descrição

Nesta prática vocês receberão uma estrutura de banco de dados e deverão criá-lo junto de suas tabelas com os tipos de dados e constraints corretas.

Ou seja, você terá que decidir qual o melhor **tipo** de cada coluna e quando usar restrições do tipo `NULL`, `NOT NULL`, `DEFAULT`, `UNIQUE`, `PRIMARY KEY` ou `FOREIGN KEY`.

# Estrutura do banco

O banco possui as seguintes tabelas e elas se relacionam dessa forma:

<img src="https://raw.githubusercontent.com/Ranbut/driven-exerciciossql/main/exercicio-integridade-e-consistencia/db-integrity.png" alt="db-integrity"/>

**Obs:**

- Usuários só podem possuir um endereço

### Bônus

- O campo `type` de `customerPhones` só pode ter valor “landline” ou “mobile”
- O campo `type` de `transactions` só pode ter “deposit” ou “withdraw”

**Dica:**

Pesquise por **ENUM Types** para criar restrições de valores
