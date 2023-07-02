-- 1. ��� ���̺��� ��翭 ���
SELECT *FROM EMP;

-- 2. ������̺��� �����ȣ, �̸�, ���� ��� (��Ī ���)
SELECT EMPNO AS "�����ȣ", ENAME AS "�̸�", SAL AS "����"
FROM EMP;

-- 3. ������̺��� �̸��� ������ ���� �ٿ��� ��� (��¿��� ) KING5000)
SELECT ENAME || SAL
FROM EMP;

-- 4. ������̺��� �̸��� ������ ���� �ٿ��� ��� (��¿���) KING�� ������ 5000�Դϴ�.)
SELECT ENAME || '�� ������ ' || SAL || '�Դϴ�.'
FROM EMP;

-- 5. ������̺��� �̸��� ������ ���� �ٿ��� ��� (��¿���) KING�� ������ PRESIDENT �Դϴ�.)
SELECT ENAME || '�� ������ ' || JOB || ' �Դϴ�.'
FROM EMP;

-- 6. ������̺��� ������ ����ϴµ� �ߺ��� �����͸� �����ϰ� ����غ��� (�ΰ��� ����)
-- �Ѱ��� ����� �����ð��� ������, �ٸ������ �����ð��� ���� => �˻��ؼ� ã�ƺ��� 
--1�� ���� DISTINCT ���(�����İ� ����)
SELECT DISTINCT JOB AS "����"
FROM EMP;

--2�� ���� (GROUP BY ��� ����)
SELECT JOB AS "����"
FROM EMP
GROUP BY JOB;


-- 7. �̸��� ������ ����ϴµ� ������ ���� ������� ���  
-- 7-1. ��Ī������ ���� ����
SELECT ENAME,SAL
FROM EMP
ORDER BY SAL;

-- 7_2. ��Ī���ι��� (ORDER BY ����)
SELECT ENAME AS "�̸�",SAL AS "����"
FROM EMP
ORDER BY ����;

-- 7_3. �÷������� ������ ����
SELECT ENAME AS "�̸�",SAL AS "����"
FROM EMP
ORDER BY 2;

-- 8. ������ 3000�� ����� �̸���, ����, ���� ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����"
FROM EMP
WHERE SAL =3000;

-- 9. ������ 3000�̻��� ����� �̸���, ����, ���� ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����"
FROM EMP
WHERE SAL >=3000;

-- 10. �̸��� SCOTT�� ����� �̸�, ����, ����, �Ի���, �μ���ȣ ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����", HIREDATE AS "�Ի���",EMPNO AS "�μ���ȣ"
FROM EMP
WHERE ENAME = 'SCOTT';

-- 11. ������ 3600 �̻��� ������� �̸��� ���� ���
SELECT ENAME AS "�̸�", SAL*12 AS "����"
FROM EMP
WHERE SAL*12 >=3600;

-- 12. �μ���ȣ�� 10���� ������� �̸�, ����, Ŀ�̼�, ���� + Ŀ�̼� ���
SELECT ENAME AS "�̸�", SAL AS "����", COMM AS "Ŀ�̼�", SAL+COMM AS "���� + Ŀ�̼�"
FROM EMP
WHERE DEPTNO = '10';

-- 13. ������ 1000���� 3000 ������ ������� �̸��� ���� ��� (�񱳿�����, BETWEEN AND ���� �ΰ��� ���� �� �ۼ�)
--�񱳿�����
SELECT ENAME AS "�̸�" , SAL AS"����"
FROM EMP
WHERE SAL > 1000 AND SAL <3000;

--BETWEEN AND ����
SELECT ENAME AS "�̸�" , SAL AS"����"
FROM EMP
WHERE SAL BETWEEN 1000 AND 3000;

-- 14. �̸��� ù���ڰ� S�� �����ϴ� ������� �̸��� ���� ���
SELECT ENAME AS "�̸�", SAL AS"����"
FROM EMP
WHERE ENAME LIKE 'S%';

-- 15. �̸��� �ι�° ö�ڰ� M�� ����� �̸��� ���
SELECT ENAME AS "�̸�"
FROM EMP
WHERE ENAME LIKE '_M%';

-- 16. �̸��� �� ���ڰ� T�� ������ ������� �̸��� ���
SELECT ENAME AS "�̸�"
FROM EMP
WHERE ENAME LIKE '%T';

-- 17. �̸��� A�� �����ϰ� �ִ� ������� �̸� ���
SELECT ENAME AS "�̸�"
FROM EMP
WHERE ENAME LIKE '%A%';

