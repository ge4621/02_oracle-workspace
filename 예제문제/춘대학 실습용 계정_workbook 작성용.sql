--1번 문제
SELECT DEPARTMENT_NAME AS"학과 명" ,CATEGORY AS"계열"
FROM TB_DEPARTMENT;

--2번 문제
SELECT DEPARTMENT_NAME||'의 정원은 '|| CAPACITY || '명 입니다.' AS"학과별 정원"
FROM TB_DEPARTMENT;

--3번 문제
SELECT STUDENT_NAME 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'AND SUBSTR(STUDENT_SSN,8,1)=2 AND DEPARTMENT_NO =001;

--4번 문제
SELECT STUDENT_NAME
FROM  TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;

--5번
SELECT DEPARTMENT_NAME,CATEGORY 
FROM TB_DEPARTMENT
WHERE CAPACITY >=20 AND CAPACITY <=30;

--6번
SELECT PROFESSOR_NAME 
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

--7번 
SELECT DEPARTMENT_NO ,STUDENT_NAME 
FROM  TB_STUDENT
WHERE  DEPARTMENT_NO IS NULL;

--8번
SELECT CLASS_NO 
FROM TB_CLASS
WHERE  PREATTENDING_CLASS_NO IS NOT NULL;

--9번
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY CATEGORY;

--10번
SELECT STUDENT_NO,STUDENT_NAME,STUDENT_SSN 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N' AND SUBSTR(STUDENT_NO,1,2) = 'A2' AND STUDENT_ADDRESS LIKE '%전주%';

--함수

--1번 
SELECT STUDENT_NO AS"학번" ,STUDENT_NAME AS"이름", ENTRANCE_DATE AS"입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

--2번 
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME)!='3'; 

--3번
SELECT PROFESSOR_NAME AS "교수이름",
FLOOR(MONTHS_BETWEEN(SYSDATE,TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6)))/12) AS"나이"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN,8,1)='1'
ORDER BY PROFESSOR_SSN DESC;


--4번
SELECT SUBSTR(PROFESSOR_NAME,2,2) AS "이름"
FROM TB_PROFESSOR;

--5번
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,2,1)=SUBSTR(STUDENT_SSN,2,1);

--6번
SELECT TO_CHAR(TO_DATE('20201225','YYMMDD'),'DAY')
FROM DUAL;

--7번 *
SELECT TO_DATE('99/10/11','YY/MM/DD')
FROM DUAL; --20991011의미

SELECT TO_DATE('49/10/11','YY/MM/DD') 
FROM DUAL;-- 20491011의미

SELECT TO_DATE('99/10/11','RR/MM/DD')
FROM DUAL;--19991011의미

SELECT TO_DATE('49/10/11','RR/MM/DD')
FROM DUAL;--20491011의미

--8번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,1,1) != 'A';

--9번 
SELECT ROUND(AVG(POINT),1) AS"평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178' ;

--10번 
SELECT DEPARTMENT_NO AS "학과 번호", COUNT(*) AS"학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

--11번
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS  NULL;


--12번
SELECT SUBSTR(TERM_NO,1,4)AS"년도", ROUND(AVG(POINT),1)AS"년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

--13번 
SELECT DEPARTMENT_NO AS "학과 번호",NVL(SUM(DECODE(ABSENCE_YN,'Y',1)),0)AS"휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;


--14번
SELECT STUDENT_NAME AS "동일이름", COUNT(STUDENT_NAME) AS"동명인수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) >=2;

--15번(년도 별 누적 평점, 총평점) --*ROLLUP함수 사용
SELECT SUBSTR(TERM_NO,1,4)AS"년도",SUBSTR(TERM_NO,5,2)AS"학기",POINT
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113' 
GROUP BY TERM_NO, ROLLUP(SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO,5,2),POINT);

--강사님 코드
SELECT NVL(SUBSTR(TERM_NO,1,4),' ') AS "년도", NVL(SUBSTR(TERM_NO,5,2),' ') AS "학기", ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4), SUBSTR(TERM_NO,5,2));

--OPTION
--1번
SELECT STUDENT_NAME AS"학생 이름",STUDENT_ADDRESS AS"주소지"
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

--2번
SELECT STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

--3번
SELECT STUDENT_NAME AS "학생이름",STUDENT_NO AS "학번",STUDENT_ADDRESS AS"거주지 주소"
FROM TB_STUDENT
WHERE (SUBSTR(STUDENT_ADDRESS,1,2)='강원' OR SUBSTR(STUDENT_ADDRESS,1,2)='경기')AND SUBSTR(STUDENT_NO,1,1)='9'
ORDER BY STUDENT_NAME;

