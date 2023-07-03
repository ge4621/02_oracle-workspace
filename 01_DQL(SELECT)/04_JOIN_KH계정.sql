SELECT *FROM EMPLOYEE  --D9
WHERE EMP_NAME = '������';
SELECT * FROM DEPARTMENT
WHERE DEPT_ID = 'D9' ;--L1
SELECT * FROM LOCATION
WHERE LOCAL_CODE = 'L1'; --KO
SELECT * FROM NATIONAL
WHERE NATIONAL_CODE = 'KO';
--������ ����Ǿ� �ִ�.

/*
    <JOIN>
    �� �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
    ��ȸ����� �ϳ��� �����(RESULT SET)�� ����
    
    ������ �����ͺ��̽��� �ּ����� �����ͷ� ������ ���̺� �����͸� ��� ����.(�ߺ��� �ּ�ȭ �ϱ� ���� �ִ��� �ɰ��� �����Ѵ�.)
    
    --� ����� � �μ��� �����ִ��� �ñ���!!!�ڵ� ����, �̸�����...
    
    =>������ �����ͺ��̽����� SQL���� �̿��� ���̺��� "����"�� �δ� ���
        (������ �� ��ȸ�� �ϴ°� �ƴ϶� �� ���̺� ������ν��� �����͸� ��Ī�ؼ� ��ȸ ���Ѿ���!!!)
        
                JOIN ũ�� "����Ŭ ���뱸��"�� "ANSI����"(ANSI == �̱� ����ǥ����ȸ) => �ƽ�Ű�ڵ�ǥ ����� ��ü!
                                    [JOIN �������]
                ����Ŭ ���� ����               |               ANSI����
--------------------------------------------------------------------------------------
                    �����                  |         ���� ����([INNER] JOIN) => JOIN USING / ON
                (EQUAL JOIN)                |          �ڿ� ����(NATURAL JOIN) => JOIN USING
 ---------------------------------------------------------------------------------------------------------------------
                    ��������                  |     ���� �ܺ�����(LEFT OUTER JOIN)
                (LEFR OUTER)                |      ������ �ܺ� ����(RIGHT OUTER JOIN)
                (RIGHT OUTER)               |       ��ü �ܺ�����(FULL OUTER FOIN)
-------------------------------------------------------------------------------------------------
                ��ü����(SELF JOIN)           |     JOIN ON
            �� ����(NON EQUAL JOIN)        |
------------------------------------------------------------------------------------------                                             
*/
--��ü ������� ���, �����, �μ��ڵ�, �μ��� ��ȸ�ϰ��� �� ��
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

--��ü ������� ���, �����, �����ڵ�, ���޸� ��ȸ �ϰ��� �� ��
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

SELECT JOB_CODE, JOB_NAME
FROM JOB;

/*
    1. � ����(EQUAL JOIN) / ��������(INNER JOIN)
        �����Ű�� �÷��� ���� ��ġ�ϴ� �ൿ�鸸 ���εǼ� ��ȸ(==��ġ�ϴ� ���� ���� ���� ��ȸ���� ����)
*/
-- >>����Ŭ ���� ����
--FROM���� ��ȸ�ϰ��� �ϴ� ���̺���� ����(, �����ڷ�)
--WHERE���� ��Ī��ų �÷�(�����)�� ���� ������ ������

--1) ������ �� �÷����� �ٸ� ���(EMPLOYEE : DEPT_CODE, DEPARTMENT : DEPT_ID)
--���, �����, �μ��ڵ�, �μ����� ���� ��ȸ
SELECT EMP_ID,EMP_NAME,DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;
--��ġ�ϴ� ���� ���� ���� ��ȸ���� ���ܵȰ� Ȯ�� ����
--DEPT_CODE �� NULL�� ��� ��ȸX, DEPT_ID�� D3,D4,D7��ȸ X

