/*
    <SELECT>
    ������ ��ȸ�� �� ���Ǵ� ����
    
    >>RESULT SET : SELECT���� ���� ��ȸ�� �����(��, ��ȸ�� �ൿ���� ������ �ǹ�)
    
    [ǥ����]
    SELECT ��ȸ�ϰ��� �ϴ� �÷�1, �÷�2,.....
    FROM ���̺��;
    
    *�ݵ�� �����ϴ� �÷����� ����Ѵ�.!!!���� �÷� ���� ������!!!!!    
    
*/

--EMPLOYEE ���̺��� ��� �÷�(*) ��ȸ
--SELECT EMP_ID,EMP_NAME
SELECT *
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �纯, �̸�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

--JOB ���̺��� ��� �÷� ��ȸ
SELECT *
FROM JOB;

---------------------------�ǽ�����-------------------------------
--1.JOB ���̺��� ���޸� ��ȸ
SELECT JOB_NAME
FROM JOB;

--2.DEPARTMENT ���̺��� ��� �÷� ��ȸ
SELECT *
FROM DEPARTMENT;

--3.DEPARTMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT;

--4.EMPLOYEE ���̺��� �����, �̸���, ��ȭ��ȣ,�Ի���, �޿���ȸ
SELECT * --EMP_NAME,EMAIL,PHONE,HIRE_DATE,SALARY --��ü��ȸ���� �ϸ� ���ϴ�.
FROM EMPLOYEE;


/*
    < �÷����� ���� �������>
    SELECT �� �÷��� �ۼ� �κп� ������� ��� ����(�̶�, ��� ����� ��� ��ȸ)
*/
--EMPLOYEE ���̺��� �����, ����� ����(�޿� * 12)��ȸ
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

--EMPLOYEE ���̺��� �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

--EMPLOYEE ���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ� ���Ե� ����((�޿�+���ʽ�*�޿�)*12) ��ȸ
SELECT EMP_NAME, SALARY, BONUS,SALARY*12
FROM EMPLOYEE;
-->������� ���� �� NULL���� ������ ��� ��������� ����� ������ ������ NULL�� ���´�.

--EMPLOYEE���̺��� �����, �Ի���
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

--EMPLOYEE �� �����, �Ի���, �ٹ��ϼ�(���� ��¥ - �Ի���)
--DATE ���ĳ����� ������ �����ϴ�.
--*���� ��¥ : SYSDATE
SELECT EMP_NAME, HIRE_DATE,SYSDATE - HIRE_DATE
FROM EMPLOYEE;
--DATE - DATE : ������� �� ������ ����!!
--��, ���� �������� ������ DATE ���� ��/��/��/��/��/�� ������ �ð����������� ������ �ϱ⶧��!!
--�Լ������ϸ� ����ϰ� ��� Ȯ�� ���� => ���߿� ���!

---------------------------------------------------------------------------
/*
    <�÷��� ��Ī �����ϱ�>
    ��������� �ϰԵǸ� �÷��� �������ϴ�.... �̶� �÷������� ��Ī �ο��ؼ� ����ϰ� ������
    
    [ǥ����]
    �÷��� ��Ī / �÷��� AS ��Ī/ �÷��� "��Ī" / �÷��� AS "��Ī"
    
    AS���̵� �Ⱥ��̵� �ο��ϰ��� �ϴ� ��Ī�� ���� Ȥ�� Ư�����ڰ� ���Ե� ��� �ݵ�� �ֵ���ǥ�� ������Ѵ�.
*/
SELECT EMP_NAME �����,SALARY AS �޿�,SALARY*12 AS "����(��)",(SALARY+SALARY*BONUS)*12 AS"�� �ҵ�(���ʽ�����)"
FROM EMPLOYEE;

--------------------------------------------------------------------------------
/*
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�('')
    
    SELECT ���� ���ͷ��� �����ϸ� ��ġ ���̺�� �����ϴ� ������ ó�� ��ȸ����
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ���� ���
*/

--EMPLOYEE ���̺��� ���, �����, �޿� ��ȸ
SELECT EMP_NO, EMP_NAME, SALARY, '��' AS "����"
FROM EMPLOYEE;

/*
    <���� ������ : ||>
    ���� �÷������� ��ġ �ϳ��� �÷��� �� ó�� �����ϰų�, �÷����� ���ͷ��� ������ �� �ִ�.
    
    System.out.println("num�� �� : " + num);
*/

