--데이터 추가

--의사, 간호사 주민등록번호
create or replace function random_rr
return varchar2
is
f_rr varchar2(50);   
f_year number := trunc(DBMS_random.value(70,90));
f_month number := trunc(DBMS_random.value(1,12));
f_day number := trunc(DBMS_random.value(01,30));
f_fr number := trunc(DBMS_random.value(1,2));
f_se number := trunc(DBMS_random.value(100000,999999));
begin
f_rr := to_char(f_year)||to_char(f_month,'FM00')||to_char(f_day,'FM00')||'-'||to_char(f_fr)||to_char(f_se);       
return f_rr;        
end; 
/

create or replace function random_pr
return varchar2
is
f_rr varchar2(50);   
f_year number := trunc(DBMS_random.value(70,95));
f_month number := trunc(DBMS_random.value(1,12));
f_day number := trunc(DBMS_random.value(01,30));
f_fr number := trunc(DBMS_random.value(1,2));
f_se number := trunc(DBMS_random.value(100000,999999));
begin
f_rr := to_char(f_year)||to_char(f_month,'FM00')||to_char(f_day,'FM00')||'-'||to_char(f_fr)||to_char(f_se);       
return f_rr;        
end; 
/
create or replace function random_call
return varchar2
is
f_call varchar2(50);   
f_first varchar2(3) := '010';
f_second number := trunc(DBMS_random.value(0001,9999));
f_third number := trunc(DBMS_random.value(0001,9999));
begin
f_call := f_first||to_char(f_second,'FM0000')||to_char(f_third,'FM0000');       
return f_call;        
end; 
/

--직급 
insert into rank_T values('R001','교수');
insert into rank_T values('R002','임상강사');
insert into rank_T values('R003','전문의');
insert into rank_T values('R004','레지던트');
insert into rank_T values('R005','간호부장');
insert into rank_T values('R006','간호과장');
insert into rank_T values('R007','수간호사');
insert into rank_T values('R008','간호사');

--진료과
insert into medi_dep_T values('M001','피부과');
insert into medi_dep_T values('M002','소아과');
insert into medi_dep_T values('M003','정형외과');
insert into medi_dep_T values('M004','치과');
insert into medi_dep_T values('M005','안과');

--의사
insert into doc_T values('D001','고영호','남',random_call,'730906-1831367','M001','R001');
insert into doc_T values('D002','손장현','남',random_call,'700424-1324670','M002','R002');
insert into doc_T values('D003','정형균','남',random_call,'810515-1836048','M001','R003');
insert into doc_T values('D004','권아름','여',random_call,'870911-2847542','M003','R004');
insert into doc_T values('D005','박용호','남',random_call,'850310-1340839','M004','R001');
insert into doc_T values('D006','임가연','여',random_call,'830415-2331791','M005','R002');
insert into doc_T values('D007','최규환','남',random_call,'870603-1627590','M005','R003');
insert into doc_T values('D008','이성주','남',random_call,'741002-1540391','M002','R004');
insert into doc_T values('D009','손슬기','여',random_call,'721010-2687072','M003','R001');
insert into doc_T values('D010','백지현','여',random_call,'751115-2786475','M004','R002');
insert into doc_T values('D011','주천광','남',random_call,'780222-1856678','M004','R003');
insert into doc_T values('D012','박경록','남',random_call,'801007-1439511','M001','R004');
insert into doc_T values('D013','남항우','남',random_call,'791015-1347010','M001','R001');
insert into doc_T values('D014','유호철','남',random_call,'741028-1140522','M002','R002');
insert into doc_T values('D015','한경수','남',random_call,'740216-1554811','M003','R003');
insert into doc_T values('D016','박성화','남',random_call,'790723-1535791','M002','R004');
insert into doc_T values('D017','성강훈','남',random_call,'731118-1714635','M004','R001');
insert into doc_T values('D018','채향석','남',random_call,'840321-1114086','M005','R002');
insert into doc_T values('D019','허재','남',random_call,'770907-1317874','M002','R003');
insert into doc_T values('D020','김지언','여',random_call,'720912-2700374','M001','R004');
insert into doc_T values('D021','도진국','남',random_call,'740123-1474658','M003','R001');
insert into doc_T values('D022','석정임','여',random_call,'750903-2480342','M004','R002');
insert into doc_T values('D023','박재한','남',random_call,'710107-1932024','M002','R003');
insert into doc_T values('D024','권오대','남',random_call,'730727-1403987','M004','R004');
insert into doc_T values('D025','도영록','남',random_call,'780726-1511826','M003','R001');
insert into doc_T values('D026','박정아','여',random_call,'830924-2368442','M005','R002');
insert into doc_T values('D027','심동현','남',random_call,'790920-1885712','M001','R003');
insert into doc_T values('D028','최정윤','여',random_call,'740924-2991990','M002','R004');
insert into doc_T values('D029','김성규','남',random_call,'731003-1988562','M004','R001');
insert into doc_T values('D030','이화정','여',random_call,'790210-2268193','M003','R002');


