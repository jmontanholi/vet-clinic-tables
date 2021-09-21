/* Populate database with sample data. */
INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Charmander', '08-02-2020', 0, false, -11);

INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Plantmon', '15-11-2022', 2, true, -5.7);

INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Squirtle', '2-04-1993', 3, false, -12.13);

INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Angemon', '12-06-2005', 1, true, -45);

INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Boarmon', '07-06-2005', 7, true, 20.4);

INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Blossom', '13-10-1998', 3, true, 17);

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species != 'digimon';
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;