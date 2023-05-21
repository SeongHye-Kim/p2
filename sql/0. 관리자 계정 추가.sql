-- setting
-- 11g 호환을 위해 사용함
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 일반계정을 생성 : 관리자로 접속 
-- > 아이디 ---- 비번이 ----인 계정을 생성함
CREATE USER team03 IDENTIFIED BY 1234;

-- 접속 권한 부여해야 DB에 접속을 할수 있음
-- 관리자로 접속을 했는지 일반계정으로 접속을 했는지 헷갈리면 안됨
-- grant 권한 부여
grant connect, resource to team03;
grant create view to team03;

-- 테이블 사용 권한 부여
alter user test quota unlimited on users;
ALTER USER team03 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

create directory PROJECT_DIR as 'D:\\'; --디렉토리 경로 설정,생성 (관리자 로그인 필수)
grant read, write on directory PROJECT_DIR to test01; --디렉토리의 사용권한 부여 (관리자 로그인 필수)

SET SERVEROUTPUT ON  

--녹색 실행 버튼 ->  지정한 범위 만큼만 실행 (단위 별로 실행)
--두번째 실행 버튼 -> 한꺼번에 실행

