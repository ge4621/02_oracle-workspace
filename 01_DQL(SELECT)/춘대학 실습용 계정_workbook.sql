--계정명 : workbook
--비밀번호 : workbook
--이름 : 춘대학 실습용 계정_workbook

SELECT * FROM DBA_USERS;
CREATE USER workbook IDENTIFIED BY workbook;
GRANT RESOURCE, CONNECT TO workbook;
