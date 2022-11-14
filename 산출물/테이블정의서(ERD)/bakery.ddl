DROP TABLE order_review CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE QnA CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE user_info CASCADE CONSTRAINTS;

CREATE TABLE user_info(
		user_id                       		VARCHAR2(100)		 NULL ,
		user_password                 		VARCHAR2(10)		 NULL ,
		user_name                     		VARCHAR2(100)		 NULL ,
		user_email                    		VARCHAR2(100)		 NULL ,
		user_phone                    		VARCHAR2(20)		 NULL ,
		user_point                    		NUMBER(10)		 NULL 
);


CREATE TABLE category(
		category_no                   		NUMBER(10)		 NULL ,
		category_name                 		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE category_category_no_SEQ;

CREATE SEQUENCE category_category_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NULL ,
		p_price                       		NUMBER(10)		 NULL ,
		p_image                       		VARCHAR2(100)		 NULL ,
		p_desc                        		VARCHAR2(200)		 NULL ,
		p_click_count                 		NUMBER(10)		 NULL ,
		category_no                   		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE address(
		add_no                        		NUMBER(10)		 NULL ,
		address                       		VARCHAR2(50)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE address_add_no_SEQ;

CREATE SEQUENCE address_add_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_desc                        		VARCHAR2(50)		 NULL ,
		o_date                        		DATE		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
		add_no                        		NUMBER(10)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_title                       		VARCHAR2(100)		 NULL ,
		r_date                        		DATE		 NULL ,
		r_starGrade                   		NUMBER(10)		 NULL ,
		r_content                     		VARCHAR2(300)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE notice(
		notice_no                     		NUMBER(10)		 NULL ,
		notice_title                  		VARCHAR2(100)		 NULL ,
		notice_date                   		DATE		 DEFAULT sysdate     NULL ,
		notice_content                		VARCHAR2(200)		 NULL,
		groupno                       		NUMBER(10)		 NOT NULL,
		step                          		NUMBER(10)		 NOT NULL,
		depth                         		NUMBER(10)		 DEFAULT 0		 NULL 
);

DROP SEQUENCE notice_notice_no_SEQ;

CREATE SEQUENCE notice_notice_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE QnA(
		qna_no                        		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
		qna_title                     		VARCHAR2(100)		 NOT NULL,
		qna_date                      		DATE		 DEFAULT sysdate		 NULL ,
		qna_content                   		VARCHAR2(200)		 NOT NULL,
		qna_readcount                 		NUMBER(10)		 DEFAULT 0		 NULL ,
		groupno                       		NUMBER(10)		 NOT NULL,
		step                          		NUMBER(10)		 NOT NULL,
		depth                         		NUMBER(10)		 DEFAULT 0		 NULL 
);

DROP SEQUENCE QnA_qna_no_SEQ;

CREATE SEQUENCE QnA_qna_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE coupon(
		c_no                          		NUMBER(10)		 NULL ,
		c_start_date                  		DATE		 NULL ,
		c_end_date                    		DATE		 NULL ,
		c_discount                    		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE coupon_c_no_SEQ;

CREATE SEQUENCE coupon_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE order_review(
		r_no                          		NUMBER(10)		 NULL ,
		oi_no                         		NUMBER(10)		 NULL 
);



ALTER TABLE user_info ADD CONSTRAINT IDX_user_info_PK PRIMARY KEY (user_id);

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (category_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (category_no) REFERENCES category (category_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id) on delete CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete CASCADE;

ALTER TABLE address ADD CONSTRAINT IDX_address_PK PRIMARY KEY (add_no);
ALTER TABLE address ADD CONSTRAINT IDX_address_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id) on delete CASCADE;

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK1 FOREIGN KEY (add_no) REFERENCES address (add_no);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (o_no) REFERENCES orders (o_no) on delete CASCADE;

ALTER TABLE order_item DROP FOREIGN KEY IDX_order_item_FK1;

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id) on delete set null;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (notice_no);

ALTER TABLE QnA ADD CONSTRAINT IDX_QnA_PK PRIMARY KEY (qna_no);
ALTER TABLE QnA ADD CONSTRAINT IDX_QnA_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id);

ALTER TABLE coupon ADD CONSTRAINT IDX_coupon_PK PRIMARY KEY (c_no);
ALTER TABLE coupon ADD CONSTRAINT IDX_coupon_FK0 FOREIGN KEY (user_id) REFERENCES user_info (user_id) on delete cascade;

ALTER TABLE order_review ADD CONSTRAINT IDX_order_review_FK0 FOREIGN KEY (r_no) REFERENCES review (r_no) on delete cascade;
ALTER TABLE order_review ADD CONSTRAINT IDX_order_review_FK1 FOREIGN KEY (oi_no) REFERENCES order_item (oi_no) on delete cascade;

