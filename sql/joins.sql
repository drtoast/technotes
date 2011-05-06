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

-- COUNT related records

SELECT pub_items.id, items.id, count(items.id) AS count
FROM pub_items
LEFT JOIN items
ON pub_items.item_id = items.id
GROUP BY pub_items.id
ORDER BY count DESC;

-- UPDATE joined rows

UPDATE albums
LEFT JOIN artists 
ON albums.artist_id = artists.id
SET albums.title = 'The White Album', artists.name = 'The Beatles'
WHERE albums.id = '2';

-- DELETE joined rows (delete only albums)

DELETE albums
FROM artists
LEFT JOIN songs ON songs.artist_id = artists.id
LEFT JOIN albums ON songs.album_id = albums.id
WHERE artists.id = 1

-- SELECT DUPLICATE ROWS:

SELECT sku, COUNT(*) AS n 
FROM items 
GROUP BY sku
HAVING n > 1;

-- DELETE DUPLICATE ROWS: delete duplicates with the greater id

DELETE bad_rows.*
FROM hal_items AS good_rows
INNER JOIN hal_items AS bad_rows
ON bad_rows.hal_id = good_rows.hal_id AND bad_rows.id > good_rows.id;