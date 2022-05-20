--1. Процедура видалення клітки
create or replace procedure DeleteCage(delete_id int)
as 
begin
    delete from CAGE where id = delete_id;
end;

insert into CAGE(id, name) values (999, 'Cage');

select * from CAGE;

execute DeleteCage(999);

--2. Кількість тварин вказаної клітки
create or replace function AnimalInCage(parametr int)
return int is
    res int := 0;
begin
    select Count(CAGE_AND_ANIMAL.id_animal) into res
    from CAGE join CAGE_AND_ANIMAL on CAGE_AND_ANIMAL.id_cage = CAGE.id
    where CAGE.id = parametr;
    
    return res;
end;

select AnimalInCage(2)
from dual;

--3. Тригери
-----При додаванні поставки їжі поставити сьогоднішню дату та автоматичне айді
create or replace NONEDITIONABLE trigger trigger_food
    before insert
    on FOOD_DELIVER 
    for each row
begin
    :new.deliverdate  := SYSDATE;
end;

delete from FOOD_DELIVER where id = 99;
insert into FOOD_DELIVER(id, id_cage, id_food) values (99, 1, 1);
select * from FOOD_DELIVER;