--4번
SELECT PROFESSOR_NAME ,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO=005
ORDER BY PROFESSOR_SSN;

--5번
SELECT STUDENT_NO,TO_CHAR(POINT,'9.99') AS "POINT"
FROM TB_GRADE
WHERE SUBSTR(TERM_NO,1,4)=2004 AND SUBSTR(TERM_NO,5,2)=02 AND CLASS_NO='C3118100'
ORDER BY POINT DESC;

--6번 
SELECT STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
FROM TB_STUDENT S,TB_DEPARTMENT D
WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO; 

--7번 (해결)
SELECT CLASS_NAME,DEPARTMENT_NAME
FROM TB_CLASS C,TB_DEPARTMENT D
WHERE C.DEPARTMENT_NO = D.DEPARTMENT_NO;

--8번 (행수는 나온다.) 
SELECT C.CLASS_NAME,P.PROFESSOR_NAME
FROM TB_CLASS C,TB_CLASS_PROFESSOR CP,TB_PROFESSOR P
WHERE CP.PROFESSOR_NO = P.PROFESSOR_NO
AND C.CLASS_NO = CP.CLASS_NO
ORDER BY PROFESSOR_NAME;


SELECT *
FROM TB_CLASS;         --DEPARTMENT_NO           --CLASS_NO
--WHERE CLASS_NAME = '발레워크샵';

SELECT *
FROM TB_PROFESSOR;      --DEPARTMENT_NO                             --PROFESSOR_NO
--WHERE PROFESSOR_NAME ='강용진';

SELECT *
FROM TB_CLASS_PROFESSOR;                         --CLASS_NO           --PROFESSOR_NO

--9번
SELECT * FROM TB_CLASS; --CLASS_NO

SELECT * FROM TB_CLASS_PROFESSOR; --CLASS_NO        --PROPESSOR_NO

SELECT * FROM TB_PROFESSOR;                         --PROPESSOR_NO      --DEPARTMENY_NO

SELECT *FROM TB_DEPARTMENT; --CATEGORY :계열                              --DEPARTMENT_NO

SELECT *FROM TB_STUDENT;


SELECT C.CLASS_NAME,P.PROFESSOR_NAME
FROM TB_CLASS C,TB_CLASS_PROFESSOR CP,TB_PROFESSOR P, TB_DEPARTMENT D
WHERE CP.PROFESSOR_NO = P.PROFESSOR_NO
AND C.CLASS_NO = CP.CLASS_NO
AND C.DEPARTMENT_NO = D.DEPARTMENT_NO
AND CATEGORY = '인문사회'
ORDER BY PROFESSOR_NAME;

SELECT CATEGORY
FROM TB_DEPARTMENT
WHERE CATEGORY = '인문사회';


