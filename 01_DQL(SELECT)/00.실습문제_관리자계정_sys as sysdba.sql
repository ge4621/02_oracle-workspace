--계정명 scott
--비번 tiger
--권한부여

SELECT * FROM DBA_USERS;
CREATE USER SCOTT IDENTIFIED BY TIGER;
GRANT RESOURCE, CONNECT TO SCOTT;