-- 간호사 추가
-- 간호부장
insert into nur_T VALUES('N301','장원영','여',random_call,'700214-2590937','M001','R005');
insert into nur_T VALUES('N302','안유진','여',random_call,'780907-2768077','M002','R005');
insert into nur_T VALUES('N303','카리나','여',random_call,'751016-2169845','M003','R005');
insert into nur_T VALUES('N304','윈터','여',random_call,'790824-2478821','M004','R005');
insert into nur_T VALUES('N305','유나','여',random_call,'840902-2353997','M005','R005');
-- 간호과장
insert into nur_T VALUES('N306','유재석','남',random_call,'791128-1552697','M001','R006');
insert into nur_T VALUES('N307','정은지','여',random_call,'870513-2479235','M002','R006');
insert into nur_T VALUES('N308','강호동','남',random_call,'850804-1514358','M003','R006');
insert into nur_T VALUES('N309','성시경','남',random_call,'880919-1409576','M004','R006');
insert into nur_T VALUES('N310','조세호','남',random_call,'850909-1424738','M005','R006');
-- 수간호사
insert into nur_T VALUES('N311','이지은','여',random_call,'870220-2137730','M001','R007');
insert into nur_T VALUES('N312','윤하','여',random_call,'890417-2718324','M002','R007');
insert into nur_T VALUES('N313','정형돈','남',random_call,'870506-1448494','M003','R007');
insert into nur_T VALUES('N314','정채연','여',random_call,'770105-2129799','M004','R007');
insert into nur_T VALUES('N315','정준하','남',random_call,'760720-1243065','M005','R007');
-- 간호사
insert into nur_T VALUES('N316','지수','여',random_call,'880121-2927544','M001','R008');
insert into nur_T VALUES('N317','차은우','남',random_call,'910522-1892565','M002','R008');
insert into nur_T VALUES('N318','이석훈','남',random_call,'870813-1693853','M003','R008');
insert into nur_T VALUES('N319','김진호','남',random_call,'880211-1367541','M004','R008');
insert into nur_T VALUES('N320','김태연','여',random_call,'940212-2135279','M005','R008');
insert into nur_T VALUES('N321','홍길동','남',random_call,'740902-1165724','M001','R008');
insert into nur_T VALUES('N322','이순신','남',random_call,'941114-1591016','M002','R008');
insert into nur_T VALUES('N323','윤종신','남',random_call,'941114-1106322','M003','R008');
insert into nur_T VALUES('N324','에일리','여',random_call,'900207-2234138','M004','R008');
insert into nur_T VALUES('N325','솔라','여',random_call,'860127-2230212','M005','R008');
insert into nur_T VALUES('N326','박명수','남',random_call,'900827-1659621','M001','R008');
insert into nur_T VALUES('N327','노홍철','남',random_call,'950404-1581022','M002','R008');
insert into nur_T VALUES('N328','김범수','남',random_call,'950624-1770707','M003','R008');
insert into nur_T VALUES('N329','강동원','남',random_call,'930703-1320397','M004','R008');
insert into nur_T VALUES('N330','이서진','남',random_call,'780529-1901374','M005','R008');