--2)������ �� �÷����� ���� ���(EMPLOYEE : JOB_CODE, JOB : JOB_CODE)
--���, �����, �����ڵ�,���޸�
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE,JOB
WHERE JOB_CODE = JOB_CODE;
--ambiguously :�ָ��ϴ�, ��ȣ�ϴ�.

--1)�ذ���1. ���̺���� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME,EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE,JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

--2)�ذ���2. ���̺� ��Ī�� �ο��ؼ� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E,JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-->>ANSI ����
--FROM���� ������ �Ǵ� ���̺��� �ϳ� ��� �� ��
--JOIN���� ���� ��ȸ�ϰ��� �ϴ� ���̺� ��� + ��Ī��ų �÷��� ���� ���ǵ� ���
--JOIN USING, JOIN ON

--1)������ �� �÷����� �ٸ����(EMPLOYEE : DEPT_CODE, DEPARTMENT : DEPT_ID)
--������ JOIN ON �������θ� ��� ����!!
-- ���, �����, �μ��ڵ�, �μ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--2)������ �� �÷����� ���� ���(E: JOB_CODE, J:JOB_CODE)
--JOIN ON, JOIN USING ���� ��� ����!
--���, �����, �����ڵ�, ���޸�

SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB ON (JOB_CODE = JOB_CODE);

--�ذ��� 1. ���̺�� �Ǵ� ��Ī�� �̿��ؼ� �ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

--�ذ��� 2. JOIN USING ���� ����ϴ� ���(�� �÷����� ��ġ�Ҷ��� ��� ����)
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

----[�������]----
--�ڿ�����(NATURAL JOIN) : �� ���̺��� ������ �÷��� �Ѱ��� ������ ���
SELECT EMP_ID,EMP_NAME, JOB_CODE,JOB_NAME
FROM  EMPLOYEE
NATURAL JOIN JOB;

--�߰������� ���ǵ� ��� ���� ����
--������ �븮�� ����� �̸�, ���޸�, �޿� ��ȸ
-- >>����Ŭ ���� ����
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
AND J.JOB_NAME = '�븮';

-->>ANSI����
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE--1��
JOIN JOB USING(JOB_CODE)--2��
WHERE JOB_NAME='�븮';--3��
----------------------------------�ǽ�����--------------------------------------------
--1.�μ��� �λ�������� ������� ���, �̸�, ���ʽ�(EMPLOYEE) ��ȸ
-->>����Ŭ ���뱸��
SELECT EMP_NO, EMP_NAME, BONUS
FROM EMPLOYEE ,DEPARTMENT 
WHERE DEPT_CODE = DEPT_ID
AND DEPT_TITLE = '�λ������';



SELECT EMP_NO,EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND DEPT_TITLE = '�λ������';


SELECT *
FROM EMPLOYEE;  --DEPT_CODE

SELECT *
FROM DEPARTMENT; --DEPT_ID




-->>ANSI����
SELECT EMP_NO, EMP_NAME, BONUS
FROM EMPLOYEE 
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE  DEPT_TITLE = '�λ������';


--2. DEPARTMENT�� LOCATION DMF �����ؼ� ��ü �μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
-->>����Ŭ ���뱸��
SELECT *FROM DEPARTMENT; --LOCATION_ID
SELECT *FROM LOCATION DMF; --LOCAL_CODE

SELECT DEPT_ID, DEPT_TITLE,LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT,LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

-->>ANSI����
SELECT DEPT_ID, DEPT_TITLE,LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

--3. ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
-->>����Ŭ ���뱸��
SELECT EMP_ID,EMP_NAME,BONUS,DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND BONUS IS NOT NULL;

SELECT*
FROM EMPLOYEE;   --DEPT_CODE

SELECT* FROM DEPARTMENT;        --DEPT_ID



-->>ANSI����

SELECT EMP_ID,EMP_NAME,BONUS,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;


--4, �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿�, �μ��� ��ȸ
-->>����Ŭ ���뱸��
SELECT EMP_NAME,SALARY,DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND DEPT_TITLE != '�ѹ���';

