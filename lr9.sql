--1 Кількість тварин
select Count(id)
from Animal;

--2 Середній вік всіх тварин
select Avg(years)
from Animal;

--3 Найменший та найбільший розмір клітки
select Min(cagesize), Max(cagesize)
from Cage; 

--4. Середній вік тварин в кожній клітці
select CAGE.name, AVG(ANIMAL.years)
from CAGE join CAGE_AND_ANIMAL on CAGE_AND_ANIMAL.id_cage = CAGE.id
        join ANIMAL on CAGE_AND_ANIMAL.id_animal = ANIMAL.id
group by CAGE.name;

--5. Кількість тварин певного типу
select ANIMAL_TYPE.name, Count(ANIMAL.id)
from ANIMAL right join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
group by ANIMAL_TYPE.name;