/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(30), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOL, 
  weight_kg DEC,
  species VARCHAR(30)
);