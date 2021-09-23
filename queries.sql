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

SELECT animals.name AS animal, vets.name AS vet, visit_date
  FROM visits
    JOIN animals ON animals.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
    WHERE vets.name = 'William Tatcher'
    ORDER BY visit_date DESC
    LIMIT 1;

SELECT COUNT(DISTINCT animals.name) 
  FROM visits
    JOIN animals ON animals.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
    WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name AS vet, species.name AS specialization
  FROM specializations s
    JOIN species ON species.id = s.species_id
    RIGHT JOIN vets ON vets.id = s.vet_id;

SELECT animals.name AS animal, vets.name AS vet, visit_date
  FROM visits v 
    JOIN animals ON animals.id = v.animal_id
    JOIN vets ON vets.id = v.vet_id
    WHERE vets.name = 'Stephanie Mendez'
      AND visit_date BETWEEN '01-04-2020' AND '30-08-2020';

SELECT animals.name AS animal, COUNT(animals.name) AS visits
  FROM visits v
    JOIN animals ON animals.id = v.animal_id
    GROUP BY animals.name
    ORDER BY COUNT(animals.name) DESC
    LIMIT 1;

SELECT v.visit_date, animals.name
  FROM visits v
    JOIN vets ON vets.id = v.vet_id
    JOIN animals ON animals.id = v.animal_id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY animals.name, visit_date
    ORDER BY visit_date
    LIMIT 1;

SELECT visit_date,
       animals.*,
       species.name AS species,
       vets.name AS vet_name,
       vets.age,
       vets.date_of_graduation AS graduation 
  FROM visits v
    JOIN animals ON animals.id = v.animal_id
    JOIN vets ON vets.id = v.vet_id
    JOIN species ON species.id = animals.species_id
    ORDER BY visit_date DESC
    LIMIT 1;

SELECT COUNT(animals.name) AS non_specialized_visits
  FROM visits v
    JOIN animals ON animals.id = v.animal_id
    JOIN vets ON vets.id = v.vet_id
    LEFT JOIN specializations s ON v.vet_id = s.vet_id
    LEFT JOIN species ON species.id = s.species_id   
      WHERE animals.species_id != s.species_id;

SELECT COUNT(animals.species_id) AS species_analyzed, vets.name, species.name AS should_specialize_on
  FROM visits v
    JOIN animals ON animals.id = v.animal_id
    JOIN species ON animals.species_id = species.id
    JOIN vets ON vets.id = v.vet_id
      WHERE vets.name = 'Maisy Smith'
      GROUP BY species.name, vets.name
      ORDER BY species_analyzed DESC
      LIMIT 1;