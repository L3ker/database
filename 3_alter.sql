--видалення зв'язку:
alter table FAMILY drop constraint family_kid;
   
--вилучення поля та зміни властивості поля
alter table FAMILY drop column kid;
alter table FAMILY modify mother int not null;

--перейменування поля
alter table FAMILY rename column father to dad;

--унікальність
alter table FAMILY add kid int;
alter table FAMILY add constraint constraintf unique (mother, kid);
    
--зміна типу зв'язку
alter table FAMILY drop constraint family_mother;
alter table FAMILY add constraint family_mother foreign key (mother) references ANIMAL(id) on delete cascade;