-->>ANSI����
SELECT EMP_NAME,SALARY,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '�ѹ���';

--���� ���� DEPT_CODE�� NULL�ΰ͵� ������ ���� ����

--------------------------------------------------------------------------------
/*
    2. ���� ���� / �ܺ� ����( OUTER JOIN )
    �� ���̺� ���� JOIN�� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ ����
    ��, �ݵ�� LEFT / RIGHT �����ؾߵ�! (������ �Ǵ� ���̺� ����)
*/
--�����, �μ���, �޿�, ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--�μ� ��ġ�� ���� �ȵ� ��� 2�� ���� ������ ��ȸX
--�μ��� ������ ����� ���� �μ� ���� ��쵵 ��ȸX

--1) LEFT [OUTER] JOIN : �� ���̺� �� ���� ����� ���̺� �������� JOIN
-->>ANSI����
SELECT EMP_NAME, DEPT_TITLE,SALARY, SALARY*12
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);--EMPLOYEE�� �ִ°� ������ �� �����°���
-- �μ� ��ġ�� ���� �ʾҴ� 2���� ��� ������ ��ȸ��

-->>����Ŭ ���� ����
SELECT EMP_NAME, DEPT_TITLE,SALARY, SALARY*12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+); --�������� ����� �ϴ� ���̺��� �ݴ��� �÷��ڿ� (+) ���̱�

--2) RIGHT [OUTER] JOIN : �� ���̺� �� ������ ����� ���̺��� �������� JOIN
-->>ANSI����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-->>����Ŭ ���� ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

--3)FULL [OUTER] JOIN : �� ���̺��� ���� ��� ���� ��ȸ�� �� ����(��, ����Ŭ���뱸�����δ� �ȵ�)
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

/*
    3.�� ����(NON EQUAL JOIN) => ��� �׳� �����
    ��Ī��ų �÷��� ���� ���� �ۼ��� '=(��ȣ)'�� ������� �ʴ� ���ι�
    ANSI �������δ� JOIN ON�� ��� ����
    
*/
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE;

SELECT *
FROM SAL_GRADE;

--�����, �޿�, �ִ� ���� �ѵ�
-->> ����Ŭ ����
SELECT EMP_NAME, SALARY, MAX_SAL
FROM EMPLOYEE, SAL_GRADE
--WHERE SALARY >= MIN_SAL AND SALARY <= MAX_SAL;
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

-->>ANSI����
SELECT EMP_NAME, SALARY, MAX_SAL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

--------------------------------------------------------------------------------
/*
    4.��ü����( SELF JOIN)
    ���� ���̺��� �ٽ� �ѹ� �����ϴ� ���
*/
SELECT * FROM EMPLOYEE;

--��ü ����� ���,�����, ����μ��ڵ�  => EMPLOYEE E
--     ����� ���, �����, ����μ��ڵ� => EMPLOYEE M

-->>����Ŭ ���� ����
SELECT E.EMP_ID AS "����� ���",E.EMP_NAME AS " �����",E.DEPT_CODE AS "����μ��ڵ�",
        M.EMP_ID AS "������", M.EMP_NAME AS "�����", M.DEPT_CODE AS " ����μ��ڵ�"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

SELECT EMP_ID, EMP_NAME,DEPT_CODE, MANAGER_ID FROM EMPLOYEE;

-->>ANSI ���� ����
SELECT E.EMP_ID AS "����� ���",E.EMP_NAME AS " �����",E.DEPT_CODE AS "����μ��ڵ�",
        M.EMP_ID AS "������", M.EMP_NAME AS "�����", M.DEPT_CODE AS " ����μ��ڵ�"
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);
--������� ����� ������ �ϰ� ������ LEFT JOIN

--------------------------------------------------------------------------------
/*
    <���� JOIN>
    2�� �̻��� ���̺��� ������ JOIN�� �� 
*/
--���, �����, �μ���, ���޸� ��ȸ