--10번(???) *
SELECT STUDENT_NO, STUDENT_NAME, ROUND(AVG(POINT),1)
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_GRADE USING(STUDENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY STUDENT_NO, STUDENT_NAME;


SELECT *
FROM TB_STUDENT;            --STUDENT_NO        --DEPARTMENT_NO

SELECT *
FROM TB_GRADE;              --STUDENT_NO

SELECT *
FROM TB_DEPARTMENT;                             --DEPARTMENT_NO

--WHERE DEPARTMENT_NAME = '음악학과';

--음악학과 => 059



SELECT DEPARTMENT_NO,DEPARTMENT_NAME
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '음악학과'; --059


SELECT DEPARTMENT_NO
FROM TB_STUDENT;  --STUDENT_NO

SELECT *
FROM TB_GRADE;  --STUDENT_NO


--11번
SELECT D.DEPARTMENT_NAME AS "학과이름" ,S.STUDENT_NAME AS"학생이름",PROFESSOR_NAME AS "지도교수" 
FROM TB_DEPARTMENT D,TB_STUDENT S,TB_PROFESSOR P
WHERE D.DEPARTMENT_NO = S.DEPARTMENT_NO
AND S.COACH_PROFESSOR_NO   = P.PROFESSOR_NO
AND S.STUDENT_NO = 'A313047';

SELECT * FROM TB_DEPARTMENT;        --DEPARTMENT_NO
SELECT * FROM TB_STUDENT;           --DEPARTMENT_NO      --STUDENT_NO       --COACH_PROFESSOR_NO
SELECT * FROM TB_GRADE;                                 --STUDENT_NO
SELECT * FROM TB_PROFESSOR;                                                 --PROFESSOR_NO
--지도교수 COACH_PROFESSOR_NO => TB_STUDENT
--학번 STUDENT_NO => A313047

--12번 (해결)

SELECT S.STUDENT_NAME,G.TERM_NO
FROM TB_STUDENT S,TB_GRADE G,TB_CLASS C
WHERE S.STUDENT_NO = G.STUDENT_NO 
AND G.CLASS_NO = C.CLASS_NO
AND SUBSTR(TERM_NO,1,4) = '2007'
AND CLASS_NAME = '인간관계론'
ORDER BY STUDENT_NAME;



SELECT * FROM TB_STUDENT;       --STUDENT_NO
SELECT * FROM TB_GRADE;         --STUDENT_NO        --CLASS_NO
SELECT * FROM TB_CLASS;                             --CLASS_NO
SELECT * FROM TB_DEPARTMENT;


--13번 *
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS C, TB_CLASS_PROFESSOR C1,TB_DEPARTMENT D
WHERE C.CLASS_NO = C1.CLASS_NO(+)
AND C.DEPARTMENT_NO = D.DEPARTMENT_NO
AND PROFESSOR_NO IS NULL
AND CATEGORY = '예체능';

SELECT * FROM TB_CLASS;                 --DEPARTMENT_NO
SELECT * FROM TB_DEPARTMENT;            --DEPARTMENT_NO
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_PROFESSOR;

SELECT * 
FROM TB_DEPARTMENT
WHERE CATEGORY = '예체능';



--14번
SELECT * 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '서반아어학과';

SELECT * FROM TB_STUDENT;       --COACH_PROFESSOR_NO --DEPARTMENT_NO
SELECT * FROM TB_PROFESSOR;     --PROFESSOR_NO
SELECT * FROM TB_DEPARTMENT;    --DEPARTMENT_NO

SELECT STUDENT_NAME AS "학생이름" ,NVL(PROFESSOR_NAME,'지도교수 미지정') AS "지도교수" 
FROM TB_STUDENT S,TB_DEPARTMENT D,TB_PROFESSOR P
WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO(+)
AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
AND DEPARTMENT_NAME = '서반아어학과'
ORDER BY STUDENT_NO;


--15번
SELECT * FROM TB_GRADE;     --STUDENT_NO
SELECT * FROM TB_STUDENT;   --STUDENT_NO        --DEPARTMENT_NO
SELECT * FROM TB_DEPARTMENT;                    --DEPARTMENT_NO
    
SELECT S.STUDENT_NO AS "학번",S. STUDENT_NAME AS"이름" ,D. DEPARTMENT_NAME AS"학과이름" ,AVG(G.POINT) AS"평점"
FROM TB_STUDENT S,TB_DEPARTMENT D,TB_GRADE G
WHERE S.STUDENT_NO = G.STUDENT_NO
AND S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND ABSENCE_YN = 'N'
GROUP BY S.STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
HAVING AVG(G.POINT)>=4.0 
ORDER BY 1;

--16번 *
SELECT * FROM TB_CLASS;     --CLASS_NO      --DEPARTMENT_NO
SELECT * FROM TB_GRADE;     --CLASS_NO
SELECT * FROM TB_DEPARTMENT;                --DEPARTMENT_NO

SELECT C.CLASS_NO, C.CLASS_NAME,AVG(G.POINT)
FROM TB_CLASS C,TB_GRADE G,TB_DEPARTMENT D
WHERE C.CLASS_NO = G.CLASS_NO
AND C.DEPARTMENT_NO = D.DEPARTMENT_NO
AND DEPARTMENT_NAME = '환경조경학과'
AND CLASS_TYPE LIKE '전공%'
GROUP BY C.CLASS_NO, C.CLASS_NAME ;

--17번(해결)
--T => 최경희
--S => 같은 과

SELECT T.STUDENT_NAME, S.STUDENT_ADDRESS
FROM TB_STUDENT T, TB_STUDENT S, TB_DEPARTMENT D
WHERE T.DEPARTMENT_NO = S.DEPARTMENT_NO
AND S.DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                        FROM TB_STUDENT
                        WHERE STUDENT_NAME = '최경희')
AND D.DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                        FROM TB_DEPARTMENT
                        WHERE DEPARTMENT_NO = '038')
