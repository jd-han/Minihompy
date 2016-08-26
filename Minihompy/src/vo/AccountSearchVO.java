package vo;

import java.util.Date;

public class AccountSearchVO {
	protected int userNo;
	protected Date startDay;
	protected Date endDay;
	protected Date duDay;
	
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
	
	
}
