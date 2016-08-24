
create sequence s_minihompy_user_no;
create sequence s_minihompy_account_sort_no;

drop sequence s_minihompy_account_sort_no;
drop s_minihompy_account_sort_no;



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

insert into minihompy_user (user_no, id, pass, name, birth, gender)
values (s_minihompy_user_no.nextval, 'admin', 'admin', '관리자', '2016', '1');

select * from minihompy_user;

create table minihompy_category (
	category_no number primary key,
	name varchar2(100) not null
);

insert into minihompy_category(category_no, name)
values(1, '식비');
insert into minihompy_category(category_no, name)
values(2, '문화생활비');
insert into minihompy_category(category_no, name)
values(3, '건강관리비');
insert into minihompy_category(category_no, name)
values(4, '의류미용비');
insert into minihompy_category(category_no, name)
values(5, '교통비');
insert into minihompy_category(category_no, name)
values(6, '차량유지비');
insert into minihompy_category(category_no, name)
values(7, '학비');
insert into minihompy_category(category_no, name)
values(8, '사회생활비');
insert into minihompy_category(category_no, name)
values(9, '유흥비');
insert into minihompy_category(category_no, name)
values(10, '금융보험비');
insert into minihompy_category(category_no, name)
values(11, '저축');
insert into minihompy_category(category_no, name)
values(12, '통신비');
insert into minihompy_category(category_no, name)
values(13, '기타소비');


insert into minihompy_category(category_no, name)
values(50, '근로소득(월급)');
insert into minihompy_category(category_no, name)
values(51, '금융소득(주식배당금)');
insert into minihompy_category(category_no, name)
values(52, '금융소득(이자)');
insert into minihompy_category(category_no, name)
values(53, '금융소득(계약만기)');
insert into minihompy_category(category_no, name)
values(54, '임대소득');
insert into minihompy_category(category_no, name)
values(55, '기타소득');

create table minihompy_account (
	sort_no number primary key,
	user_no number,
	category_no number,
	tran_date date default sysdate not null,
	payment char(1) not null,
	description varchar2(30) not null,
	note varchar2(500),
	amount number not null
);

alter session set nls_date_format = 'RR/MM/DD HH24:MI:SS'; 

ALTER TABLE minihompy_account ADD CONSTRAINT minihompy_account_u_fk FOREIGN KEY(user_no) REFERENCES minihompy_user(user_no);
ALTER TABLE minihompy_account ADD CONSTRAINT minihompy_account_c_fk FOREIGN KEY(category_no) REFERENCES minihompy_category(category_no);

drop table minihompy_account


