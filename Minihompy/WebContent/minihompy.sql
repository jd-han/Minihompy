create sequence s_minihompy_file_no;

-- 이거 해
create sequence s_minihompy_user_no;

create sequence s_minihompy_diary_no;
create sequence s_minihompy_comment_no;

-- 윤도리
create sequence s_minihompy_book_no;

create sequence s_minihompy_sort_no;
create sequence s_minihompy_category_no;
create sequence s_minihompy_friend_no;



create table minihompy_code (
	code_no varchar2(4),
	group_code varchar2(30),
	code_value varchar2(500),
	order_no number not null,
	CONSTRAINT minihompy_code_pk PRIMARY KEY (code_no, group_code)
);

create table minihompy_user (
	user_no number primary key,
	id varchar2(50) not null,
	pass varchar2(50) not null,
	name varchar2(50) not null,
	birth varchar2(10) not null,
	gender char(1) not null,
	file_no varchar2(500),
	introduction varchar2(1000),
	join_date date default sysdate,
	withdraw_date date,
	code_no varchar2(4),
	group_code varchar2(30) default 'reason'
);

ALTER TABLE minihompy_user ADD CONSTRAINT minihompy_user_fk FOREIGN KEY(code_no, group_code) REFERENCES minihompy_code(code_no, group_code);

select * from minihompy_user;

create table minihompy_category (
	category_no number primary key,
	name varchar2(100) not null
);

create table minihompy_account (
	sort_no number primary key,
	user_no number,
	category_no number,
	tran_date date default sysdate not null,
	payment char(1) not null,
	description varchar2(30) not null,
	note varchar2(500) not null,
	amount number not null
);

ALTER TABLE minihompy_account ADD CONSTRAINT minihompy_account_u_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);
ALTER TABLE minihompy_account ADD CONSTRAINT minihompy_account_c_fk FOREIGN KEY(category_no) REFERENCES minihompy_category(category_no);

create table minihompy_book (
	book_no number primary key,
	user_no number,
	writer_user_no number,
	content varchar2(1000) not null,
	reg_date date default sysdate
);

ALTER TABLE minihompy_book ADD CONSTRAINT minihompy_book_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);

create table minihompy_file (
	file_no number primary key,
	user_no number,
	ori_file_name varchar2(200) not null,
	real_file_name varchar2(200) not null,
	file_path varchar2(100) not null
);

ALTER TABLE minihompy_file ADD CONSTRAINT minihompy_file_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);

create table minihompy_diary (
	diary_no number primary key,
	user_no number,
	title varchar2(500) not null,
	content varchar2(1000) not null,
	recommend_cnt number not null,
	reg_date date default sysdate
);

ALTER TABLE minihompy_diary ADD CONSTRAINT minihompy_diary_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);

create table minihompy_diary_comment (
	comment_no number primary key,
	diary_no number,
	user_no number,
	content varchar2(1000) not null,
	reg_date date default sysdate
);

ALTER TABLE minihompy_diary_comment ADD CONSTRAINT diary_comment_u_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);
ALTER TABLE minihompy_diary_comment ADD CONSTRAINT diary_comment_d_fk FOREIGN KEY(diary_no) REFERENCES minihompy_diary(diary_no);

create table minihompy_friend (
	friend_no number primary key,
	user_no number,
	friend_user_no number,
	code_no varchar2(4), 
	group_code varchar2(30) default 'state',
	accept_date date
);

ALTER TABLE minihompy_friend ADD CONSTRAINT friend_u_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);
ALTER TABLE minihompy_friend ADD CONSTRAINT friend_f_u_fk FOREIGN KEY(friend_user_no) REFERENCES minihompy_user(user_no);
ALTER TABLE minihompy_friend ADD CONSTRAINT friend_c_fk FOREIGN KEY(code_no, group_code) REFERENCES minihompy_code(code_no, group_code);



insert into minihompy_user (user_no, id, pass, name, birth, gender)
values (s_minihompy_user_no.nextval, 'admin', 'admin', '관리자', '2016', '1');