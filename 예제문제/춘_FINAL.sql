--1. 4�� ���̺� ���Ե� ������ �� ���� ���ϴ� SQL ������ ����� SQL ������ �ۼ��Ͻÿ�.


--2. 4�� ���̺��� ������ �ľ��Ϸ��� �Ѵ�. ���õ� ���ó�� TABLE_NAME, COLUMN_NAME, DATA_TYPE,
--DATA_DEFAULT, NULLABLE, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME ����
--��ȸ�ϴ� SQL ������ �ۼ��Ͻÿ�.


--3. �������� 25�� �̻��� å ��ȣ�� �������� ȭ�鿡 ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT BOOK_NO,BOOK_NM
FROM TB_BOOK
WHERE LENGTH(BOOK_NM)>=25;

--4. �޴��� ��ȣ�� ��019���� �����ϴ� �达 ���� ���� �۰��� �̸������� �������� �� ���� ���� ǥ�õǴ� �۰�
--�̸��� �繫�� ��ȭ��ȣ, �� ��ȭ��ȣ, �޴��� ��ȭ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT WRITER_NM , OFFICE_TELNO,HOME_TELNO,MOBILE_NO
FROM (SELECT WRITER_NM , OFFICE_TELNO,HOME_TELNO,MOBILE_NO
        FROM TB_WRITER
        WHERE MOBILE_NO LIKE '019%'
        AND WRITER_NM LIKE '��%'
        ORDER BY WRITER_NM)
WHERE ROWNUM<=1;

--5. ���� ���°� ���ű衱�� �ش��ϴ� �۰����� �� �� ������ ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��� �����
--���۰�(��)������ ǥ�õǵ��� �� ��)
SELECT * FROM TB_BOOK_AUTHOR;

SELECT DISTINCT WRITER_NO
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '�ű�';


SELECT COUNT(*) AS "�۰�(��)"
FROM (SELECT DISTINCT WRITER_NO
        FROM TB_BOOK_AUTHOR
        WHERE COMPOSE_TYPE = '�ű�');


--6. 300�� �̻� ��ϵ� ������ ���� ���� �� ��ϵ� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.(����
--���°� ��ϵ��� ���� ���� ������ ��)
SELECT * FROM TB_BOOK_AUTHOR;

SELECT *
FROM (SELECT COMPOSE_TYPE,COUNT(BOOK_NO)
        FROM TB_BOOK_AUTHOR
        WHERE COMPOSE_TYPE IS NOT NULL
        GROUP BY COMPOSE_TYPE
        ORDER BY 2 DESC)
WHERE ROWNUM <=2;


--���� �ڵ庸�� �Ʒ��ڵ尡 �� ������ ������ �ڵ� ����....(������ ������ �ϳ� �����ִ�.)
SELECT COMPOSE_TYPE,COUNT(BOOK_NO)
FROM TB_BOOK_AUTHOR
GROUP BY COMPOSE_TYPE
HAVING COMPOSE_TYPE IS NOT NULL
AND COUNT(BOOK_NO) >= '300';


--7. ���� �ֱٿ� �߰��� �ֽ��� �̸��� ��������, ���ǻ� �̸��� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_BOOK;  --�������� -> ISSUE_DATE

SELECT BOOK_NM,ISSUE_DATE,PUBLISHER_NM
FROM TB_BOOK
ORDER BY ISSUE_DATE DESC;

SELECT BOOK_NM,ISSUE_DATE,PUBLISHER_NM
FROM (SELECT BOOK_NM,ISSUE_DATE,PUBLISHER_NM
        FROM TB_BOOK
        ORDER BY ISSUE_DATE DESC)
WHERE ROWNUM = 1;


--8. ���� ���� å�� �� �۰� 3���� �̸��� ������ ǥ���ϵ�, ���� �� ������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--��, ��������(��٣���) �۰��� ���ٰ� �����Ѵ�. (��� ����� ���۰� �̸���, ���� ������ ǥ�õǵ��� ��
--��)
SELECT * FROM TB_WRITER;        --WRITER_NO
SELECT * FROM TB_BOOK_AUTHOR;   --WRITER_NO

