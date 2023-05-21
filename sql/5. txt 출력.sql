
-- drop directory project_dir; --디렉토리 삭제 (관리자 로그인 필수)
-- dump 생성
create directory PROJECT_DIR as 'D:\\'; --디렉토리 경로 설정,생성 (관리자 로그인 필수)
grant read, write on directory PROJECT_DIR to test01; --디렉토리의 사용권한 부여 (관리자 로그인 필수)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW chart_view as
select rownum 차트번호,ds.ds_no 진료번호, ds.doc_no 의사번호,dc.doc_name 의사이름, ds.pa_no 환자번호, pa.pat_name 환자이름, ds.ds_note 소견
from ds_t ds, pat_t pa, doc_t dc where ds.doc_no = dc.doc_no and  ds.pa_no = pa.pat_no;

select * from chart_view;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 환자 한명의 역대 진료차트 파일 출력
CREATE OR REPLACE PROCEDURE ds_WFile_name(fname varchar2,pname varchar2) IS
    v_output UTL_FILE.FILE_TYPE;
    v_result VARCHAR2(4000);
    CURSOR sql_cur IS
    SELECT 진료번호, 의사이름, 환자이름, 소견
    FROM chart_view
    where 환자이름 = pname;
    BEGIN
     v_output := UTL_FILE.FOPEN('PROJECT_DIR', fname,'w',32767);
            DBMS_OUTPUT.PUT_LINE('진료번호'||'   '||'의사이름'||'    '||'환자이름'||'    '||'소견');
        FOR v_cur IN sql_cur LOOP
            v_result := v_cur.진료번호||'  '||v_cur.의사이름||'  '||v_cur.환자이름||'  '||v_cur.소견;
            DBMS_OUTPUT.PUT_LINE(v_cur.진료번호||'     '||v_cur.의사이름||'     '||v_cur.환자이름||'   '||v_cur.소견);
            UTL_FILE.PUT_LINE(v_output, v_result);
        END LOOP;
        UTL_FILE.FCLOSE(v_output);
     EXCEPTION
        WHEN UTL_FILE.INVALID_PATH THEN
            DBMS_OUTPUT.PUT_LINE('잘못된 경로');
        WHEN UTL_FILE.INVALID_OPERATION THEN
            DBMS_OUTPUT.PUT_LINE('잘못된 쿼리');
            END;
/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec ds_WFile_NAME('jinho.txt','성진호');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 전체 진료차트 파일 출력
CREATE OR REPLACE PROCEDURE ds_WFile(fname varchar2) IS
    v_output    UTL_FILE.FILE_TYPE;
    v_result     VARCHAR2(4000);
    CURSOR   sql_cur IS
    SELECT    진료번호, 의사이름, 환자이름, 소견
    FROM      chart_view;
    BEGIN
     v_output := UTL_FILE.FOPEN('PROJECT_DIR', fname,'w',32767);
        FOR v_cur IN sql_cur LOOP
            v_result := v_cur.진료번호||' | '||v_cur.의사이름||' | '||v_cur.환자이름||' | '||v_cur.소견;
            DBMS_OUTPUT.PUT_LINE(v_cur.진료번호||'      '||v_cur.의사이름||'      '||v_cur.환자이름||'      '||v_cur.소견);
            UTL_FILE.PUT_LINE(v_output, v_result);
        END LOOP;
        UTL_FILE.FCLOSE(v_output);
     EXCEPTION
        WHEN UTL_FILE.INVALID_PATH THEN
            DBMS_OUTPUT.PUT_LINE('잘못된 경로');
        WHEN UTL_FILE.INVALID_OPERATION THEN
            DBMS_OUTPUT.PUT_LINE('잘못된 쿼리');
            END;
/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec ds_WFile('Chart.txt');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------