--예약
insert into res_T values('RE001','21/01/22','홍성근','0109461457','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE002','22/02/10','조동호','0109461457','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE003','21/02/11','최영하','0105496272','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE004','21/06/29','이은만','0107815142','M002',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M002')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE005','21/07/08','장민선','01073555423','M003',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M003')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE006','21/09/02','정은미','01046767665','M005',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M005')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE007','21/09/14','성진호','01013712882','M005',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M005')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE008','21/09/15','문으뜸','01065565255','M002',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M002')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE009','21/11/07','전형진','01070885289','M004',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M004')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE010','22/01/22','홍국표','01057474484','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE011','22/02/02','황성길','01067235693','M003',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M003')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE012','22/03/09','설시윤','01082815192','M004',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M004')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE013','22/04/12','박정욱','01011985149','M004',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M004')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE014','22/05/16','정미라','01036512745','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE015','22/06/26','정미경','01099282939','M004',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M004')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE016','22/08/10','김차왕','01019593303','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE017','22/08/13','김규병','01012544084','M001',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M001')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2)); 
insert into res_T values('RE018','22/08/25','고재영','0104824409','M004',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M004')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE019','22/11/02','김준수','01040507000','M003',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M003')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));
insert into res_T values('RE020','22/11/10','김명주','01069486703','M002',(select A.doc_no
from (
    select * from doc_t
    where  m_no in( 'M002')
    order by DBMS_RANDOM.RANDOM ) A
where  rownum < 2));

--환자 넣기
insert into pat_T values('P001','구청회','44','남','01026221305','790316-1876584',NULL,'D020','N316');
insert into pat_T values('P002','고재영','51','남','0104824409','720211-1864366','RE018','D010','N329');
insert into pat_T values('P003','김규병','38','남','01012544084','850129-1316513','RE017','D013','N316');
insert into pat_T values('P004','김명주','32','남','01069486703','911110-1754209','RE020','D023','N317');
insert into pat_T values('P005','김슬기','38','여','01085674175','850609-2319208',NULL,'D025','N319');
insert into pat_T values('P006','한아름','35','여','01086266338','880405-2675034','RE001','D003','N319');
insert into pat_T values('P007','김준수','60','남','01040507000','630821-1772441','RE019','D030','N318');
insert into pat_T values('P008','최영하','41','남','0105496272','820319-1390533','RE003','D027','N317');
insert into pat_T values('P009','김차왕','31','남','01019593303','920205-1191676','RE016','D013','N330');
insert into pat_T values('P010','조동호','30','남','01025076046','931014-1969770','RE002','D023','N320');
insert into pat_T values('P011','박정욱','30','여','01011985149','930703-2118035','RE013','D024','N321');
insert into pat_T values('P012','정영진','61','남','01060298218','620126-1270868',NULL,'D018','N319');
insert into pat_T values('P013','박지훈','55','남','01056122085','680305-1894549',NULL,'D019','N313');
insert into pat_T values('P014','정미라','36','여','01036512745','870708-2182730','RE014','D013','N328');
insert into pat_T values('P015','이윤모','43','남','01081145057','801023-1317506','RE001','D021','N318');
insert into pat_T values('P016','정미경','59','여','01099282939','640913-2469810','RE015','D017','N327');
insert into pat_T values('P017','이은만','35','여','0107815142','880222-2682960','RE004','D016','N311');
insert into pat_T values('P018','임재희','49','여','01030535400','740712-2504079',NULL,'D020','N320');
insert into pat_T values('P019','이종학','58','남','0105997240','650921-1379344',NULL,'D010','N326');
insert into pat_T values('P021','소다름','61','여','01068598415','621125-2929139',NULL,'D008','N319');
insert into pat_T values('P022','임동석','45','남','0108755816','780517-1860171','RE001','D013','N322');
insert into pat_T values('P023','전형진','54','남','01070885289','690305-1990415','RE009','D022','N323');
insert into pat_T values('P024','최민혁','38','남','01094019689','850715-1693986',NULL,'D021','N319');
insert into pat_T values('P025','이재환','52','남','01041837236','710627-1555536',NULL,'D028','N312');
insert into pat_T values('P026','홍국표','49','여','01057474484','740729-2283941','RE010','D020','N328');
insert into pat_T values('P027','김진우','38','남','01011942728','850316-1749514',NULL,'D002','N321');
insert into pat_T values('P028','홍성근','50','남','0109461457','730807-1352343','RE001','D001','N324');
insert into pat_T values('P029','김잔디','40','여','01011406657','830808-2411789',NULL,'D030','N325');
insert into pat_T values('P030','황성길','62','남','01067235693','610113-1811945','RE011','D030','N327');
insert into pat_T values('P031','김봉균','37','남','01092143302','860327-1757905',NULL,'D005','N319');
insert into pat_T values('P032','장민선','45','여','01073555423','781111-2387742','RE005','D004','N329');
insert into pat_T values('P033','송현수','47','여','01058495491','760720-2745337',NULL,'D007','N319');
insert into pat_T values('P034','설시윤','48','남','01082815192','750622-1130730','RE012','D010','N323');
insert into pat_T values('P035','정은미','52','여','01046767665','711012-2173384','RE006','D006','N325');
insert into pat_T values('P036','윤병수','33','남','01076181694','900209-1267932',NULL,'D011','N322');
insert into pat_T values('P037','정연숙','46','여','01014969917','770210-2742372',NULL,'D025','N330');
insert into pat_T values('P038','양한길','42','남','01093479399','810317-1495860',NULL,'D009','N315');
insert into pat_T values('P039','문으뜸','53','여','01065565255','700701-2177525','RE008','D008','N324');
insert into pat_T values('P040','성진호','57','여','01013712882','660917-2758295','RE007','D018','N326');

--진료
insert into ds_T values('DS001','21/01/07','안구건조증',default,'D018','P040');
insert into ds_T values('DS002','21/01/10','안구건조증',default,'D007','P040'); 
insert into ds_T values('DS003','21/01/17','녹내장수술','입원','D026','P040'); 
insert into ds_T values('DS004','21/06/09','사랑니발치',default,'D005','P034'); 
insert into ds_T values('DS005','21/06/13','신경치료',default,'D005','P034'); 
insert into ds_T values('DS006','21/02/07','시력감소',default,'D007','P033');
insert into ds_T values('DS007','21/02/15','시력감소',default,'D006','P033'); 
insert into ds_T values('DS008','21/02/21','골절',default,'D030','P007'); 
insert into ds_T values('DS009','21/03/02','외상치료','입원','D021','P015'); 
insert into ds_T values('DS010','21/04/02','골절',default,'D005','P024');
insert into ds_T values('DS011','21/05/06','물리치료',default,'D009','P038');
insert into ds_T values('DS012','21/06/05','인대 손상',default,'D015','P036');
insert into ds_T values('DS013','21/06/30','구강외과','입원','D011','P034');
insert into ds_T values('DS014','21/06/27','스케일링',default,'D017','P002'); 
insert into ds_T values('DS015','21/07/05','피부염','입원','D003','P028'); 
insert into ds_T values('DS016','21/07/17','피부질환',default,'D012','P028');
insert into ds_T values('DS017','21/07/17','피부질환','입원','D013','P003');
insert into ds_T values('DS018','21/06/27','발치',default,'D010','P019'); 
insert into ds_T values('DS019','21/07/20','아토피','입원','D020','P009');
insert into ds_T values('DS020','21/08/02','피부질환',default,'D027','P022');
insert into ds_T values('DS021','21/09/06','알레르기',default,'D002','P027'); 
insert into ds_T values('DS022','21/10/05','호흡기','입원','D008','P021');
insert into ds_T values('DS023','21/10/09','소화기',default,'D008','P039');
insert into ds_T values('DS024','21/10/11','인플루엔자',default,'D016','P017');
insert into ds_T values('DS025','21/10/15','예방주사',default,'D019','P013');
insert into ds_T values('DS026','21/10/24','예방주사',default,'D005','P001');
insert into ds_T values('DS027','21/10/25','피부질환',default,'D003','P006');
insert into ds_T values('DS028','21/11/02','아토피',default,'D013','P009');
insert into ds_T values('DS029','21/11/06','검진',default,'D025','P005');
insert into ds_T values('DS030','21/11/27','시력검사',default,'D018','P012');
insert into ds_T values('DS031','21/12/27','인대손상',default,'D025','P005');
insert into ds_T values('DS032','21/12/27','피부염',default,'D013','P003');
insert into ds_T values('DS033','21/12/27','소화기',default,'D023','P004');
insert into ds_T values('DS034','21/12/27','사랑니발치',default,'D024','P011');
insert into ds_T values('DS035','22/01/27','임플란트',default,'D017','P016');
insert into ds_T values('DS036','22/01/27','녹내장','입원','D006','P035');
insert into ds_T values('DS037','22/01/27','충치',default,'D010','P034');
insert into ds_T values('DS038','22/02/27','시력검사',default,'D007','P033');
insert into ds_T values('DS039','22/02/27','골절',default,'D004','P032');
insert into ds_T values('DS040','22/02/27','발치',default,'D005','P031');
insert into ds_T values('DS041','22/03/27','시력검사',default,'D018','P040');
insert into ds_T values('DS042','22/04/27','종합검진',default,'D008','P039');
insert into ds_T values('DS043','22/04/27','외상치료','입원','D009','P038');
insert into ds_T values('DS044','22/04/27','물리치료',default,'D025','P037');
insert into ds_T values('DS045','22/05/27','임플란트',default,'D011','P036');
insert into ds_T values('DS046','22/06/27','임플란트',default,'D010','P019');
insert into ds_T values('DS047','22/07/27','아토피',default,'D020','P018');
insert into ds_T values('DS048','22/08/27','소화기','입원','D016','P017');
insert into ds_T values('DS049','22/09/27','충치',default,'D017','P016');
insert into ds_T values('DS050','22/10/27','골절',default,'D021','P015');

--입원실 테이블
insert into hr_T values('101',30000);
insert into hr_T values('201',40000);
insert into hr_T values('301',50000);
insert into hr_T values('401',75000);
insert into hr_T values('501',100000);

--입원 테이블
insert into hp_t values('HP001','21/01/17','21/01/20','D026','N311','P040','101'); 
insert into hp_t values('HP002','21/03/02','21/03/17','D021','N313','P015','201'); 
insert into hp_t values('HP003','21/06/30','21/07/07','D011','N315','P034','401');
insert into hp_t values('HP004','21/07/05','21/07/10','D003','N312','P028','501'); 
insert into hp_t values('HP005','21/07/17','21/07/19','D013','N314','P003','301');
insert into hp_t values('HP006','21/07/20','21/07/30','D020','N311','P009','201');
insert into hp_t values('HP007','21/10/05','21/11/01','D008','N312','P021','101');
insert into hp_t values('HP008','22/01/27','22/01/30','D006','N312','P035','201');
insert into hp_t values('HP009','22/04/27','22/05/10','D009','N314','P038','301');
insert into hp_t values('HP010','22/08/27','22/09/17','D016','N315','P017','501');



