drop table  zipcode;

CREATE TABLE zipcode (
	zipcode             char(20)                NOT NULL  ,
	area1               varchar2(30)             NULL      ,
	area2               varchar2(30)            NULL      ,
	area3               varchar2(30)             NULL      ,
	area4               varchar2(30)             NULL      
);

insert into zipcode values('363-823','��⵵','������','������', '93����');  
insert into zipcode values('363-824','�泲','������','������', '73����');
insert into zipcode values('363-825','���ֵ�','�ֿ�','���縮', '167����');
insert into zipcode values('363-826','�λ�','�ؿ�뱸','������', '11����');
insert into zipcode values('135-805','����','���ı�','��ǵ�','565����');
insert into zipcode values('135-800','����','���빮��','âõ��','170��177');
insert into zipcode values('121-743','����','������','���ﵿ','178');
insert into zipcode values('135-800','����','���α�','����','179��180');
insert into zipcode values('135-804','����','��������','��','188��189');
insert into zipcode values('135-242','����','���α�','�븲��', '23-1');
insert into zipcode values('121-743','����','������','�������б�', '65-3');
insert into zipcode values('135-820','����','���ʱ�','������', '78-98');
insert into zipcode values('135-010','����','���빮��','������', '43');
insert into zipcode values('135-836','����','���ı�','������','506��507');
insert into zipcode values('135-835','����','������','������','599��611');
insert into zipcode values('135-838','����','�����','���赿','621��653');
insert into zipcode values('135-774','����','��걸','���ų�', '12-9����');
insert into zipcode values('121-743','����','������','�Ѻ�ENI', '345');

commit ;
select  * from  zipcode ;
