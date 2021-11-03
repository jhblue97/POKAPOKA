create or replace TRIGGER grade_exp_review
AFTER INSERT ON P_REVIEW
FOR EACH ROW
BEGIN 
    IF :new.CONTENT IS NOT NULL THEN 
          UPDATE P_MEMBER SET GRADE_EXP = GRADE_EXP + 20 
            WHERE USER_ID = :new.WRITER; 
    ELSE
         UPDATE P_MEMBER SET GRADE_EXP = GRADE_EXP + 10 
          WHERE USER_ID = :new.WRITER;
    END IF;
    DECLARE   GRADE_COUNT NUMBER; GRADE_EX NUMBER; lv_count NUMBER;
     BEGIN
     SELECT COUNT(*)
         INTO GRADE_COUNT
        FROM P_GRADE;

       SELECT GRADE_EXP
         INTO GRADE_EX
        FROM P_MEMBER
       WHERE USER_ID = :new.WRITER;
  SELECT COUNT(*)
     into lv_count
     from p_grade
     where grade_lv  > GRADE_EX;


    UPDATE P_MEMBER SET GRADECODE = 'A'||(GRADE_COUNT-lv_count+1)
    WHERE USER_ID = :new.WRITER;  
    END; 


END;