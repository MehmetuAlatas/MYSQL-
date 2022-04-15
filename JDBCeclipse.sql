use sys;
create table personel
(
id int primary key,
isim varchar (50),
sehir varchar (50),
maas int,
sirket varchar (20)
);

insert into personel value(123456789,'ali can','paris',11000,'honda');
insert into personel value(113456789,'veli can','izmir',12000,'toyota');
insert into personel value(133456789,'deli can','ankara',10000,'honda');
insert into personel value(143456789,'selim can','istanbul',11000,'ford');
insert into personel value(153456789,'vali can','malatya',313000,'honda');
insert into personel value(163456789,'hali can','izmir',13000,'opel');
select*from personel;
commit;