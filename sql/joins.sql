-- EQUI-JOIN (without additional "where" conditions, it's the same as an inner join)

SELECT pet.name, pet.owner, event.type, event.remark
FROM pet, event
WHERE pet.name = event.name;

-- INNER JOIN (returns rows from both tables ONLY where there is a match)

SELECT pet.name, event.type
FROM pet
INNER JOIN event
ON pet.name = event.name
WHERE pet.species = "dog";

-- LEFT JOIN (returns all rows from first table, EVEN IF NO MATCH in second table)

SELECT pet.name, count(event.name) AS "numevents"
FROM pet
LEFT JOIN event
ON pet.name = event.name
WHERE pet.species = "dog"
GROUP BY pet.name;