SELECT WRITER_NM, COUNT(WRITER_NO)
FROM TB_WRITER
JOIN TB_BOOK_AUTHOR USING(WRITER_NO)
GROUP BY WRITER_NO,WRITER_NM
ORDER BY COUNT(WRITER_NO)DESC;

SELECT "�۰��̸�" , "�� ��"
FROM (SELECT WRITER_NM AS "�۰��̸�", COUNT(WRITER_NO)AS "�� ��"
        FROM TB_WRITER
        JOIN TB_BOOK_AUTHOR USING(WRITER_NO)
        GROUP BY WRITER_NO,WRITER_NM
        ORDER BY COUNT(WRITER_NO)DESC)
WHERE ROWNUM <=3;

--9. �۰� ���� ���̺��� ��� ������� �׸��� �����Ǿ� �ִ� �� �߰��Ͽ���. ������ ������� ���� �� �۰���
--������ ���ǵ����� �����ϰ� ������ ��¥���� �����Ű�� SQL ������ �ۼ��Ͻÿ�. (COMMIT ó���� ��)
SELECT * FROM TB_WRITER;                    --WRITER_NO
SELECT * FROM TB_BOOK;          --BOOK_NO
SELECT * FROM TB_BOOK_AUTHOR;   --BOOK_NO   --WRITER_NO

SELECT ISSUE_DATE
FROM TB_BOOK_AUTHOR
JOIN TB_BOOK USING(BOOK_NO)
JOIN TB_WRITER USING(WRITER_NO);


UPDATE TB_WRITER W
SET REGIST_DATE = (SELECT MIN(ISSUE_DATE)
                    FROM TB_BOOK
                    JOIN TB_BOOK_AUTHOR USING(BOOK_NO)
                    WHERE W.WRITER_NO = WRITER_NO);
           
COMMIT;           
                   
ROLLBACK;


--10. ���� �������� ���� ���̺��� ������ �������� ���� ���� �����ϰ� �ִ�. �����δ� �������� ���� �����Ϸ�
--�� �Ѵ�. ���õ� ���뿡 �°� ��TB_BOOK_ TRANSLATOR�� ���̺��� �����ϴ� SQL ������ �ۼ��Ͻÿ�.
--(Primary Key ���� ���� �̸��� ��PK_BOOK_TRANSLATOR���� �ϰ�, Reference ���� ���� �̸���
--��FK_BOOK_TRANSLATOR_01��, ��FK_BOOK_TRANSLATOR_02���� �� ��)
SELECT * FROM TB_BOOK_AUTHOR;

GRANT CREATE TABLE TO workshop; --���� ����

CREATE TABLE TB_BOOK_TRANSLATOR(
    BOOK_NO VARCHAR2(10) NOT NULL,
    WRITER_NO VARCHAR2(10) NOT NULL,
    TRANS_LANG VARCHAR2(60),
    CONSTRAINT PK_BOOK_TRANSLATOR PRIMARY KEY (BOOK_NO, WRITER_NO),
    
    CONSTRAINT FK_BOOK_TRANSLATOR_01 FOREIGN KEY(BOOK_NO) REFERENCES TB_BOOK,
    CONSTRAINT FK_BOOK_TRANSLATOR_02 FOREIGN KEY(WRITER_NO) REFERENCES TB_WRITER
);

--DROP TABLE TB_BOOK_TRANSLATOR;

COMMENT ON COLUMN TB_BOOK_TRANSLATOR.BOOK_NO IS '������ȣ';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.WRITER_NO IS '�۰���ȣ';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.TRANS_LANG IS '�������';

SELECT * FROM TB_BOOK_TRANSLATOR;

--11. ���� ���� ����(compose_type)�� '�ű�', '����', '��', '����'�� �ش��ϴ� �����ʹ�
--���� ���� ���� ���̺��� ���� ���� ���� ���̺�(TB_BOOK_ TRANSLATOR)�� �ű�� SQL 
--������ �ۼ��Ͻÿ�. ��, ��TRANS_LANG�� �÷��� NULL ���·� �ε��� �Ѵ�. (�̵��� �����ʹ� ��
--�̻� TB_BOOK_AUTHOR ���̺� ���� ���� �ʵ��� ������ ��)
SELECT * FROM TB_BOOK_TRANSLATOR;
SELECT * FROM TB_BOOK_AUTHOR;