-- 18. Ŀ�̼��� NULL�� ������� �̸��� Ŀ�̼� ���
SELECT ENAME AS "�̸�", COMM AS "Ŀ�̼�"
FROM EMP
WHERE COMM IS NULL;

-- 19. ������ SALESMAN, ANALYST, MANAGER�� ������� �̸�, ����,���� ��� => (OR, IN ��� �ΰ�����������)
--OR ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����"
FROM EMP
WHERE JOB = 'SALESMAN' OR JOB = 'ANALYST' OR JOB= 'MANAGER';

--IN ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����"
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 20. ������ SALESMAN�̰� ������ 1200 �̻��� ������� �̸�, ����, ���� ���
SELECT ENAME AS "�̸�", SAL AS "����", JOB AS "����"
FROM EMP
WHERE JOB = 'SALESMAN' AND SAL >=1200;

-- 21. ������̺��� �̸� ��½� ù��° �÷��� �̸��� �빮�ڷ� ����ϰ�, �ι�° �÷��� �̸��� �ҹ��ڷ� ����ϰ�, ����° �÷��� �̸��� ù ��° ö�ڴ� �빮�ڷ� �ϰ� �������� �ҹ��ڷ� ���

SELECT UPPER(ENAME) AS "�빮��" , LOWER(ENAME) AS "�ҹ���", INITCAP(ENAME) AS "��ҹ���"
FROM EMP;

--22. �̸��� soctt �� ����� �̸��� ������ ��ȸ�ϴ� ���� => where���� scott ���ڸ� �ҹ��ڷ� �ۼ��� ��! 1�� ���;���
SELECT LOWER(ENAME)AS "�̸�", SAL AS "����"
FROM EMP
WHERE LOWER(ENAME) = 'scott';

-- 23. ����ܾ� SMITH���� SMI�� �߶� ����
SELECT SUBSTR('SMITH',1,3)
FROM DUAL;

-- 24. ������� �̸��� �̸��� ö�ڰ����� ���
SELECT ENAME AS"�̸�" , LENGTH(ENAME) AS "�̸��� ö�ڰ���"
FROM EMP;

-- 25. �����ٶ� �� ���ڼ� ���
SELECT LENGTH('�����ٶ�')
FROM DUAL;

-- 26. �����ٶ��� ����Ʈ �� ���
SELECT LENGTHB('�����ٶ�')
FROM DUAL;

-- 27. ����̸� SMITH���� ���ĺ� ö�� M�� ���° �ڸ��� �ִ��� ���
SELECT INSTR('SMITH','M')
FROM DUAL;

-- 28. abcdefg@naver.com �̸��Ͽ��� naver.com�� ��� (INSTR , SUBSTR �ΰ��� ����)
--SUBSTR ���
SELECT SUBSTR('abcdefg@naver.com',9)
FROM DUAL;

--INSTR ���
SELECT SUBSTR('abcdefg@naver.com',INSTR('abcdefg@naver.com','n',1,1))
FROM DUAL;

--*INSRT�� ������� ����

-- 29. �̸��� ������ ����ϴµ�, ������ ����� �� ���� 0�� *(��ǥ)�� ��� (KING, 5***) 
SELECT ENAME AS"�̸�", REPLACE(SAL,0,'*') AS "����"
FROM EMP;

-- 30. TEST_ENAME �̶�� ���̺� ���� (�÷� 1�� : ENAME VARCHAR2(10) )
CREATE TABLE TEST_ENAME(
    ENAME VARCHAR2(10)
    );

-- 31. TEST_ENAME �̶�� ���̺� 3���� ���õ����� �ֱ� (��ÿ�, ������, ������)
INSERT INTO TEST_ENAME VALUES('��ÿ�');
INSERT INTO TEST_ENAME VALUES('������');
INSERT INTO TEST_ENAME VALUES('������');

-- 32. COMMIT; ����
COMMIT;

SELECT * FROM TEST_ENAME;
-- 33. �̸��� �ι�° �ڸ��� �ѱ��� *�� ��� (��*��, ��*��, ��*��)
SELECT REPLACE(ENAME,SUBSTR(ENAME,2,1),'*') AS "�̸��� �ι�° ����*"
FROM TEST_ENAME;

-- 34. �̸��� ������ ����ϴµ� �����÷��� �ڸ����� 10�ڸ��� �Ͽ� ���� ����ϰ�, �����ڸ��� *�� ä���� ���
SELECT ENAME, RPAD(SAL,10,'*')
FROM EMP;