AND T.STUDENT_NAME = S.STUDENT_NAME;

--강사님 코드
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO =(SELECT DEPARTMENT_NO FROM TB_STUDENT
WHERE STUDENT_NAME = '최경희');

SELECT *
FROM TB_STUDENT
WHERE STUDENT_NAME = '최경희';  --038


SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '038';

SELECT * 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NO = '038';

--18번

SELECT STUDENT_NO ,STUDENT_NAME
FROM (SELECT S.STUDENT_NO ,S.STUDENT_NAME,AVG(POINT)
        FROM TB_STUDENT S,TB_DEPARTMENT D,TB_GRADE G
        WHERE D.DEPARTMENT_NO = S.DEPARTMENT_NO
        AND S.STUDENT_NO = G.STUDENT_NO
        AND DEPARTMENT_NAME = '국어국문학과'
        GROUP BY S.STUDENT_NO,S.STUDENT_NAME
        ORDER BY AVG(POINT)DESC)
WHERE ROWNUM <=1;


SELECT * 
FROM TB_DEPARTMENT;         --DEPARTMENT_NO

SELECT *
FROM TB_STUDENT;            --DEPARTMENT_NO             --STUDENT_NO

SELECT * 
FROM TB_GRADE;                                           --STUDENT_NO

SELECT DEPARTMENT_NAME
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '국어국문학과';


--19번
SELECT * 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '환경조경학과';

SELECT * FROM TB_DEPARTMENT;        --DEPARTMENT_NO
SELECT * FROM TB_CLASS;             --DEPARTMENT_NO     --CLASS_NO
SELECT * FROM TB_GRADE;                                 --CLASS_NO


SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT
WHERE CATEGORY = '자연과학';


SELECT D.DEPARTMENT_NAME AS "계열학과명",ROUND(AVG(POINT),1)AS"전공평점"
FROM TB_DEPARTMENT D,TB_CLASS C,TB_GRADE G
WHERE D.DEPARTMENT_NO = C.DEPARTMENT_NO
AND C.CLASS_NO = G.CLASS_NO
AND CATEGORY = '자연과학'
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;


--DDL
--1.
CREATE TABLE TB_CATEGORY(
        NAME VARCHAR2(10),
        USE_YN CHAR(1) DEFAULT 'Y'
    );

--2.
CREATE TABLE TB_CLASS_TYPE(
        NO VARCHAR2(5) PRIMARY KEY,
        NAME VARCHAR2(10) 
    );

--3. TB_CATAGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오.
--(KEY 이름을 생성하지 않아도 무방함. 맊일 KEY 이를 지정하고자 핚다면 이름은 본인이
--알아서 적당한 이름을 사용핚다.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY (NAME);

--4.TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

--5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10 으로, 컬럼명이
--NAME 인 것은 마찪가지로 기존 타입을 유지하면서 크기 20 으로 변경하시오.
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(20);

--6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각 각 TB_ 를 제외핚 테이블 이름이 앞에 붙은 형태로 변경핚다.(ex. CATEGORY_NAME)
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE  RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;

--7. TB_CATAGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이 변경하시오.
--Primary Key 의 이름은 ?PK_ + 컬럼이름?으로 지정하시오. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C007198 TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C007199 TO PK_CLASS_TYPE_NO;

--8. 다음과 같은 INSERT 문을 수행핚다.
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT; 

SELECT * FROM TB_CATEGORY;

--9.TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모
--값으로 참조하도록 FOREIGN KEY 를 지정하시오. 이 때 KEY 이름은
--FK_테이블이름_컬럼이름으로 지정핚다. (ex. FK_DEPARTMENT_CATEGORY )

--테이블 명 : TB_DEPARTMENT  컬럼 : CATEGORY  => 자식
--테이블 명 : TB_CATEGORY    컬럼 : CATEGORY_NAME => 부모

ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY(CATEGORY) REFERENCES  TB_CATEGORY (CATEGORY_NAME) ;

GRANT CREATE VIEW TO workbook; --관리자계정에서 실행
--10. 춘 기술대학교 학생들의 정보맊이 포함되어 있는 학생일반정보 VIEW 를 맊들고자 핚다. 아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오.
SELECT STUDENT_NO, STUDENT_NAME,STUDENT_ADDRESS
FROM TB_STUDENT;

CREATE VIEW VW_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT;
    
SELECT * FROM VW_학생일반정보;

--11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행핚다. 이를 위해 사용핛 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 맊드시오.
--이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT 
--맊을 핛 경우 학과별로 정렬되어 화면에 보여지게 맊드시오.)
SELECT * FROM TB_STUDENT; --STUDENT_NO              --DEPARTMENT_NO     --COACH_PROFESSOR_NO
SELECT * FROM TB_DEPARTMENT; --DEPARTMENT_NAME      --DEPARTMENT_NO
SELECT * FROM TB_PROFESSOR; --PROFESSOR_NAME                            --PROFESSOR_NO

SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO);

CREATE VIEW VW_지도면담
AS SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
ORDER BY 2;

SELECT * FROM VW_지도면담;

--12. 모든 학과의 학과별 학생 수를 확인핛 수 있도록 적젃핚 VIEW 를 작성해 보자.
SELECT * FROM TB_DEPARTMENT;--DEPARTMENT_NO
SELECT * FROM TB_STUDENT;--DEPARTMENT_NO

SELECT DEPARTMENT_NAME,COUNT(STUDENT_NO) AS "학생 수"
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING(DEPARTMENT_NO)
GROUP BY DEPARTMENT_NAME;

CREATE VIEW VW_학과별학생수
AS SELECT DEPARTMENT_NAME,COUNT(STUDENT_NO)AS "학생 수"
    FROM TB_DEPARTMENT
    JOIN TB_STUDENT USING(DEPARTMENT_NO)
    GROUP BY DEPARTMENT_NAME;

SELECT * FROM VW_학과별학생수;

--13. 위에서 생성핚 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인
--이름으로 변경하는 SQL 문을 작성하시오.
UPDATE VW_학생일반정보
    SET STUDENT_NAME = '윤지영'
    WHERE STUDENT_NO = 'A213046';
    
SELECT * FROM VW_학생일반정보;
--14. 13 번에서와 같이 VIEW 를 통해서 데이터가 변경될 수 있는 상황을 막으려면 VIEW 를
--어떻게 생성해야 하는지 작성하시오.
--WITH READ ONLY를 사용하여 읽기 전용으로 만든다.

--10번
CREATE VIEW VW_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT
WITH READ ONLY;

--11번
CREATE VIEW VW_지도면담
AS SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
ORDER BY 2
WITH READ ONLY;

--12번
CREATE VIEW VW_학과별학생수
AS SELECT DEPARTMENT_NAME,COUNT(STUDENT_NO)AS "학생 수"
    FROM TB_DEPARTMENT
    JOIN TB_STUDENT USING(DEPARTMENT_NO)
    GROUP BY DEPARTMENT_NAME
WITH READ ONLY;


--15. 춘 기술대학교는 매년 수강신청 기갂맊 되면 특정 인기 과목들에 수강 신청이 몰려
--문제가 되고 있다. 최근 3 년을 기준으로 수강인원이 가장 맋았던 3 과목을 찾는 구문을
--작성해보시오. 원예작물번식 => 2005년 부터 2009년까지

SELECT * FROM TB_CLASS;                         --CLASS_NO
SELECT * FROM TB_STUDENT;    --STUDENT_NO
SELECT * FROM TB_GRADE;      --STUDENT_NO       --CLASS_NO                                     

SELECT  과목번호,과목이름,"누적학생수(명)"
FROM(
    SELECT CLASS_NO AS "과목번호", CLASS_NAME AS "과목이름", COUNT(STUDENT_NO) AS "누적학생수(명)"
    FROM TB_CLASS
    JOIN TB_GRADE USING (CLASS_NO)
    JOIN TB_STUDENT USING (STUDENT_NO)
    WHERE TERM_NO BETWEEN '200501' AND '200912'
    GROUP BY CLASS_NO,CLASS_NAME
    ORDER BY 3 DESC
)
WHERE ROWNUM <=3;


--DML
--1.과목유형 테이블(TB_CLASS_TYPE)에 아래와 같은 데이터를 입력하시오.
SELECT * FROM TB_CLASS_TYPE;

INSERT INTO TB_CLASS_TYPE VALUES ('01','전공필수');
INSERT INTO TB_CLASS_TYPE VALUES ('02','전공선택');
INSERT INTO TB_CLASS_TYPE VALUES ('03','교양필수');
INSERT INTO TB_CLASS_TYPE VALUES ('04','교양선택');
INSERT INTO TB_CLASS_TYPE VALUES ('05','논문지도');

