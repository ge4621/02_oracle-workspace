CREATE TABLE TEST(
    TEST_ID NUMBER,
    TEST_NAME VARCHAR2(10)
);

--CREATE TABLE �� �� �ִ� ������ ��� ���� �߻�!
--3_1) CREATE TABLE ���ѹޱ�
--3_2) TABLESPACE �Ҵ� �ޱ�

SELECT * FROM TEST;
INSERT INTO TEST VALUES(10,'�ȳ�');
--CREATE TABLE ���� ������ ���̺�� �ٷ� ���� ����

--------------------------------------------------------------------------------

--KH������ �ִ� EMPLOYEE ���̺� ����
--�ٵ� ��ȸ ������ ����

--4. SELECT ON KH.EMPLOYEE ���� �ο�����
SELECT * FROM KH.EMPLOYEE;

--5. INSERT ON KH.EMPLOYEE ���� �ο�����
INSERT INTO KH.DEPARTMENT
VALUES('DO','ȸ���','L1');

COMMIT;

SELECT * FROM DEPARTMENT;

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'DO';