SELECT BOOK_NO,COMPOSE_TYPE
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�','����','��','����');

--������ �� �ֱ�
INSERT INTO TB_BOOK_TRANSLATOR(BOOK_NO,WRITER_NO)
SELECT BOOK_NO,WRITER_NO
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�','����','��','����');


DELETE FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�','����','��','����');

--ROLLBACK;


--12. 2007�⵵�� ���ǵ� ������ �̸��� ������(����)�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_BOOK;              --BOOK_NO
SELECT * FROM TB_BOOK_TRANSLATOR;   --BOOK_NO       --WRITER_NO
SELECT * FROM TB_WRITER;                            --WRITER_NO


SELECT BOOK_NM,WRITER_NM,ISSUE_DATE
FROM TB_BOOK
JOIN TB_BOOK_TRANSLATOR USING(BOOK_NO)
JOIN TB_WRITER USING (WRITER_NO)
WHERE SUBSTR(ISSUE_DATE,1,2)=07
ORDER BY WRITER_NM DESC;


--13. 12�� ����� Ȱ���Ͽ� ��� ���������� �������� ������ �� ������ �ϴ� �並 �����ϴ� SQL
--������ �ۼ��Ͻÿ�. (�� �̸��� ��VW_BOOK_TRANSLATOR���� �ϰ� ������, ������, ��������
--ǥ�õǵ��� �� ��)
GRANT CREATE VIEW TO workshop;

SELECT * FROM TB_BOOK;              --BOOK_NO
SELECT * FROM TB_BOOK_TRANSLATOR;   --BOOK_NO       --WRITER_NO
SELECT * FROM TB_WRITER;                            --WRITER_NO


CREATE VIEW VW_BOOK_TRANSLATOR
AS SELECT BOOK_NM,WRITER_NM,ISSUE_DATE
        FROM TB_BOOK
        JOIN TB_BOOK_TRANSLATOR USING(BOOK_NO)
        JOIN TB_WRITER USING (WRITER_NO)
        WHERE SUBSTR(ISSUE_DATE,1,2)=07
        ORDER BY WRITER_NM DESC
WITH READ ONLY;

SELECT * FROM USER_VIEWS;

--�����
--DROP VIEW VW_BOOK_TRANSLATOR;

--14. ���ο� ���ǻ�(�� ���ǻ�)�� �ŷ� ����� �ΰ� �Ǿ���. ���õ� ���� ������ �Է��ϴ� SQL
--������ �ۼ��Ͻÿ�.(COMMIT ó���� ��)
SELECT * FROM TB_PUBLISHER;

INSERT INTO TB_PUBLISHER
VALUES('�� ���ǻ�','02-6710-3939',DEFAULT);

COMMIT;

--15. ��������(��٣���) �۰��� �̸��� ã������ �Ѵ�. �̸��� �������� ���ڸ� ǥ���ϴ� SQL ������
--�ۼ��Ͻÿ�.
SELECT * FROM TB_WRITER;

SELECT WRITER_NM, COUNT(WRITER_NM)
FROM TB_WRITER
GROUP BY WRITER_NM
ORDER BY COUNT(WRITER_NM) DESC;

SELECT WRITER_NM ,�������μ�
FROM (SELECT WRITER_NM, COUNT(WRITER_NM) AS"�������μ�"
        FROM TB_WRITER
        GROUP BY WRITER_NM
        ORDER BY COUNT(WRITER_NM) DESC)
WHERE �������μ�>1;


--16. ������ ���� ���� �� ���� ����(compose_type)�� ������ �����͵��� ���� �ʰ� �����Ѵ�. �ش� �÷���
--NULL�� ��� '����'���� �����ϴ� SQL ������ �ۼ��Ͻÿ�.(COMMIT ó���� ��)
SELECT * FROM TB_BOOK_AUTHOR;

UPDATE TB_BOOK_AUTHOR
SET COMPOSE_TYPE = '����'
WHERE COMPOSE_TYPE IS NULL;

COMMIT;

SELECT *
FROM TB_BOOK_AUTHOR
WHERE compose_type IS NULL;