--2.춘 기술대학교 학생들의 정보가 포함되어 있는 학생일반정보 테이블을 맊들고자 핚다. 아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (서브쿼리를 이용하시오)
SELECT * FROM TB_STUDENT;

CREATE TABLE TB_학생일반정보 
AS SELECT STUDENT_NO ,STUDENT_NAME , STUDENT_ADDRESS 
FROM TB_STUDENT;

SELECT * FROM TB_학생일반정보;

--3. 국어국문학과 학생들의 정보맊이 포함되어 있는 학과정보 테이블을 맊들고자 핚다. 
--아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (힌트 : 방법은 다양함, 소신껏
--작성하시오)
SELECT * FROM TB_STUDENT;       --DEPARTMENT_NO     --COACH_PROFESSOR_NO
SELECT * FROM TB_DEPARTMENT;    --DEPARTMENT_NO
SELECT * FROM TB_PROFESSOR;                         --PROFESSOR_NO

CREATE TABLE TB_국어국문학과
AS SELECT STUDENT_NO AS "학번" ,STUDENT_NAME AS "학생이름",EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,2),'RRRR')) AS "출생년도",PROFESSOR_NAME AS "교수이름"
    FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON(COACH_PROFESSOR_NO = PROFESSOR_NO)
    WHERE DEPARTMENT_NAME = '국어국문학과';


SELECT * FROM TB_국어국문학과;


--4. 현 학과들의 정원을 10% 증가시키게 되었다. 이에 사용핛 SQL 문을 작성하시오. (단, 
--반올림을 사용하여 소수점 자릿수는 생기지 않도록 핚다)
SELECT * FROM TB_DEPARTMENT;

UPDATE TB_DEPARTMENT
SET CAPACITY = ROUND(CAPACITY*1.1);


--5. 학번 A413042 인 박건우 학생의 주소가 "서울시 종로구 숭인동 181-21 "로 변경되었다고
--핚다. 주소지를 정정하기 위해 사용핛 SQL 문을 작성하시오.
SELECT * FROM TB_STUDENT;

UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
WHERE STUDENT_NO = 'A413042';


--6. 주민등록번호 보호법에 따라 학생정보 테이블에서 주민번호 뒷자리를 저장하지 않기로
--결정하였다. 이 내용을 반영핛 적젃핚 SQL 문장을 작성하시오.
--(예. 830530-2124663 ==> 830530 )
SELECT * FROM TB_STUDENT;  --STUDENT_SSN

UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);


--7. 의학과 김명훈 학생은 2005 년 1 학기에 자신이 수강핚 '피부생리학' 점수가
--잘못되었다는 것을 발견하고는 정정을 요청하였다. 담당 교수의 확인 받은 결과 해당
--과목의 학점을 3.5 로 변경키로 결정되었다. 적젃핚 SQL 문을 작성하시오.
SELECT * FROM TB_STUDENT;--STUDENT_NO
SELECT * FROM TB_GRADE;--STUDENT_NO --CLASS_NO
SELECT * FROM TB_CLASS;             --CLASS_NO
SELECT * FROM TB_DEPARTMENT; --DEPARTMENT_NO

SELECT * 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '의학과';

SELECT * 
FROM TB_STUDENT
WHERE STUDENT_NAME = '김명훈';

SELECT STUDENT_NO
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE STUDENT_NAME = '김명훈'
AND DEPARTMENT_NAME = '의학과';--A331101



UPDATE TB_GRADE
SET POINT = '3.5'
WHERE TERM_NO = '200501'
AND STUDENT_NO = (SELECT STUDENT_NO
                    FROM TB_STUDENT
                    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
                    WHERE STUDENT_NAME = '김명훈'
                    AND DEPARTMENT_NAME = '의학과');
                    
SELECT * FROM TB_GRADE;


--8. 성적 테이블(TB_GRADE) 에서 휴학생들의 성적항목을 제거하시오
SELECT * FROM TB_GRADE;     --STUDENT_NO
SELECT * FROM TB_STUDENT;   --STUDENT_NO

SELECT STUDENT_NAME, POINT
FROM TB_GRADE
JOIN TB_STUDENT USING (STUDENT_NO)
WHERE ABSENCE_YN = 'Y';

DELETE FROM TB_GRADE
WHERE STUDENT_NO IN (SELECT STUDENT_NO
                    FROM TB_STUDENT
                    WHERE ABSENCE_YN = 'Y');



--ROLLBACK;


