/* 시퀀스 생성 - 적용 - 변경 */

insert into emp(empno, ename, job, mgr, hiredate)
    values((select nvl(max(empno), 0) + 1 from emp),
        'GENT', 'CLERK', 7839, TRUNC(SYSDATE));
        
SELECT * FROM EMP;

CREATE SEQUENCE SCOTT.EMP_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
    
INSERT INTO  EMP
    VALUES(EMP_SEQ.NEXTVAL
        , 'TIGER'
        , 'ANALYST'
        , 7566
        , TRUNC(SYSDATE)
        , 3000
        , NULL
        , 20);
        
SELECT * FROM EMP;

SELECT EMP_SEQ.NEXTVAL FROM DUAL;

INSERT INTO EMP
    VALUES(EMP_SEQ.NEXTVAL
        , 'LION'
        , 'MANAGER'
        , 7566
        , TRUNC(SYSDATE)
        , 3000
        , NULL
        , 20);
        
SELECT *FROM EMP;

create table dept_sequence
    as select  *
        from dept
            where 1<>1;
        
select * from dept_sequence;

create sequence seq_dept_sequence
    increment by 10
    start with 10
    maxvalue 90
    MINVALUE 0
    nocycle
    cache 2;
    
select * from user_sequences;

insert into dept_sequence (deptno, dname, loc)
    values (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL  FROM DUAL;

insert into dept_sequence (deptno, dname, loc)
    values (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

COMMIT;