/*16년7월분*/


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('16/07/01 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '안놀란치킨', '', -5000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('16/07/02 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '본차길', '', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/03 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', 'CGW강남', '009 8편', -16000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/04 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '롯데박스', '강남행(롯데콤보세트)', -14000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/05 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '메가시네마', '욕지도', -10000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/06 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '예술의전당(한가람', '르브르박물관 특별초청전', -26000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/07 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '대림미술관', '한국근현대 특별전', -16000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/07/08 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '인터파크', '국립현대미술관 서울관', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('16/07/09 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '맹자한의원', '도수치료', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('16/07/10 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '자바약국', '응급약', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('16/07/11 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '가위손미용실', '컷트', -14000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('16/07/12 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '언유니클로', '티셔츠 3장', -14000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('16/07/13 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '역세권구두5호점', ' 강남역3번출구 구두수선집 끈 수선', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 5, to_date('16/07/14 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '역삼택시', '', -6500);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 5, to_date('16/07/15 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '신한은행', '대중교통이용료', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 6, to_date('16/07/16 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '바이트세차장', '3만원 이용권', -25000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 6, to_date('16/07/17 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '삼송주유소', '35리터 주유', -50750);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 6, to_date('16/07/18 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '바이트정비', '엔진오일 등 교체', -70000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 7, to_date('16/07/19 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '해외결제', 'edx데이터 분석과정 결제', -56400);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/07/20 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '장현식 선물', '', -64000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/07/21 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '김길수 장모상', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/07/22 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '강만수 결혼식', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/07/23 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '서초모임 회비', '', -20000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 9, to_date('16/07/24 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '비터살롱', '', -123000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/25 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '(주)RED증권', '펀드', -200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '감동상조', '', -30000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', 'YM보험', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/25 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '둘셋은행', '', -30000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/28 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '비상금', '', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/29 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '나비텔레콤', '할부금(20/24)', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/30 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '월세', '(황금아파트 1205호)', -1200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/07/31 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '관리비', '', -130000);


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 50, to_date('16/07/21 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '점보소프트', '', 3300000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 51, to_date('16/07/22 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '한국전력', '', 300000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 51, to_date('16/07/23 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '삼성물산', '', 400000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 52, to_date('16/07/24 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '신화은행', '', 50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 53, to_date('16/07/25 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '둘셋은행', '5년만기', 30000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('16/07/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '심봉수', '조선오피스텔(706호)', 10000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('16/07/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '김상식', '나라빌딩상가(102호)', 20000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('16/07/28 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', 'TYM대회상금', '', 500000);


/*15년 7월분*/


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('15/07/01 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '안놀란치킨', '', -5000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('15/07/02 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '안놀란치킨', '', -5000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('15/07/06 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '예술의전당(한가람', '고흐미술관 특별초청전', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('15/07/09 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '호동마사지', '', -20000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('15/07/10 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '자바약국', '응급약', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('15/07/11 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '가위손미용실', '컷트', -12000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('15/07/12 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '라자로', '셔츠 3장', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 5, to_date('15/07/14 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '강남택시', '', -7500);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 5, to_date('15/07/15 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '신한은행', '대중교통이용료', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 6, to_date('15/07/17 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '삼송주유소', '35리터 주유', -55000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 7, to_date('15/07/19 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '해외결제', 'edx 데이터 입문과정 결제', -49400);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('15/07/20 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '장현식 선물', '', -30000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('15/07/23 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '서초모임 회비', '', -20000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/25 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '(주)RED증권', '펀드', -200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '감동상조', '', -30000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', 'YM보험', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/28 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '비상금', '', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/29 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '나비텔레콤', '할부금(8/24)', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/30 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '월세', '(황금아파트 1205호)', -1200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('15/07/31 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '관리비', '', -130000);


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 50, to_date('15/07/21 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '점보소프트', '', 3300000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 51, to_date('15/07/22 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '한국전력', '', 160000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 51, to_date('15/07/23 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '삼성물산', '', 200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 52, to_date('15/07/24 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '신화은행', '', 36000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('15/07/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '심봉수', '조선오피스텔(706호)', 10000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('15/07/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '김상식', '나라빌딩상가(102호)', 20000000);



/*16년 6월분*/


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('16/06/01 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '본차길', '', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 1, to_date('16/06/02 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', '본차길', '', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 2, to_date('16/06/03 12:10:17','RR/MM/DD HH24:MI:SS'), 'd', 'CGW강남', '다이이지 2', -16000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('16/06/09 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '맹자한의원', '도수치료', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 3, to_date('16/06/10 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '자바약국', '소화제, 아스피린', -6000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 4, to_date('16/06/11 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '가위손미용실', '컷트', -14000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 5, to_date('16/06/15 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '신한은행', '대중교통이용료', -13000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 6, to_date('16/06/17 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '삼송주유소', '35리터 주유', -50750);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/06/21 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '김철수 장모상', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/06/22 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '강필수 결혼식', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 8, to_date('16/06/23 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '서초모임 회비', '', -20000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/25 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '(주)RED증권', '펀드', -200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '감동상조', '', -30000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', 'YM보험', '', -50000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/28 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '비상금', '', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/29 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '나비텔레콤', '할부금(19/24)', -100000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/30 15:10:17','RR/MM/DD HH24:MI:SS'), 'c', '월세', '(황금아파트 1205호)', -1200000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 10, to_date('16/06/01 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '관리비', '', -120000);


insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 50, to_date('16/06/21 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '점보소프트', '', 3300000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('16/06/26 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '심봉수', '조선오피스텔(706호)', 10000000);
insert into minihompy_account( SORT_NO, USER_NO, CATEGORY_NO, TRAN_DATE, PAYMENT, DESCRIPTION, NOTE, AMOUNT)
values(s_minihompy_account_sort_no.nextval, 1, 54, to_date('16/06/27 15:10:17','RR/MM/DD HH24:MI:SS'), 'd', '김상식', '나라빌딩상가(102호)', 20000000);










		select *
		from(
			select account.*, catagory.name		
			  from MINIHOMPY_ACCOUNT account
			  	   , minihompy_category catagory
			 where USER_NO = 1
			   and account.category_no = catagory.category_no	
		  order by TRAN_DATE desc
			)
		where ROWNUM <= 10
		;