SELECT * FROM EMPLOYEE; --DEPT_CODE, JOB_CODE
SELECT * FROM DEPARTMENT;   --EDPT_ID
SELECT * FROM JOB;          --JOB_CODE

-->> ����Ŭ ���� ����
SELECT EMP_ID,EMP_NAME,DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE DEPT_CODE = DEPT_ID
AND E.JOB_CODE = J.JOB_CODE;

-->>ANSI����
SELECT EMP_ID,EMP_NAME,DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE);

--��� ,�����, �μ���, ������
SELECT * FROM EMPLOYEE; --DEPT_CODE
SELECT * FROM DEPARTMENT;   --DEPT_ID       LOCATION_ID
SELECT * FROM LOCATION; --                  LOCAL_CODE

-->>����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE,DEPARTMENT,LOCATION
WHERE DEPT_CODE = DEPT_ID
AND LOCATION_ID = LOCAL_CODE;

-->>ANSI ���뱸��
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

----------------------------------�ǽ�����-----------------------------------------
--1. ���, �����, �μ���, ������, ������ ��ȸ(EMP,DEP,LOC,NAT ����)
SELECT * FROM EMPLOYEE;     --DEPT_CODE
SELECT * FROM DEPARTMENT;   --DEPT_ID           LOCATION_ID
SELECT * FROM LOCATION;     --                  LOCAL_CODE      NATIONAL_CODE
SELECT * FROM NATIONAL;     --                                  NATIONAL_CODE

-->>����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME,NATIONAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION L, NATIONAL N
WHERE DEPT_CODE = DEPT_ID
AND LOCATION_ID = LOCAL_CODE
AND L.NATIONAL_CODE = N.NATIONAL_CODE;
--EMPLOYEE, DEPARTMENT �̵ΰ��� ��Ī�� ������ ����� ����.


-->>ANSI ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME,NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL M USING (NATIONAL_CODE);


--2. ���, �����, �μ���, ���޸�, ������, ������, �ش�޿� ��޿��� ������ �ִ� �ִ� �ݾ� ��ȸ
SELECT * FROM EMPLOYEE;  
SELECT * FROM DEPARTMENT; 
SELECT * FROM JOB;
SELECT * FROM LOCATION;                     
SELECT * FROM NATIONAL;                                     
SELECT * FROM SAL_GRADE;

-->>����Ŭ ���� ����
/*
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_CODE,LOCAL_NAME,NATIONAL_NAME,MAX_SAL
FROM EMPLOYEE E, DEPARTMENT D,JOB J, NATIONAL N, LOCATION L, SAL_GRADE S
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.JOB_CODE = J.JOB_CODE
AND D.LOCATION_ID = L.LOCAL_CODE
AND L.NATIONAL_CODE = N.NATIONAL_CODE;
*/

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, MAX_SAL
FROM EMPLOYEE E, DEPARTMENT, JOB J, LOCATION L, NATIONAL N, SAL_GRADE S
WHERE DEPT_CODE = DEPT_ID
AND E.JOB_CODE = J.JOB_CODE
AND LOCATION_ID = LOCAL_CODE
AND L.NATIONAL_CODE = N.NATIONAL_CODE
AND E.SAL_LEVEL = S.SAL_LEVEL;


-->>ANSI ����
/*
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_CODE,LOCAL_NAME,NATIONAL_NAME,MAX_SAL
FROM EMPLOYEE 
JOIN DEPARTMENT  ON (DEPT_CODE = DEPT_ID)
JOIN JOB  USING(JOB_CODE)
JOIN LOCATION  ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING(NATIONAL_CODE)
JOIN SAL_GRADE USING(SAL_LEVEL);
*/

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, MAX_SAL
FROM EMPLOYEE
JOIN DEPARTMENT D ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN SAL_GRADE USING(SAL_LEVEL);











