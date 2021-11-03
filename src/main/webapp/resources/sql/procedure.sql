--------------------------------------------------------
--  파일이 생성됨 - 수요일-11월-03-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure GRADE_EXP_LOGIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DEV"."GRADE_EXP_LOGIN" 
(
  USERID IN VARCHAR2 
) AS 
BEGIN
  
          UPDATE P_MEMBER SET GRADE_EXP = GRADE_EXP + 10 
            WHERE USER_ID = USERID; 

    DECLARE   GRADE_COUNT NUMBER; GRADE_EX NUMBER; lv_count NUMBER;
     BEGIN
     SELECT COUNT(*)
         INTO GRADE_COUNT
        FROM P_GRADE;

       SELECT GRADE_EXP
         INTO GRADE_EX
        FROM P_MEMBER
       WHERE USER_ID = USERID;
  SELECT COUNT(*)
     into lv_count
     from p_grade
     where grade_lv  > GRADE_EX;


    UPDATE P_MEMBER SET GRADECODE = 'A'||(GRADE_COUNT-lv_count+1)
    WHERE USER_ID = USERID;
    END; 
  
  
  
  
END GRADE_EXP_LOGIN;

/
