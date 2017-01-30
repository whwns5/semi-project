CREATE TABLE bid (
  P_ID NUMBER PRIMARY KEY,
  P_CATEGORY1 varchar2(100),
  P_NAME varchar2(100),
  P_PRICE NUMBER,
  P_MADEN varchar2(100),
  P_BRAND varchar2(100),
  P_MODEL varchar2(100),
  P_MAXBUY NUMBER,
  P_ETC varchar2(100),
  P_SEARCH varchar2(100),
  P_VALIDATION varchar2(100),
  P_T_TYPE varchar2(100),
  P_T_P_TYPE varchar2(100),
  P_B_IMG_SRC varchar2(100),
  P_S_IMG_SRC varchar2(100),
  P_DETAIL varchar2(1000),
  P_CATEGORY2 varchar2(100),
  P_DATE DATE,
  USERS varchar2(100),
  COUNT NUMBER,
  P_ENDDATE DATE,
  T_USER varchar2(45)
);

SELECT * FROM BID
