drop table  zipcode;

CREATE TABLE zipcode (
	zipcode             char(20)                NOT NULL  ,
	area1               varchar2(30)             NULL      ,
	area2               varchar2(30)            NULL      ,
	area3               varchar2(30)             NULL      ,
	area4               varchar2(30)             NULL      
);

insert into zipcode values('363-823','경기도','수원시','금정동', '93번지');  
insert into zipcode values('363-824','충남','당진군','남도리', '73번지');
insert into zipcode values('363-825','제주도','애월','가당리', '167번지');
insert into zipcode values('363-826','부산','해운대구','동도동', '11번지');
insert into zipcode values('135-805','서울','송파구','잠실동','565번지');
insert into zipcode values('135-800','서울','서대문구','창천동','170∼177');
insert into zipcode values('121-743','서울','마포구','대흥동','178');
insert into zipcode values('135-800','서울','종로구','종각','179∼180');
insert into zipcode values('135-804','서울','영등포구','상동','188∼189');
insert into zipcode values('135-242','서울','구로구','대림동', '23-1');
insert into zipcode values('121-743','서울','마포구','서강대학교', '65-3');
insert into zipcode values('135-820','서울','서초구','선릉동', '78-98');
insert into zipcode values('135-010','서울','동대문구','연지동', '43');
insert into zipcode values('135-836','서울','송파구','문정동','506∼507');
insert into zipcode values('135-835','서울','광진구','광진동','599∼611');
insert into zipcode values('135-838','서울','노원구','월계동','621∼653');
insert into zipcode values('135-774','서울','용산구','연신내', '12-9번지');
insert into zipcode values('121-743','서울','마포구','한빛ENI', '345');

commit ;
select  * from  zipcode ;
