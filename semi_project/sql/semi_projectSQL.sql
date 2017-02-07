
/* 회원 테이블 */
CREATE TABLE member_table(
	member_idx NUMBER PRIMARY KEY,
  	member_id VARCHAR2(20), 
	member_type VARCHAR2(10),
	member_name VARCHAR2(20),
	member_pwd VARCHAR2(40),
	member_birthday DATE,
	member_sex VARCHAR2(10),
	member_email VARCHAR2(40),
	member_tel VARCHAR2(20),
	member_addr VARCHAR2(100),
	member_coupon VARCHAR2(20),
	member_regdate DATE
  );
/* 회원 IDX 시퀀스 */
CREATE SEQUENCE member_table_idx MINVALUE 0 START WITH 1;
  
/* 대분류 카테고리 테이블 */
CREATE TABLE largecategory_table(
	largecategory_id NUMBER,
	largecategory_name VARCHAR2(20)
  );

/* 소분류 카테고리 테이블 */
CREATE TABLE smallcategory_table(
	smallcategory_id NUMBER,
	smallcategory_name VARCHAR2(20),
	largecategory_id NUMBER
);
  
/* 상품 테이블 */
CREATE TABLE product_table(
	product_idx NUMBER PRIMARY KEY,
	smallcategory_id NUMBER,
	product_name VARCHAR2(1000),
	product_code VARCHAR2(1000),
	product_color VARCHAR2(200),
	product_size VARCHAR2(1000),
	product_num NUMBER,
	product_price NUMBER,
	product_content VARCHAR2(3000),
	product_img VARCHAR2(1000),
	product_imgcount NUMBER,
	product_regdate DATE
  );
/* 상품 아이디 시퀀스 */
CREATE SEQUENCE product_table_idx MINVALUE 0 START WITH 1;


/* 장바구니 테이블 */
CREATE TABLE cart_table(
	cart_idx NUMBER PRIMARY KEY,
	member_id VARCHAR2(20),
	product_idx NUMBER,
	cart_num NUMBER,
	cart_validity NUMBER,
	product_price NUMBER
  );
/* 장바구니 아이디 시퀀스 */
CREATE SEQUENCE cart_table_idx MINVALUE 0 START WITH 1;
  
/* 결제 테이블 */
CREATE TABLE payment_table test(
  	payment_idx NUMBER PRIMARY KEY,
	member_id VARCHAR2(20),
	product_idx NUMBER,
	payment_totalprice NUMBER,
	payment_num NUMBER,
	payment_addr VARCHAR2(100),
	payment_tel VARCHAR2(20)
	product_name VARCHAR2(1000),
	product_code VARCHAR2(1000),
	product_color VARCHAR2(200),
	payment_date DATE format 'YYYY/MM/DD'
  );
/* 결제 테이블 시퀀스 */
CREATE SEQUENCE payment_table_idx MINVALUE 0 START WITH 1;
  
/* 질문게시판 테이블 */
CREATE TABLE qna_table(
	qna_idx NUMBER PRIMARY KEY,
	product_idx NUMBER,
	member_id VARCHAR2(20),
	qna_subject VARCHAR2(100),
	qna_content VARCHAR2(1000),
	qna_regdate DATE,
	qna_ref NUMBER,
	qna_lev NUMBER,
	qna_sunbun NUMBER
  );
/* 질문게시판 테이블 시퀀스 */
CREATE SEQUENCE qna_table_idx MINVALUE 0 START WITH 1;

/* 리뷰 테이블 */
CREATE TABLE review_table(
	review_idx NUMBER PRIMARY KEY,
	product_idx NUMBER,
	member_id VARCHAR2(20),
	review_subject VARCHAR2(100),
	review_content VARCHAR2(1000),
	review_regdate DATE,
	review_grade NUMBER,
	review_img VARCHAR2(100),
	review_ref NUMBER,
	review_lev NUMBER,
	review_sunbun NUMBER
  );
/* 리뷰 테이블 시퀀스 */
CREATE SEQUENCE review_table_idx MINVALUE 0 START WITH 1;

/* 리플 테이블 */
CREATE TABLE reply_table(
	reply_idx NUMBER PRIMARY KEY,
	review_idx NUMBER,
	member_name VARCHAR2(20),
	reply_subject VARCHAR2(100),
	reply_content VARCHAR2(1000)
  );
/* 리플 테이블 시퀀스 */
CREATE SEQUENCE reply_table_idx MINVALUE 0 START WITH 1;

/* 쿠폰 테이블 */
CREATE TABLE coupon_table(
	coupon_idx NUMBER PRIMARY KEY,
	coupon_code VARCHAR2(100),
	coupon_start DATE,
	coupon_end DATE,
	coupon_usecheck NUMBER,
	coupon_regdate DATE
);
/* 쿠폰 테이블 시퀀스 */
CREATE SEQUENCE coupon_table_idx MINVALUE 0 START WITH 1;

