--1. Тварини, у яких вік меньше 1
select name, info, years
from ANIMAL
where years < 1;

--2. Кількість певних типів тварин
select ANIMAL_TYPE.name, Count(ANIMAL.id)
from ANIMAL right join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
group by ANIMAL_TYPE.name;

--3. Тварини риби
select ANIMAL.name, ANIMAL_TYPE.name
from ANIMAL join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
where ANIMAL_TYPE.name like 'Риби';

--4. Кількість тварин в кожній клітці
select CAGE.name, Count(CAGE_AND_ANIMAL.id_animal)
from CAGE join CAGE_AND_ANIMAL on CAGE_AND_ANIMAL.id_cage = CAGE.id
group by CAGE.name;

--5. Клітки у яких розмір між 10 та 20
select * from CAGE
where cagesize between 10 and 20;

--6 Список їжі, відсортований за назвою та назва починається на "М"
select name, info
from FOOD
where name like 'М%'
order by name asc;

--7. Тварини, у яких є буква о у назві
select name, info, years
from ANIMAL
where name like '%о%';

--8. Середній вік тварин у кожній клітці, відсортований по віку.
select CAGE.name, AVG(ANIMAL.years)
from CAGE join CAGE_AND_ANIMAL on CAGE_AND_ANIMAL.id_cage = CAGE.id
        join ANIMAL on CAGE_AND_ANIMAL.id_animal = ANIMAL.id
group by CAGE.name
order by AVG(ANIMAL.years);

--9. Тварини, у яких вік більше середнього
select name, info, years
from ANIMAL
where years > (select Avg(years) from Animal);

--10. Кількість доставленої їжі поточного місяця
select Count(id) from FOOD_DELIVER
where to_char(deliverdate, 'Month') = to_char(SYSDATE, 'Month');