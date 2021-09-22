/*Queries that provide answers to the questions from all projects.*/
SELECT name AS animal_name, full_name AS owner 
  FROM animals 
    JOIN owners ON animals.owner_id = owners.id 
      WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name AS species 
  FROM animals 
    JOIN species ON animals.species_id = species.id 
      WHERE species.name = 'Pokemon';

SELECT full_name, name AS animal_name 
  FROM owners 
    LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT COUNT(animals.name), species.name 
  FROM animals 
    JOIN species ON animals.species_id = species.id 
      GROUP BY species.name;

SELECT full_name AS owner, animals.name AS animal_name, species.name
  FROM owners 
    JOIN animals ON owners.id = animals.owner_id
    JOIN species ON animals.species_id = species.id
      WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';

SELECT full_name AS owner, animals.name AS animal_name, escape_attempts
  FROM animals 
    JOIN owners ON animals.owner_id = owners.id
    WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals??
SELECT maxOwn.fn AS owner
  FROM (SELECT COUNT(name) AS owned, full_name AS fn
          FROM animals
            JOIN owners ON animals.owner_id = owners.id
            GROUP BY fn
        ) AS maxOwn
  WHERE maxOwn.owned = (SELECT MAX(maxOwn.owned) FROM (SELECT COUNT(name) AS owned, full_name AS fn
          FROM animals
            JOIN owners ON animals.owner_id = owners.id
            GROUP BY fn
        ) AS maxOwn);
-- OR
SELECT COUNT(name) AS owned, full_name AS fn
          FROM animals
            JOIN owners ON animals.owner_id = owners.id
            GROUP BY fn
            ORDER BY owned DESC
            LIMIT 1;