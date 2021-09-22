/* Populate database with sample data. */
INSERT INTO animals 
              (name, date_of_birth, escape_attempts, neutered, weight_kg) 
            VALUES
              ('Charmander', '08-02-2020', 0, false, -11),
              ('Plantmon', '15-11-2022', 2, true, -5.7),
              ('Squirtle', '2-04-1993', 3, false, -12.13),
              ('Angemon', '12-06-2005', 1, true, -45),
              ('Boarmon', '07-06-2005', 7, true, 20.4),
              ('Blossom', '13-10-1998', 3, true, 17),
              ('Agumon', '03-02-2020', 0, true, 10.23),
              ('Gabumon', '15-11-2018', 2, true, 8),
              ('Pikachu', '07-01-2021', 1, false, 15.04),
              ('Devimon', '12-04-2017', 5, true, 11);

INSERT INTO owners
              (full_name, age)
            VALUES
              ('Sam Smith', 34), 
              ('Jennifer Orwell', 19), 
              ('Bob', 45), 
              ('Melody Pond', 77), 
              ('Dean Winchester', 14),
              ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

BEGIN TRANSACTION;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
SELECT full_name AS owner, name FROM animals JOIN owners ON animals.owner_id = owners.id;
COMMIT;
SELECT full_name AS owner, name FROM animals JOIN owners ON animals.owner_id = owners.id;
