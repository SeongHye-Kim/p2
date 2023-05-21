
--테이블 삭제
drop table ds_T;
drop table hp_T;
drop table pat_T;
drop table doc_T;
drop table res_T;
drop table nur_T;
drop table medi_dep_T;
drop table rank_T;
drop table hr_T;

--테이블 생성

-- rank_T Table 직급
CREATE TABLE rank_T(
    r_no      VARCHAR2(50)    NOT NULL, 
    r_name    VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (r_no)
);

COMMENT ON TABLE rank_T IS '직급';
COMMENT ON COLUMN rank_T.r_no IS '직급번호';
COMMENT ON COLUMN rank_T.r_name IS '직급이름';




-- medi_dep_T Table 진료과
CREATE TABLE medi_dep_T(
    m_no      VARCHAR2(50)    NOT NULL, 
    m_name    VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (m_no)
);

COMMENT ON TABLE medi_dep_T IS '진료과';
COMMENT ON COLUMN medi_dep_T.m_no IS '진료과번호';
COMMENT ON COLUMN medi_dep_T.m_name IS '진료과이름';



-- nur_T Table 간호사
CREATE TABLE nur_T(
    nur_no      VARCHAR2(50)    NOT NULL, 
    nur_name    VARCHAR2(20)    NOT NULL, 
    nur_gen     VARCHAR2(50)    NOT NULL, 
    nur_call    VARCHAR2(50)    NOT NULL, 
    nur_rr      VARCHAR2(50)    NOT NULL, 
    m_no        VARCHAR2(50)    NOT NULL, 
    r_no        VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (nur_no)
);

COMMENT ON TABLE nur_T IS '간호사';
COMMENT ON COLUMN nur_T.nur_no IS '간호사번호';
COMMENT ON COLUMN nur_T.nur_name IS '이름';
COMMENT ON COLUMN nur_T.nur_gen IS '성별';
COMMENT ON COLUMN nur_T.nur_call IS '연락처';
COMMENT ON COLUMN nur_T.nur_rr IS '주민등록번호';
COMMENT ON COLUMN nur_T.m_no IS '진료과번호';
COMMENT ON COLUMN nur_T.r_no IS '직급번호';


ALTER TABLE nur_T
    ADD CONSTRAINT FK_nur_T_m_no_medi_dep_T_m_no FOREIGN KEY (m_no)
        REFERENCES medi_dep_T (m_no);

ALTER TABLE nur_T
    ADD CONSTRAINT FK_nur_T_r_no_rank_T_r_no FOREIGN KEY (r_no)
        REFERENCES rank_T (r_no);


-- res_T Table Create SQL
CREATE TABLE res_T(
    res_no      VARCHAR2(50)    NOT NULL, 
    res_date    VARCHAR2(50)    NOT NULL, 
    res_name    VARCHAR2(50)    NOT NULL, 
    res_call    VARCHAR2(50)    NOT NULL, 
    m_no        VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (res_no)
);

COMMENT ON TABLE res_T IS '예약';
COMMENT ON COLUMN res_T.res_no IS '예약번호';
COMMENT ON COLUMN res_T.res_date IS '예약날짜';
COMMENT ON COLUMN res_T.res_name IS '예약자이름';
COMMENT ON COLUMN res_T.res_call IS '예약자연락처';
COMMENT ON COLUMN res_T.m_no IS '진료과번호';

ALTER TABLE res_T
    ADD CONSTRAINT FK_res_T_m_no_medi_dep_T_m_no FOREIGN KEY (m_no)
        REFERENCES medi_dep_T (m_no); 

-- doc_T Table 의사
CREATE TABLE doc_T(
    doc_no      VARCHAR2(50)    NOT NULL, 
    doc_name    VARCHAR2(20)    NOT NULL, 
    doc_gen     VARCHAR2(50)    NOT NULL, 
    doc_call    VARCHAR2(50)    NOT NULL, 
    doc_rr      VARCHAR2(50)    NOT NULL, 
    m_no        VARCHAR2(50)    NOT NULL, 
    r_no        VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (doc_no)
);

COMMENT ON TABLE doc_T IS '의사';
COMMENT ON COLUMN doc_T.doc_no IS '의사번호';
COMMENT ON COLUMN doc_T.doc_name IS '이름';
COMMENT ON COLUMN doc_T.doc_gen IS '성별';
COMMENT ON COLUMN doc_T.doc_call IS '연락처';
COMMENT ON COLUMN doc_T.doc_rr IS '주민등록번호';
COMMENT ON COLUMN doc_T.m_no IS '진료과번호';
COMMENT ON COLUMN doc_T.r_no IS '직급번호';

ALTER TABLE doc_T
    ADD CONSTRAINT FK_doc_T_m_no_medi_dep_T_m_no FOREIGN KEY (m_no)
        REFERENCES medi_dep_T (m_no);

ALTER TABLE doc_T
    ADD CONSTRAINT FK_doc_T_r_no_rank_T_r_no FOREIGN KEY (r_no)
        REFERENCES rank_T (r_no);

-- pat_T Table 완자
CREATE TABLE pat_T(
    pat_no      VARCHAR2(50)    NOT NULL, 
    pat_name    VARCHAR2(50)    NOT NULL, 
    pat_age     VARCHAR2(50)    NOT NULL, 
    pat_gen     VARCHAR2(50)    NOT NULL, 
    pat_call    VARCHAR2(50)    NOT NULL, 
    pat_rr      VARCHAR2(50)    NOT NULL, 
    res_no      VARCHAR2(50)    NULL, 
    doc_no      VARCHAR2(50)    NOT NULL, 
    nur_no      VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (pat_no)
);

