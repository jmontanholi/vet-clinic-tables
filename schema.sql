/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  age INT
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE animals(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(30), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOL, 
  weight_kg DEC,
  species_id INT,
  owner_id INT,
  CONSTRAINT species_id
    FOREIGN KEY(species_id)
      REFERENCES species(id)
      ON DELETE CASCADE,
  CONSTRAINT owner_id
    FOREIGN KEY(owner_id)
      REFERENCES owners(id)
      ON DELETE CASCADE
);