-- 35. ù��° �÷��� smith ö�ڸ� ����ϰ�, �ι�° �÷��� ����ܾ� smith���� s�� �߶� ����ϰ�, ����° �÷��� smith���� h�߶� ����ϰ�
--     �׹�° �÷��� ����ܾ� smiths�� ���� s�� �����Ͽ� ��� ( smith, mith, smit, mith ) =>  ����� �Լ� Ȱ��
SELECT 'smith',LTRIM('smith','s') ,RTRIM('smith','h'),TRIM(BOTH 's' FROM 'smiths')
FROM DUAL;

-- 36. �̸��� JACK�� ����� �̸��� ������ ��ȸ = >�ȳ���.. �־ȳ��ñ�? ���������� => ������ ��� 
SELECT ENAME AS "�̸�", SAL AS "����"
FROM EMP
WHERE ENAME = 'JACK ';

-- 37. 876.567 ���� ��½� �Ҽ��� �� ��° �ڸ��� 6���� �ݿø��ؼ� ���
SELECT ROUND('876.567',1)
FROM DUAL;

-- 38. 876.567 ���� ��½� �Ҽ��� �� ��° �ڸ��� 6�� �� ������ ���ڵ��� ��� ������ ���
SELECT TRUNC('876.567',1)
FROM DUAL;

-- 39. ���� 10�� 3���� ���� �������� ���ϱ�
SELECT MOD(10,3)
FROM DUAL;

-- 40. �̸��� ����ϰ� �Ի��� ��¥���� ���ñ��� �� ����� �ٹ��ߴ��� ���
SELECT ENAME AS "�̸�" ,FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))AS "�ٹ��� ������"
FROM EMP;

-- 50. 2023�� 6�� 30�Ϸκ��� 100�� ���� ��¥�� ��� �Ǵ��� ���
SELECT ADD_MONTHS(TO_DATE('2023-06-30','YYYY-MM-DD'),100)
FROM DUAL;

-- 51. 2023�� 1�� 1�� ���� �ٷ� ���ƿ� �������� ��¥�� ��� �Ǵ��� ���
SELECT NEXT_DAY(TO_DATE('2023-01-01','YYYY-MM-DD'),'������')
FROM DUAL;

-- 52. ���ú��� ������ ���ƿ� ȭ������ ��¥�� ���
SELECT NEXT_DAY(SYSDATE,'ȭ����')
FROM DUAL;

-- 53. ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥�� ���
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE,100),'������')
FROM DUAL;

-- 54. 1990�� 5�� 22�� �ش� ���� ������ ��¥�� ��� �Ǵ��� ���
SELECT LAST_DAY(TO_DATE('1990-05-22','YYYY-MM-DD'))
FROM DUAL;

-- 55. ���ú��� �̹��� ���ϱ��� �� ��ĥ ���Ҵ��� ���
SELECT LAST_DAY(SYSDATE) - SYSDATE 
FROM DUAL;

-- 56. �̸��� KING�� ����� �̸�, �Ի���, �Ի��� ���� ������ ��¥ ���
SELECT ENAME AS "�̸�",HIREDATE AS "�Ի���" ,LAST_DAY(TO_DATE(HIREDATE,'YY-MM-DD')) AS "�Ի� ���� ������ ��¥"
FROM EMP
WHERE ENAME = 'KING';

-- 57. �̸��� SCOTT�� ����� �̸��� �Ի��� ������ ����ϰ� SCOTT�� ���޿� õ ������ ������ �� �ִ� �޸�(,) �ٿ��� ���
SELECT ENAME AS "�̸�", TO_CHAR(TO_DATE(HIREDATE,'YY-MM-DD'),'DAY') AS "�Ի��� ����",TO_CHAR(SAL,'999,999,999') AS"����"
FROM EMP
WHERE ENAME = 'SCOTT';

-- 58. 1981�⵵�� �Ի��� ����� �̸��� �Ի��� ��� => TO_CHAR �̿��Ͽ�
SELECT ENAME AS "�̸�",TO_CHAR(HIREDATE,'YYYY-MM-DD') AS"�Ի���"
FROM EMP
WHERE SUBSTR(TO_CHAR(HIREDATE,'YYYY-MM-DD'),1,4) = 1981;

