package vo;

import java.util.Date;
import java.util.List;

public class AccountSearchVO {
	protected int userNo;
	protected Date startDay;
	protected Date endDay;
	protected Date duDay;
	private String payment;
	private List<Integer> cateList;
	
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public Date getDuDay() {
		return duDay;
	}
	public void setDuDay(Date duDay) {
		this.duDay = duDay;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public List<Integer> getCateList() {
		return cateList;
	}
	public void setCateList(List<Integer> cateList) {
		this.cateList = cateList;
	}
	



	
	
	
}
