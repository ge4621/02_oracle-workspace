--������ : workbook
--��й�ȣ : workbook
--�̸� : ����� �ǽ��� ����_workbook

SELECT * FROM DBA_USERS;
CREATE USER workbook IDENTIFIED BY workbook;
GRANT RESOURCE, CONNECT TO workbook;