--17. �������� �۰� ������ �����Ϸ��� �Ѵ�. �繫���� �����̰�, �繫�� ��ȭ ��ȣ ������ 3�ڸ��� �۰���
--�̸��� �繫�� ��ȭ ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_WRITER;

SELECT WRITER_NM, OFFICE_TELNO
FROM TB_WRITER
WHERE SUBSTR(OFFICE_TELNO,1,2) = '02'
AND LENGTH(OFFICE_TELNO) = 11
ORDER BY WRITER_NM;


--18. 2006�� 1�� �������� ��ϵ� �� 31�� �̻� �� �۰� �̸��� �̸������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_BOOK;
SELECT * FROM TB_WRITER;

SELECT WRITER_NM
FROM TB_WRITER
WHERE FLOOR(MONTHS_BETWEEN(TO_DATE('2006-01-01'),REGIST_DATE)/12)>=31
ORDER BY WRITER_NM;

--19. ���� ��� �ٽñ� �α⸦ ��� �ִ� 'Ȳ�ݰ���' ���ǻ縦 ���� ��ȹ���� ������ �Ѵ�. 'Ȳ�ݰ���' 
--���ǻ翡�� ������ ���� �� ��� ������ 10�� �̸��� ������� ����, �����¸� ǥ���ϴ� SQL ������
--�ۼ��Ͻÿ�. ��� ������ 5�� �̸��� ������ ���߰��ֹ��ʿ䡯��, �������� ���ҷ��������� ǥ���ϰ�, 
--�������� ���� ��, ������ ������ ǥ�õǵ��� �Ѵ�. 
SELECT *FROM TB_PUBLISHER;
SELECT * FROM TB_BOOK;

SELECT *
FROM TB_PUBLISHER
WHERE PUBLISHER_NM = 'Ȳ�ݰ���';

SELECT BOOK_NM,PRICE,STOCK_QTY
FROM TB_BOOK
WHERE PUBLISHER_NM = 'Ȳ�ݰ���'
AND STOCK_QTY <10
ORDER BY STOCK_QTY DESC, BOOK_NM;


SELECT BOOK_NM AS "������",PRICE AS "����",
        CASE WHEN STOCK_QTY <5 THEN '�߰��ֹ� �ʿ�'
        ELSE '�ҷ�����'
    END AS "������"
FROM TB_BOOK
WHERE PUBLISHER_NM = 'Ȳ�ݰ���'
AND STOCK_QTY <10
ORDER BY STOCK_QTY DESC, BOOK_NM;

--20. '��ŸƮ��' ���� �۰��� ���ڸ� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. (��� �����
--��������,�����ڡ�,�����ڡ��� ǥ���� ��)
SELECT * FROM TB_BOOK;              --BOOK_NO
SELECT * FROM TB_BOOK_AUTHOR;       --BOOK_NO       --WRITER_NO
SELECT * FROM TB_WRITER;                            --WRITER_NO
SELECT * FROM TB_BOOK_TRANSLATOR;

SELECT * 
FROM TB_BOOK
WHERE BOOK_NM = '��ŸƮ��'; --BOOK_NO : 1991081002

SELECT BOOK_NM,WRITER_NM,COMPOSE_TYPE
FROM TB_BOOK
JOIN TB_BOOK_AUTHOR USING(BOOK_NO)
JOIN TB_WRITER USING (WRITER_NO)
WHERE BOOK_NM = '��ŸƮ��';





--21. ���� �������� ���� �����Ϸκ��� �� 30���� ����ǰ�, ��� ������ 90�� �̻��� ������ ���� ������, ���
--����, ���� ����, 20% ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. (��� ����� ��������, �����
--������, ������(Org)��, ������(New)���� ǥ���� ��. ��� ������ ���� ��, ���� ������ ���� ��, ������
--������ ǥ�õǵ��� �� ��
SELECT * FROM TB_BOOK;

SELECT BOOK_NM AS "������", STOCK_QTY AS "������", PRICE AS "����(Org)", (PRICE-(PRICE*0.2)) AS "����(NEW)"
FROM TB_BOOK
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE,MIN(ISSUE_DATE))/12)>30
AND STOCK_QTY >= 90
ORDER BY STOCK_QTY DESC, (PRICE-(PRICE*0.2)) DESC,  BOOK_NM DESC;





