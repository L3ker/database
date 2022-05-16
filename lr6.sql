--ЛР6--

--1. Запит на виконання проекції (відображення) для таблиць БД.
drop view view1;
create view view1 as select distinct name, years, info from ANIMAL;   
select * from view1;

--2. Запит на виконання складної проекції для таблиць БД
drop view view2;
create view view2 as select distinct name, years, info from ANIMAL  
    where years < 3;   
select * from view2;

--3. Запит на виконання селекції з використанням будь-якої складної умови відбору для таблиць БД.
select * from FOOD_DELIVER deliverdate = SYSDATE;
select * from FOOD_DELIVER;

--4. Запит на виконання натурального з’єднання у будь-яких таблицях вашої БД.
select ANIMAL.id, ANIMAL.name, ANIMAL.info, ANIMAL_TYPE.name
from ANIMAL, ANIMAL_TYPE
where ANIMAL_TYPE.id = ANIMAL.id_animal_type;

--5. Запит на виконання умовного з’єднання для таблиць вашої БД
select ANIMAL.id, ANIMAL.name, ANIMAL.info
from ANIMAL, ANIMAL_TYPE
where ANIMAL_TYPE.id = ANIMAL.id_animal_type and ANIMAL.info is null;