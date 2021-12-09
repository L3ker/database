create table ANIMAL_TYPE(
	id int primary key,
	name varchar(50)
);

create table ANIMAL(
	id int primary key,
	name varchar(50),
    years int,
    gender varchar(10),
    info varchar(50),
    
    id_animal_type int,
    constraint id_animal_type foreign key (id_animal_type) references ANIMAL_TYPE(id)
);

create table FAMILY(
	id int primary key,
 
    father int,
    constraint family_father foreign key (father) references ANIMAL(id),
    
    mother int,
    constraint family_mother foreign key (mother) references ANIMAL(id),
    
    kid int,
    constraint family_kid foreign key (kid) references ANIMAL(id)
);

create table CAGE(
	id int primary key,
	name varchar(50),
    info varchar(50),
    cagesize int
);

create table CAGE_AND_ANIMAL(
	id int primary key,
    
	id_cage int,
    constraint id_cage foreign key (id_cage) references CAGE(id),

    id_animal int,
    constraint id_animal foreign key (id_animal) references ANIMAL(id)

);

create table FOOD(
	id int primary key,
	name varchar(50),
    info varchar(50)
);

create table FOOD_DELIVER(
	id int primary key,
	deliverdate date,
    delivertime timestamp,
    
    id_cage int,
    constraint deliver_id_cage foreign key (id_cage) references CAGE(id),

    id_food int,
    constraint deliver_id_food foreign key (id_food) references FOOD(id)
);