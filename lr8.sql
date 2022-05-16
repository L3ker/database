--ЛР8--

--1. Тварини, відсортовані за ім'ям
select name, info
from ANIMAL
order by name asc;

--2. Кількість певних типів тварин
select ANIMAL_TYPE.name, Count(ANIMAL.id)
from ANIMAL right join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
group by ANIMAL_TYPE.name;

--3. 3 найдоросліші тварини
select name, info, years
from ANIMAL
order by years desc
fetch first 3 rows only;

--4. Кількість тварин в кожній клітці
select CAGE.name, Count(CAGE_AND_ANIMAL.id_animal)
from CAGE join CAGE_AND_ANIMAL on CAGE_AND_ANIMAL.id_cage = CAGE.id
group by CAGE.name;

--5. Кількість доставленої їжі кожного місяця, відсортоване по кількістю
select to_char(deliverdate, 'Month'), Count(id)
from FOOD_DELIVER
group by to_char(deliverdate, 'Month')
order by Count(id);

--6 Відсортвувати тварин від наймолодгого до найдорослішого та за типом
select ANIMAL.name, ANIMAL_TYPE.name, ANIMAL.years
from ANIMAL join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
order by ANIMAL_TYPE.name desc, ANIMAL.years asc;

--7 Середній вік певних типів тварин
select ANIMAL_TYPE.name, Avg(ANIMAL.years)
from ANIMAL join ANIMAL_TYPE on ANIMAL.id_animal_type = ANIMAL_TYPE.id
group by ANIMAL_TYPE.name;

--8 Кількість доставленої певної їжі
select FOOD.name, Count(FOOD_DELIVER.id)
from FOOD left join FOOD_DELIVER on FOOD_DELIVER.id_food = FOOD.id
group by FOOD.name;

--9 Список їжі, відсортований за назвою
select name, info
from FOOD
order by name asc;

--10 Кількість доставленої їжі кожного дня, відсорртовані за датою
select to_char(deliverdate, 'DD.MM.YYYY'), Count(id)
from FOOD_DELIVER
group by to_char(deliverdate, 'DD.MM.YYYY')
order by to_char(deliverdate, 'DD.MM.YYYY');