-- 59. ��ü����� �̸���, �Ի翬��, �Ի��, �Ի���� ���
SELECT ENAME AS "�̸�", SUBSTR(TO_CHAR(HIREDATE,'YYYY-MM-DD'),1,4) AS "�Ի翬��",
        SUBSTR(TO_CHAR(HIREDATE,'YYYY-MM-DD'),6,2) AS "�Ի��",
        SUBSTR(TO_CHAR(HIREDATE,'YYYY-MM-DD'),9,2) AS "�Ի���",
        TO_CHAR(TO_DATE(HIREDATE,'YYYY-MM-DD'),'DAY') AS "�Ի����"
FROM EMP;

--EXTRACT���
SELECT ENAME AS "�̸�",EXTRACT(YEAR FROM HIREDATE) AS "�Ի翬��",
                        EXTRACT(MONTH FROM HIREDATE) AS "�Ի��",
                        EXTRACT(DAY FROM HIREDATE) AS "�Ի���",
                        TO_CHAR(TO_DATE(HIREDATE,'YYYY-MM-DD'),'DAY') AS "�Ի����"
FROM EMP;

-- 60. ��ü����� �̸���, ����*200 ��� => �޸���
SELECT ENAME AS "�̸�", TO_CHAR(SAL*200,'999,999,999,999') AS "���� *200"
FROM EMP;

-- 61. ���� �������ٰ� ��ȭ�ٿ��� ���
SELECT ENAME AS "�̸�", TO_CHAR(SAL*200,'L999,999,999,999') AS "���� *200"
FROM EMP;

-- 62. �̸��� Ŀ�̼� ���. Ŀ�̼� NULL�� ��� 0���� ���
SELECT ENAME AS"�̸�", NVL(COMM,0) AS "Ŀ�̼�"
FROM EMP;

-- 63. �����ȣ�� �����ȣ�� ¦������ Ȧ������ ��� (7839, Ȧ��)
SELECT EMPNO AS "��� ��ȣ", DECODE(MOD(EMPNO,2),0,'¦��',1,'Ȧ��') AS "Ȧ/¦"
FROM EMP;

-- 64. ����� �̸��� ������ ���ʽ��� ���. ������ SALESMAN�̸� ���ʽ��� 5000�̶�� ����ϰ� �� �ܴ� 2000�̶�� ��� 
SELECT ENAME AS "�̸�",JOB AS "����",
    CASE WHEN JOB = 'SALESMAN' THEN '5000'
        ELSE '2000'
    END AS "���ʽ�"
FROM EMP;

-- 65. �̸�, ����,����, ���ʽ� ���. ���ʽ��� ������ 3000�̻��̸� 500. 2000�̻�~3000 ���� ������ 300. ������ 1000�̻�~2000 ���� ������ 200 �������� 0 => CASE WHEN THEN ����
SELECT ENAME AS "�̸�", JOB AS "����",SAL AS"����",
    CASE WHEN SAL >='3000' THEN '500'
         WHEN SAL BETWEEN '2000' AND '3000' THEN '300'
         WHEN SAL BETWEEN '1000' AND '2000' THEN '200'
         ELSE '0'
    END AS "���ʽ�"
FROM EMP;

-- 66. ������ SALESMAN�� ����� �� �ִ���� ���
--SALESMAN�� ����
SELECT JOB, SAL
FROM EMP
WHERE JOB = 'SALESMAN';

--�ִ���޸� ����
SELECT MAX(SAL) AS "�ִ� ����"
FROM EMP
WHERE JOB = 'SALESMAN';

-- 67. �� �μ��� �ִ� �޿� ���
SELECT * FROM EMP;          --DEPTNO
SELECT * FROM DEPT;         --DEPTNO

--JOIN
SELECT DNAME AS "�μ��̸�", MAX(SAL) AS "���� �ִ�"
FROM EMP 
JOIN DEPT USING(DEPTNO)
GROUP BY DNAME;

--����Ŭ
SELECT DNAME AS "�μ��̸�", MAX(SAL) AS "���� �ִ�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

-- 68. ����, ������ �ּ� ���� ���. ��, SALESMAN�� �����ϰ�, ������ �ּҿ����� ������ ���� ���
SELECT * FROM EMP; 

SELECT JOB AS "����", MIN(SAL) AS "�ּҿ���"
FROM EMP
WHERE JOB != 'SALESMAN'
GROUP BY JOB
ORDER BY MIN(SAL) DESC;

