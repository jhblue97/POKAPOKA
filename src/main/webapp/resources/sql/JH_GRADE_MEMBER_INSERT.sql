Insert into DEV.P_GRADE (GRADE_CODE,GRADE_NAME,GRADE_IMG,GRADE_LV) values ('A1','브론즈','001_g_bronze.png',100);
Insert into DEV.P_GRADE (GRADE_CODE,GRADE_NAME,GRADE_IMG,GRADE_LV) values ('A2','실버','002_g_silver.png',300);
Insert into DEV.P_GRADE (GRADE_CODE,GRADE_NAME,GRADE_IMG,GRADE_LV) values ('A3','골드','003_g_gold.png',600);
Insert into DEV.P_GRADE (GRADE_CODE,GRADE_NAME,GRADE_IMG,GRADE_LV) values ('A4','플래티넘','004_g_platinum.png',9999);
Insert into DEV.P_GRADE (GRADE_CODE,GRADE_NAME,GRADE_IMG,GRADE_LV) values ('A5','마스터','005_g_Master.png',9999999);


--test user data
Insert into DEV.P_MEMBER (USER_ID,USER_PW,NICKNAME,EMAIL,BIRTH,GRADECODE,IMG,GENDER,LASTLOGIN,ACCOUNT,REGDATE,UPDATEDATE,ENABLED,GRADE_EXP) values ('user','1111','테스트유저','jjjj@mmm.com','19971124','A2','default.png','F',to_date('21/11/03','RR/MM/DD'),null,to_date('21/11/03','RR/MM/DD'),null,null,160);
