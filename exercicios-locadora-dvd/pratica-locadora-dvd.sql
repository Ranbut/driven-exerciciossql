CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(75) NOT NULL,
	"stateId" INTEGER UNIQUE NOT NULL REFERENCES "states"("id")
);

CREATE TYPE phoneType AS ENUM ('landline', 'mobile');
CREATE TABLE "clientsPhones"(
	"id" SERIAL PRIMARY KEY,
	"number" VARCHAR(11) UNIQUE NOT NULL,
	"type" phoneType NOT NULL
);

CREATE TABLE "adresses" (
	"id" SERIAL PRIMARY KEY,
	"street" VARCHAR(255) NOT NULL,
	"number" VARCHAR(3) NOT NULL,
	"complement" VARCHAR(255),
	"postalCode" VARCHAR(13) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "clients" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(255) NOT NULL,
	"cpf" VARCHAR(11) NOT NULL,
	"adressId" INTEGER NOT NULL REFERENCES "adresses"("id"),
	"phoneId" INTEGER NOT NULL REFERENCES "clientsPhones"("id")
);

CREATE TABLE "stores" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(255) NOT NULL,
	"phoneNumber" VARCHAR(11) NOT NULL,
	"adressId" INTEGER NOT NULL REFERENCES "adresses"("id")
);

CREATE TABLE "countries" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "actors" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(255) NOT NULL,
	"birthday" DATE NOT NULL,
	"countryId" INTEGER NOT NULL REFERENCES "countries"("id")
);

CREATE TABLE "genres" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(25) NOT NULL
);

CREATE TABLE "starring" (
	"id" SERIAL PRIMARY KEY,
	"filmId" INTEGER NOT NULL,
	"actorId" INTEGER NOT NULL REFERENCES "actors"("id")
);

CREATE TABLE "films" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(75) NOT NULL,
	"synopsis" VARCHAR(255) NOT NULL,
	"price" INTEGER NOT NULL,
	"date" DATE NOT NULL,
	"genreId" INTEGER NOT NULL REFERENCES "genres"("id"),
	"starringId" INTEGER NOT NULL,
	"inStock" INTEGER NOT NULL
);

CREATE TABLE "rents" (
	"id" SERIAL PRIMARY KEY,
	"filmId" INTEGER NOT NULL REFERENCES "films"("id"),
	"clientId" INTEGER NOT NULL REFERENCES "clients"("id"),
	"storeId" INTEGER NOT NULL REFERENCES "stores"("id"),
	"rentedAt" DATE NOT NULL DEFAULT NOW(),
	"returnedAt" DATE
);

CREATE TABLE "storesRatings"(
	"id" SERIAL PRIMARY KEY,
	"clientId" INTEGER NOT NULL REFERENCES "clients"("id"),
	"storeId" INTEGER NOT NULL REFERENCES "stores"("id"),
	"rating" INTEGER NOT NULL CHECK("rating" BETWEEN 1 AND 10)
);

CREATE TABLE "filmsRatings"(
	"id" SERIAL PRIMARY KEY,
	"clientId" INTEGER NOT NULL REFERENCES "clients"("id"),
	"filmId" INTEGER NOT NULL REFERENCES "films"("id"),
	"rating" INTEGER NOT NULL CHECK("rating" BETWEEN 1 AND 10)
);

ALTER TABLE "starring"
ADD CONSTRAINT "filmId"
FOREIGN KEY ("id") REFERENCES "films"("id");

ALTER TABLE "films"
ADD CONSTRAINT "starringId"
FOREIGN KEY ("id") REFERENCES "starring"("id"); 