COMMENT ON TABLE pat_T IS '환자';
COMMENT ON COLUMN pat_T.pat_no IS '환자번호';
COMMENT ON COLUMN pat_T.pat_name IS '이름';
COMMENT ON COLUMN pat_T.pat_age IS '나이';
COMMENT ON COLUMN pat_T.pat_gen IS '성별';
COMMENT ON COLUMN pat_T.pat_call IS '연락처';
COMMENT ON COLUMN pat_T.pat_rr IS '주민등록번호';
COMMENT ON COLUMN pat_T.res_no IS '예약번호';
COMMENT ON COLUMN pat_T.doc_no IS '의사번호';
COMMENT ON COLUMN pat_T.nur_no IS '간호사번호';

ALTER TABLE pat_T
    ADD CONSTRAINT FK_pat_T_doc_no_doc_T_doc_no FOREIGN KEY (doc_no)
        REFERENCES doc_T (doc_no);

ALTER TABLE pat_T
    ADD CONSTRAINT FK_pat_T_nur_no_nur_T_nur_no FOREIGN KEY (nur_no)
        REFERENCES nur_T (nur_no);

ALTER TABLE pat_T
    ADD CONSTRAINT FK_pat_T_res_no_res_T_res_no FOREIGN KEY (res_no)
        REFERENCES res_T (res_no);

-- hr_T Table 입원실
CREATE TABLE hr_T(
    hr_no       VARCHAR2(50)    NOT NULL, 
    hr_price    number          NOT NULL, 
     PRIMARY KEY (hr_no)
);

COMMENT ON TABLE hr_T IS '입원실';
COMMENT ON COLUMN hr_T.hr_no IS '입원실번호';
COMMENT ON COLUMN hr_T.hr_price IS '입원실가격';


-- hp_T Table 입원환자
CREATE TABLE hp_T(
    hp_no       VARCHAR2(50)    NOT NULL, 
    in_date     DATE            NOT NULL, 
    out_date    DATE            NULL, 
    hp_docno    VARCHAR2(50)    NOT NULL, 
    nu_no       VARCHAR2(50)    NOT NULL, 
    hp_pano     VARCHAR2(50)    NOT NULL, 
    hr_no       VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (hp_no)
);

COMMENT ON TABLE hp_T IS '입원';
COMMENT ON COLUMN hp_T.hp_no IS '입원번호';
COMMENT ON COLUMN hp_T.in_date IS '입원날짜';
COMMENT ON COLUMN hp_T.out_date IS '퇴원날짜';
COMMENT ON COLUMN hp_T.hp_docno IS '의사번호';
COMMENT ON COLUMN hp_T.nu_no IS '간호사번호';
COMMENT ON COLUMN hp_T.hp_pano IS '환자번호';
COMMENT ON COLUMN hp_T.hr_no IS '입원실번호';

ALTER TABLE hp_T
    ADD CONSTRAINT FK_hp_T_hp_docno_doc_T_doc_no FOREIGN KEY (hp_docno)
        REFERENCES doc_T (doc_no);

ALTER TABLE hp_T
    ADD CONSTRAINT FK_hp_T_nu_no_nur_T_nur_no FOREIGN KEY (nu_no)
        REFERENCES nur_T (nur_no); 

ALTER TABLE hp_T
    ADD CONSTRAINT FK_hp_T_hp_pano_pat_T_pat_no FOREIGN KEY (hp_pano)
        REFERENCES pat_T (pat_no); 

ALTER TABLE hp_T
    ADD CONSTRAINT FK_hp_T_hr_no_hr_T_hr_no FOREIGN KEY (hr_no)
        REFERENCES hr_T (hr_no);

-- ds_T Table 진료
CREATE TABLE ds_T(
    ds_no       VARCHAR2(50)      NOT NULL, 
    ds_date     DATE              NOT NULL, 
    ds_note     VARCHAR2(1000)    NOT NULL, 
    ds_inout    VARCHAR2(50)      DEFAULT '외래' NULL, 
    doc_no      VARCHAR2(50)      NOT NULL, 
    pa_no       VARCHAR2(50)      NOT NULL, 
     PRIMARY KEY (ds_no)
);

COMMENT ON TABLE ds_T IS '진료';
COMMENT ON COLUMN ds_T.ds_no IS '진료번호';
COMMENT ON COLUMN ds_T.ds_date IS '진료날짜';
COMMENT ON COLUMN ds_T.ds_note IS '진료내용';
COMMENT ON COLUMN ds_T.ds_inout IS '입원유무';
COMMENT ON COLUMN ds_T.doc_no IS '의사번호';
COMMENT ON COLUMN ds_T.pa_no IS '환자번호';

ALTER TABLE ds_T
    ADD CONSTRAINT FK_ds_T_doc_no_doc_T_doc_no FOREIGN KEY (doc_no)
        REFERENCES doc_T (doc_no);

ALTER TABLE ds_T
    ADD CONSTRAINT FK_ds_T_pa_no_pat_T_pat_no FOREIGN KEY (pa_no)
        REFERENCES pat_T (pat_no);

alter table  pat_T modify(pat_rr VARCHAR2(50) unique);
alter table  nur_T modify(nur_rr VARCHAR2(50) unique);
alter table  doc_T modify(doc_rr VARCHAR2(50) unique);
alter table  pat_T modify(pat_gen VARCHAR2(50) check (pat_gen  in('남','여')));
alter table  nur_T modify(nur_gen VARCHAR2(50) check (nur_gen  in('남','여')));
alter table  doc_T modify(doc_gen VARCHAR2(50) check (doc_gen  in('남','여')));
alter table  ds_T modify(ds_inout VARCHAR2(50) check (ds_inout  in('입원','외래')));

ALTER TABLE RES_T ADD DOC_NO VARCHAR(50);
