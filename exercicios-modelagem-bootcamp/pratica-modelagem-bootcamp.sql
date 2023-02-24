CREATE TABLE "classes" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(2) NOT NULL UNIQUE
);

CREATE TABLE "modules" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE "projects" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"moduleId" INTEGER NOT NULL REFERENCES "modules"("id"),
	"deadline" DATE NOT NULL
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"fullName" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"classId" INTEGER NOT NULL REFERENCES "classes"("id")
);

CREATE TYPE noteClassification AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');
CREATE TABLE "deliveredProjects" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"projectId" INTEGER NOT NULL REFERENCES "projects"("id"),
	"deliveredAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"note" noteClassification
);

CREATE TABLE "experiencesClasses" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"classId" INTEGER NOT NULL REFERENCES "classes"("id"),
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"startDate" DATE NOT NULL,
	"endDate" DATE
);
