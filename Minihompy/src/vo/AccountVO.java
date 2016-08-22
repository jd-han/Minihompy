package vo;

import java.util.Date;

/*
 *  sort_no number primary key,
	user_no number,
	category_no number,
	tran_date date default sysdate not null,
	payment char(1) not null,
	description varchar2(30) not null,
	note varchar2(500) not null,
	amount number not null
	
	
    category_no number primary key,
	name varchar2(100) not null
 */

public class AccountVO {
	private int sortNo;
	private int userNo;
	private String categoryName;
	private Date tranDate;
	private String payment;
	private String description;
	private String note;
	private int amount;
	
	
	
	
	
	
	
	

}
