--함수, 프로시저, 트리거

--가장 먼저 실행
SET SERVEROUTPUT ON  

--함수, 프로시저, 트리거, 삭제
--drop function random_call;
--drop function random_pr;
--drop function random_rr;

--프로시저--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. 입원 테이블에서 환자 이름 검색 시  --퇴원일이 미정입니다. --퇴원일이 0일 남았습니다. 

create or replace PROCEDURE PROC_hp_pa_name(pa_in_name in varchar2)
is
proc_in_date hp_t.in_date%type;
proc_out_date hp_t.out_date%type;
today date;
BEGIN
dbms_output.put_line('1111111');
    select h.in_date into proc_in_date from hp_t h, pat_t p WHERE h.hp_pano=p.pat_no and p.pat_name=pa_in_name;
    select h.out_date into proc_out_date from hp_t h, pat_t p WHERE h.hp_pano=p.pat_no and p.pat_name=pa_in_name;
    today := TO_date(SYSDATE, 'YY/MM/DD');
    dbms_output.put_line(today);
    dbms_output.put_line(proc_out_date);
    if proc_out_date is null then 
    dbms_output.put_line('퇴원일이 미정입니다.');
    elsif proc_out_date > today then
    dbms_output.put_line('퇴원일이'||trunc(proc_out_date-today)||'일 남았습니다.');
    else
    dbms_output.put_line('입원 환자가 아닙니다.');
    end if;

END;
/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
execute PROC_hp_pa_name('성진호');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--입원료 계산------------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace  PROCEDURE ho_bills (pt_name in pat_t.pat_name%type)
is
in_date hp_t.in_date%type;
out_date hp_t.out_date%type;
hr_price hr_t.hr_price%type;
h_day number;
res number;
BEGIN
    select h.in_date into in_date from hp_t h, pat_t p where h.hp_pano=p.pat_no and p.pat_name=pt_name;
    select h.out_date into out_date from hp_t h, pat_t p where h.hp_pano=p.pat_no and p.pat_name=pt_name;
    select r.hr_price into hr_price  from hr_t r, hp_t h, pat_t p where h.hp_pano=p.pat_no and p.pat_name=pt_name and r.hr_no=h.hr_no;
    h_day:=trunc(out_date)-trunc(in_date)+1;
    res:=h_day*hr_price;
    if out_date is null then 
    dbms_output.put_line('퇴원일이 미정입니다.');
    elsif out_date is not null  then
    dbms_output.put_line(pt_name||'님의 입원료는 '||res||'원입니다.');
    else
    dbms_output.put_line('알 수 없는 에러가 발생했습니다.');
    end if;
END;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
execute ho_bills('이은만');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--트리거--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1. 진료테이블에 입원이 입력 될시 입원 테이블에 자동추가

CREATE OR REPLACE TRIGGER ds_insert_hp
AFTER INSERT on ds_t
FOR EACH ROW
DECLARE
BEGIN
IF :NEW.ds_inout = '입원' THEN
 INSERT INTO hp_t VALUES('HP'||(SELECT COUNT(*) FROM hp_t), :NEW.ds_date, NULL , :NEW.doc_no, 
 (SELECT nur_no FROM nur_t WHERE substr(:NEW.doc_no,2) = substr(nur_no,2) - 300), :NEW.pa_no, '101');
 DBMS_OUTPUT.PUT_LINE('입원 차트에 추가하였습니다.');
END IF;        
END;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into ds_T values('DS058','22/11/27','골절','입원','D021','P015');

select * from ds_T;
select * from hp_T;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--2. 예약 입력시 진료과 의사 선택  - 담당 환자수가 적은 의사 부터 자동 배정

create OR REPLACE view res_view
as select * from res_t;

CREATE OR REPLACE TRIGGER res_view_tr 
instead OF insert on res_view referencing old as old new as new
for each row
DECLARE
begin
INSERT INTO res_t values (:NEW.res_no, :NEW.res_date, :NEW.res_name, :NEW.res_call, :NEW.m_no,(select doc_no from(   
select d.doc_no, ROW_NUMBER() OVER (ORDER BY (
select count(*) from pat_t p,doc_t d where p.doc_no = d.doc_no) desc) as rank_pa 
from pat_t p,doc_t d where substr(d.m_no,2)= substr(:NEW.m_no,2) and rownum < 2 group by d.doc_no order by rank_pa)
where rank_pa <2));
DBMS_OUTPUT.PUT_LINE('--------------------------------------');
DBMS_OUTPUT.PUT_LINE(:NEW.res_name||'님');
DBMS_OUTPUT.PUT_LINE('예약하였습니다.');
DBMS_OUTPUT.PUT_LINE('--------------------------------------');
end;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into res_view values ('RE050',sysdate,'이명재','01045679865','M002',null);

select * from res_view;
select * from res_t where res_no = 'RE050';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---MERGE--------------------------------------------------------------------------------------------------------------------------------------------------------------------

MERGE INTO res_t r1m
USING
( SELECT res_no
    FROM res_t
    WHERE res_call = :NEW.res_call ) r2
ON ( r1m.res_no = r2.res_no)
WHEN MATCHED THEN
UPDATE
SET r1m.res_no = r2.res_no
  , r1m.res_date = r2.res_date
  , r1m.res_name = r2.res_name
  , r1m.res_call = r2.res_call
  , r1m.m_no = r2.m_no
  , r1m.doc_no = (select doc_no from(   
select d.doc_no, ROW_NUMBER() OVER (
ORDER BY (select count(*) from pat_t p,doc_t d where p.doc_no = d.doc_no and substr(d.m_no,2)= 001) desc) as rank_pa from pat_t p,doc_t d group by d.doc_no)
where rank_pa <2);


--데이터 추가 함수----------------------------------------------------------------------------------------------------------------------------------------------------------------

--전화번호 생성
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select random_call 전화번호 from dual;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--환자 주민등록번호
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select random_pr 환자주민번호 from dual;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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