-- 69. ������ ������ ������ ������ ���. ��, SALESMAN�� �����ϰ�,  �ѿ����� 4000 �̻��� ������ ���
SELECT JOB,SAL
FROM EMP;

SELECT JOB AS "����", SUM(SAL) AS"���� ����"
FROM EMP
WHERE JOB != 'SALESMAN'
--AND SUM(SAL)>= 4000
GROUP BY JOB;

-- 70. ������ ANALYST, MANAGER �� ������� �̸�, ����, ����, ������ ���� ��� (1���� 2���Ͻ� ������ �ٷ� 3��)
SELECT * FROM EMP;

SELECT ENAME AS"�̸�" ,JOB AS"����", SAL AS"����" , RANK() OVER (ORDER BY SAL DESC) AS"���� ����"
FROM EMP
WHERE JOB = 'ANALYST' OR JOB = 'MANAGER';

-- 71. ������ ANALYST, MANAGER �� ������� �̸�, ����, ����, ������ ���� ��� (1���� 2���Ͻ� ������ �ٷ� 2��)
SELECT ENAME AS"�̸�" ,JOB AS"����", SAL AS"����" , DENSE_RANK() OVER (ORDER BY SAL DESC) AS"���� ����"
FROM EMP
WHERE JOB = 'ANALYST' OR JOB = 'MANAGER';

-- 72. ������̺��� �����ȣ, �̸�, ����, ������ ���. ��, ���޳��� ���� 5���� �ุ ���
SELECT EMPNO AS "�����ȣ", ENAME AS "�̸�", JOB AS"����",SAL AS"����"
FROM EMP
ORDER BY SAL DESC;

--ROWNUM
SELECT EMPNO AS "�����ȣ", ENAME AS "�̸�", JOB AS"����",SAL AS"����"
FROM (SELECT EMPNO, ENAME, JOB,SAL
        FROM EMP
        ORDER BY SAL DESC)
WHERE ROWNUM <= 5;

-- 73. ������̺�� �޿����̺��� �����Ͽ� �����, �޿�, �޿���� ��� (ANSI, ORACLE)
SELECT * FROM EMP;   --SAL
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;     --LOSAL  --HISAL

--����Ŭ
SELECT ENAME AS"�����", SAL AS"�޿�", GRADE AS"�޿����"
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

--ANSI
SELECT ENAME AS"�����", SAL AS"�޿�", GRADE AS"�޿����"
FROM EMP
JOIN SALGRADE ON(SAL BETWEEN LOSAL AND HISAL);

-- 74. ������̺�� �μ����̺��� �����Ͽ� �̸��� �μ���ġ ���(��, BOSTON �� ���� ��µǰ� �غ� ��)(ANSI, ORACLE)
SELECT * FROM EMP;          --DEPTNO
SELECT * FROM DEPT;         --DEPTNO

--����Ŭ
SELECT ENAME AS"�̸�",LOC AS"�μ���ġ"
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

--ANSI
SELECT ENAME AS"�̸�",LOC AS"�μ���ġ"
FROM EMP
RIGHT JOIN DEPT USING(DEPTNO);

-- *75. ��� ���̺��� �������� �Ͽ� �̸�, ����, �ش����� ������ �̸��� �������� ���� ���(ANSI, ORACLE)
SELECT * FROM EMP;  -- EMPNO ��� , MGR �����ڻ��

--����Ŭ
SELECT E.ENAME AS "�̸�", E.JOB AS "����",E.EMPNO AS"���" ,M.ENAME AS "������ �̸�", M.JOB AS"������ ����", M.EMPNO AS"������ ���"
FROM EMP E, EMP M
WHERE E.EMPNO = M.MGR(+);

--ANSI
SELECT E.ENAME AS "�̸�", E.JOB AS "����",E.EMPNO AS"���" ,M.ENAME AS "������ �̸�", M.JOB AS"������ ����", M.EMPNO AS"������ ���"
FROM EMP E
RIGHT JOIN EMP M ON(E.EMPNO = M.MGR);

-- 76. ������̺�� �μ����̺� �����Ͽ� �̸�, ����,����,�μ���ġ ��� (��, ����� JACK�� �����Ϳ� �μ���ġ BOSTON�� ������ �Ѵ� ���;���)
SELECT * FROM EMP;              --DEPTNO
SELECT * FROM DEPT;             --DEPTNO

SELECT ENAME AS "�̸�", JOB AS"����", SAL AS "����", LOC AS "�μ� ��ġ"
FROM EMP
FULL JOIN DEPT USING(DEPTNO);

