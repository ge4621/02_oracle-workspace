--저장먼저하기
------------------------------------QUIZ 1----------------------
--보너스를 받지 않지만 부서배치는 된 사원 조회
SELECT *
FROM EMPLOYEE
WHERE BONUS = NULL AND DEPT_CODE != NULL;
--NULL 값에 대해 정상적으로 비교처리 되지 않음!

--문제점 : NULL값을 비교할때는 단순한 일반 비교연산자를 통해 비교할 수 없음!
--해결 방법 : IS NULL / IS NOT NULL 연산자 이용해서 비교해야됨!

--조치한 SQL문
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL AND DEPT_CODE IS NOT NULL;

-----------------------------------------------------------------------------
-------------------------------QUIZ 2--------------------------------------------
--검색하고자 하는 내용
--JOB_CODE J7이거나 J6이면서 SALARY값이 200만원 이상이고
--BONUS가 있고 여자이며 이메일 주소는 _앞에 3글자만 있는 사원의
--EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY,BONUS를 조회하려고 한다.
--정상적으로 조회가 잘 된다면 실행결과는 2행이여야 한다.

--위의 내용을 실행시키고자 작성한 SQL문은 아래와 같음
SELECT EMP_NAME,EMP_NO,JOB_CODE, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE
--WHERE JOB_CODE = 'J7' OR JOB_CODE = 'J6' AND SALARY >2000000 AND EMAIL LIKE '___%'AND BONUS IS NULL;

--위의 SQL문 실행시 원하는 결과가 제대로 조회되지 않는다. 이때 어떤 문제점들(5개의 문제점)이 있는지 모두찾아서
--서술해볼것! 그리고 조치된 완벽한 SQL문을 작성해볼것
--SUBSTR(컬럼, 시작인덱스, 개수)

--조치된 쿼리
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000 AND EMAIL LIKE '___$_%' ESCAPE '$' AND BONUS IS NOT NULL AND EMP_NO LIKE '_______2%';
--WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000 AND EMAIL LIKE '___$_%' ESCAPE '$' AND BONUS IS NOT NULL AND SUBSTR(EMO_NO,8,1) IN ('2','4');

--문제점
--보너스가 있는 이라는 조건에 IS NULL이 아닌 IS NOT NULL로 비교해야한다.
--급여값에 대한 비교가 잘못되어 있다. > 이 아닌 >= 으로 비교해야한다.
--OR연산자와 AND연산자가 나열되어 있을 경우 AND연산자 연산이 먼저 수행이 된다. 문제에서 요구한 대로 수행하기 위해서는 OR연산이 먼저 수행되어야 한다.
--여자에 대한 조건이 누락되어 있다.
--이매일애 대한 비교시 네번째 자리에 있는 _를 데이터값으로 취급하기 위해서는 새 와일드 카드를 제시해야하고, 또 ESCAPE로 등록까지 해야 한다.

-------------------------------------QUIZ 3---------------------------------------------
-- [계정생성구문] CREATE USER 계정명 IDENTIFIED BY 비밀번호;
--계정명 : SCOTT, 비밀번호 : TIGER 계정을 생성하고 싶다.
--이때 일반사용자 계정인 KH계정에 접속해서 CREATE USER SOCTT;로 실행하니 문제 발생!

--문제점 1. 사용자 계정 생성은 무조건 관리자 계정에서만 가능!!
--문제점 2. SQL문이 잘못되어있다. 비번까지 입력해야한다,

--조치 내용1. 관리자계정에 접속해야한다.
--조치 내용2. CREATE USER SCOTT IDENTIFIED BY TIGER;

--위의 SQL(CREATE)문만 실행후 접속을 만들어 접속을 하려고 했더니 실패!
--뿐만 아니라 해당 계정에 테이블 생성 같은 것도 되지 않음!왜 그럴까?

--문제점 1. 사용자 계정 생성후 최소한의 권한 부여!!

--조치 내용. GRANT CONNECT, RESOURCE TO SCOTT; 구문 실행해서 권한 부여










