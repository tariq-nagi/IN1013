
CREATE TABLE  petPet (
petname varchar(20) primary key,
owner varchar(45),
species varchar(45),
gender varchar(1),
birth date,
death date
);

CREATE TABLE petEvent (
petname varchar(20),
eventdate date,
eventtype varchar(15),
remark VARCHAR(255) primary key,
FOREIGN KEY(petname) references petPet(petname)
);








