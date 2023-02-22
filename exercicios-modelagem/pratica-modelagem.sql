CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"fullName" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) UNIQUE NOT NULL,
	"password" VARCHAR(50) NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(75) UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(75) NOT NULL,
	"stateId" INTEGER UNIQUE NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "usersAddresses" (
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER UNIQUE NOT NULL REFERENCES "users"("id"),
	"street" VARCHAR(100) NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" VARCHAR(255),
	"postalCode" VARCHAR(13) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "size" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(2) UNIQUE NOT NULL
);

CREATE TABLE "productCategories" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(75) UNIQUE NOT NULL
);

CREATE TABLE "productImages" (
	"id" SERIAL PRIMARY KEY,
	"main" VARCHAR(255) NOT NULL,
	"second" VARCHAR(255) NOT NULL,
	"third" VARCHAR(255) NOT NULL,
	"fourth" VARCHAR(255) NOT NULL
);

CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(255) UNIQUE NOT NULL,
	"description" VARCHAR(255) NOT NULL,
	"price" INTEGER NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "productCategories"("id"),
	"sizeId" INTEGER NOT NULL REFERENCES "size"("id"),
	"imageId" INTEGER NOT NULL REFERENCES "productImages"("id"),
	"inStock" INTEGER NOT NULL,
	"addAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TYPE statusType AS ENUM ('criada', 'paga', 'entregue', 'cancelada');
CREATE TABLE "orders"(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"createdAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"buyedAt" TIMESTAMP WITHOUT TIME ZONE,
	"deliveredAt" TIMESTAMP WITHOUT TIME ZONE,
	"status" statusType NOT NULL
);

CREATE TABLE "orderItems"(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"quantity" INTEGER NOT NULL,
	"orderId" INTEGER NOT NULL REFERENCES "orders"("id"),
	"createdAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);