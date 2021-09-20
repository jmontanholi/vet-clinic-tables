/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '31-12-2019';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT escape_attempts, name FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true; 'OR' SELECT name FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon'; 'OR' SELECT name FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3; 'OR' SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;