--���, �̸�, �޿��� �ϳ��� �÷����� ��ȸ
SELECT EMP_NO || EMP_NAME || SALARY
FROM EMPLOYEE;

--�÷����� ���ͷ� �� ����
--XXX�� ������ XX�� �Դϴ�. => �÷��� ��Ī : �޿�����
SELECT EMP_NAME || '�� ������'||SALARY||'�� �Դϴ�.' AS"�޿�����"
FROM EMPLOYEE;

--------------------------------------
/*
    <DISTINCT>
    �÷��� �ߺ��� ������ �ѹ����� ǥ���ϰ��� �� �� ���
*/
--���� �츮ȸ�翡 � ������ ������� �����ϴ��� �ñ���

SELECT JOB_CODE
FROM EMPLOYEE; --����� 23���� ������ ���δ� ��ȸ����.

--EMPLOYEE�� �����ڵ�(�ߺ�����)��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE; --�ߺ��� ���� �Ǿ 7�ุ ��ȸ

--������� � �μ��� �����ִ��� �ñ��ϴ�.
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE; --null : ���� �μ� ��ġ �ȵ� ���

--���� ���� : DISTINCT�� SELECT ���� �� �ѹ��� ��� ����
/* ���� ����
SELECT DISTINCT JOB_CODE,DISTINCT DEPT_CODE
FROM EMPLOYEE;
*/

SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;
--(JOB_CODE, DEPT_CODE)������ ��� �ߺ� �Ǻ�

--==========================================================================

/*
    <WHERE ��>
    ��ȸ�ϰ��� �ϴ� ���̺�κ��� Ư�� ���ǿ� �����ϴ� �����͸��� ��ȸ�ϰ��� �� �� ���
    �̶� WHERE���� ���ǽ��� �����ϰ� �ȴ�.
    ���ǽĿ����� �پ��� �����ڵ� ��� ����!!
    
    [ǥ����]
    SELECT �÷�1, �÷�2,....
    FROM ���̺��
    WHERE ���ǽ�;
    
    [�񱳿�����]
    > , < , >= , <=    --------->��Һ�
    =                  --------->�����
    !=, ^=, <>         --------->�������� ������ ��
*/

--EMPLOYEE ���� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ(�̶�, ��� �÷� ��ȸ)
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE ���� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ常 ��ȸ
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

--EMPLOYEE ���� �μ��ڵ尡 'D1'�� �ƴ� ������� ���, �����, �μ��ڵ� ��ȸ
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE
--WHERE DEPT_CODE != 'D1'; --NULL�� ������� �ȳ��Դ�.
--WHERE DEPT_CODE ^= 'D1'; --NULL�� ������� �ȳ��Դ�.
WHERE DEPT_CODE <> 'D1';   --NULL�� ������� �ȳ��Դ�.

--�޿��� 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--EMPLOYEE���� ���� ��(ENT_YN �÷����� 'N')�� ������� ���, �̸�, �Ի���
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

----------------------�ǽ�����--------------------------------
--1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ����(���ʽ� ������) ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY*12
FROM EMPLOYEE
WHERE SALARY >=3000000;

--2. ������ 5000���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, SALARY*12 AS "����", DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;
--WHERE ���� >= 50000000; --����!!!! (WHERE�� ������ SELECT ���� �ۼ��� ��Ī ��� �Ұ�!!!)

-- ���� ���� ����
-- FROM��  => WHERE�� => SELECT��

--3. �����ڵ� 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE != 'J3';

--�μ��ڵ尡 'D9' �̸鼭 �޿��� 500���� �̻��� ������� ���, �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_ID,EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >=5000000;

--�μ���尡 'D6' �̰ų� �޿��� 300���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY > 3000000;

--�޿��� 350���� �̻� 600���� ���ϸ� �޴� ������� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
--WHERE 3500000 <= SAKARY <= 6000000; ���� �߻�!! �ڹٶ� ���������̴�.
--WHERE 3500000<= SALARY AND SALARY <=6000000;
WHERE SALARY>= 3500000 AND SALARY <=6000000; -- �Ϲ������δ� �� ������!!!!

------------------------------------------------------------------

/*
    <BETWEEN AND>
    ���ǽĿ��� ���Ǵ� ����
    �� �̻� �� ������ ������ ���� ������ ������ �� ���Ǵ� ������
    
    [ǥ����]
    �񱳴���÷� BETWEEN A(��1) AND B(��2)
    => �ش� �÷��� ���� A(��1)�̻��̰� B(��2) ������ ���
*/

