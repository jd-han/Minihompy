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
	private int categoryNo;
	private Date tranDate;
	private String payment;
	private String description;
	private String note;
	private int amount;
	
	
	public int getSortNo() {
		return sortNo;
	}
	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Date getTranDate() {
		return tranDate;
	}
	public void setTranDate(Date tranDate) {
		this.tranDate = tranDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	
	
	
	
	
	
	

}
