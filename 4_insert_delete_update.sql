--Додавання даних
insert into CAGE values (1, 'Мавпи', 'Простора, для мавп', 20);

insert into CAGE values (2, 'Тигри', 'Для сімї тигрів', 40);

insert into CAGE values (3, 'Дім пінгвінів', 'Для пінгвінів', 21);

insert into CAGE values (4, 'Одинокий слон', 'Для слона', 19);


--загрузка з файлу
create or replace directory catalog as 'D:\\';

create table LOADING_TABLE_CAGE(
	id int,
    name varchar(50)
) 
organization external(
    type ORACLE_LOADER
    default directory catalog
    access parameters(
        records delimited by newline
        fields terminated by ','
        missing field values are null
    )
    location ('cages.txt')
); 
insert into CAGE select * from LOADING_TABLE_CAGE;

--оновлення даних
update CAGE set info = 'Для тигрів' where id = 2;
--делкілька даних
update CAGE set cagesize = 35 where id > 2;

--видалення
delete from CAGE where name = 'Тигри';
delete from CAGE where id = 4;