insert into ANIMAL_TYPE values (1, 'Мавпи');

insert into ANIMAL_TYPE values (2, 'Тигри' );

insert into ANIMAL_TYPE values (3, 'Дім пінгвінів');

insert into ANIMAL_TYPE values (4, 'Одинокий слон');

--Таблиці:
create table ANIMAL_TYPE1
    as select * from ANIMAL_TYPE
        where id <= 3;
        
create table ANIMAL_TYPE2
    as select * from ANIMAL_TYPE
        where id >= 3;

----one_Обєднання----
-----Без повтореннь---
select * from ANIMAL_TYPE1
    union select * from ANIMAL_TYPE2;
-----З повторенням-----
select * from ANIMAL_TYPE1
    union all select * from ANIMAL_TYPE2;


----two_Перетин----
select * from ANIMAL_TYPE1
    intersect select * from ANIMAL_TYPE2;
   
----three Різниця від 1 віднімаю 2----
select * from ANIMAL_TYPE1
    minus select * from ANIMAL_TYPE2; 
    
----four Декартовий добуток ----
select * from ANIMAL_TYPE1, ANIMAL_TYPE2;

drop table ANIMAL_TYPE1;
drop table ANIMAL_TYPE2;