SELECT EMP_NAME, EMP_ID,SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

--���� ���� ���� ���� ������� ��ȸ�ϰ� �ʹٸ�? 350�̸� + 600�ʰ�
SELECT EMP_NAME,EMP_ID, SALARY
FROM EMPLOYEE
--WHERE SALARY <3500000 OR SALARY > 6000000;
--WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
--NOT : ������������ => �ڹٿ����� !
--�÷��� �� �Ǵ� BETWEEN �տ� ���԰���!

--�Ի����� '90/01/01' ~ '01/01/01'
SELECT *
FROM EMPLOYEE
--WHERE HIRE_DATE > = '90/01/01' AND HIRE_DATE <= '01/01/01'; --DATE������ ��Һ� �����ϴ�.
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

--------------------------------------------------------------------------

/*
    <LIKE>
    ���ϰ��� �ϴ� �÷� ���� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    [ǥ����]
    �񱳴���÷� LIKE 'Ư������'
    
    - Ư�� ���� ���ý� '%' , '_' �� ���ϵ� ī��� ����� �� �ִ�.
    
    >>'%' : 0���� �̻�
    EX)�񱳴���÷�  LIKE '����%'          => �񱳴���� �÷����� ���ڷ� "����"�Ǵ°� ��ȸ
       �񱳴���÷�  LIKE '%����'           => �񱳴���� �÷����� ���ڷ� "��"���°� ��ȸ
       �񱳴���÷� LIKE '%����%'           => �񱳴���� �÷����� ���ڰ� "����"�Ǵ°� ��ȸ(Ű���� �˻�)
       
    >>'_' : 1���� �̻�
    EX) �񱳴���÷� LIKE '_����'           => �񱳴���� �÷����� ���ھտ� ������ �ѱ��ڸ� �� ��� ��ȸ
        �񱳴���÷� LIKE '_����'           => �񱳴���� �÷����� ���ھտ� ������ �α��ڰ� �� ��� ��ȸ
        �񱳴���÷� LIKE '_����_'          => �񱳴���� �÷����� ���� �հ� ���� �ڿ� ������ �ѱ��ھ� �� ���
    
*/

--����� �� ���� ������ ������� �����, �޿�, �Ի���, ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

--�̸��� �Ϸ� ������ ������� �����, �ֹι�ȣ, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

--�̸��� �ϰ� ���Ե� ������� �����, �ֹι�ȣ, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

--�̸��� ��� ���ڰ� �� �� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

--��ȭ��ȣ�� 3��° �ڸ��� 1�� ������� ���, �����, ����, �̸��� ��ȸ
--���ϵ�ī�� : _(1����), %(0����)
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

--**Ư�����̽�
--�̸��� �� _ �������� �ձ��ڰ� 3������ ������� ���, �̸�, �̸��� ��ȸ
--EX) sim_bs@kh.or.kr, sun_di@kh.or.kr
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE'____%';--���ߴ� ��� ���� ����!
--���ϵ�ī��� ���ǰ� �ִ� ���ڿ� �÷����� ��� ���ڰ� �����ϱ� ������ ����� ��ȸ �ȵ�
--> ��� ���ϵ�ī��� ��� ������ ������ ��������ߵ�!!
-->������ ������ ����ϰ��� �ϴ� �� �տ� ������ ���ϵ� ī�带 �����ϰ� ������ ���ϵ� ī�带 ESCAPE OPTION���� ����ؾߵ�!

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

--���� ������� �ƴ� �� ���� ����� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE NOT EMAIL LIKE '___$_%' ESCAPE '$'; --NOT��ġ �Ѵ� ����
--WHERE EMAIL NOT LIKE '___$_%' ESCAPE '$'; --NOT ��ġ �Ѵ� ����

----------------------------�ǽ�����------------------------------------------
--1. EMPLOYEE���� �̸��� '��'���� ������ ������� �����, �Ի��� ��ȸ
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

--2. EMPLOYEE���� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME,PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--3. EMPLOYEE���� �̸��� '��'�� ���ԵǾ� �ְ� �޿��� 240���� �̻��� ������� �����, �޿� ��ȸ
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%' AND SALARY >= 2400000;

--4. DEPARTMENT ���� �ؿܿ������� �μ����� �ڵ�, �μ��� ��ȸ
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '�ؿܿ���%';






