INSERT INTO petPet(petname, owner, species, gender, birth) VALUES
('Hammy', 'Diane', 'hamster', 'M', '2010-10-30');




INSERT INTO petEvent(petname, eventdate, eventtype, remark) VALUES
('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
('Hammy', '2020-10-15', 'vet', 'antibiotics'),
('Fluffy', '2024-10-27', 'vet', 'fluffy had 5 kittens and 2 were male'),
('CLaws', '1997-08-03', 'vet', 'broken rib');

UPDATE petPet SET death = '2020-09-01' WHERE petname = 'PUFFBALL';
DELETE FROM petPet WHERE owner = 'Harold' AND species = 'dog';

