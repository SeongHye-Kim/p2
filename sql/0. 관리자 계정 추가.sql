-- setting
-- 11g ȣȯ�� ���� �����
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- �Ϲݰ����� ���� : �����ڷ� ���� 
-- > ���̵� ---- ����� ----�� ������ ������
CREATE USER team03 IDENTIFIED BY 1234;

-- ���� ���� �ο��ؾ� DB�� ������ �Ҽ� ����
-- �����ڷ� ������ �ߴ��� �Ϲݰ������� ������ �ߴ��� �򰥸��� �ȵ�
-- grant ���� �ο�
grant connect, resource to team03;
grant create view to team03;

-- ���̺� ��� ���� �ο�
alter user test quota unlimited on users;
ALTER USER team03 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

create directory PROJECT_DIR as 'D:\\'; --���丮 ��� ����,���� (������ �α��� �ʼ�)
grant read, write on directory PROJECT_DIR to test01; --���丮�� ������ �ο� (������ �α��� �ʼ�)

SET SERVEROUTPUT ON  

--��� ���� ��ư ->  ������ ���� ��ŭ�� ���� (���� ���� ����)
--�ι�° ���� ��ư -> �Ѳ����� ����

