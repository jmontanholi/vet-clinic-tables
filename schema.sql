/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT PRIMARY KEY, 
  name CHAR(30), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOL, 
  weight_kg DEC
);