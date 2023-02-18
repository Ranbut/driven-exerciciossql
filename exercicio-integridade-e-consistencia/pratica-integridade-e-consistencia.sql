CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" TEXT UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER UNIQUE NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL,
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER UNIQUE NOT NULL REFERENCES "cities"("id")
);

CREATE TYPE typePhone AS ENUM ('landline', 'mobile');
CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"number" TEXT NOT NULL,
	"type" typePhone NOT NULL
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"accountNumber" INTEGER UNIQUE NOT NULL,
	"agency" INTEGER UNIQUE NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE DEFAULT NULL
);

CREATE TYPE typeTransaction AS ENUM ('deposit', 'withdraw');
CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER UNIQUE NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER DEFAULT 0 NOT NULL,
	"type" typeTransaction NOT NULL,
	"description" TEXT,
	"time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"cancelled" BOOLEAN DEFAULT false NOT NULL
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER UNIQUE NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" INTEGER NOT NULL CHECK("expirationMonth" BETWEEN 1 AND 12),
	"expirationYear" INTEGER NOT NULL CHECK("expirationYear" BETWEEN 1995 AND 3000),
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);