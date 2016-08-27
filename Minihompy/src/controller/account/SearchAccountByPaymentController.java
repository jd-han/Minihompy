package controller.account;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import javax.xml.ws.RequestWrapper;


import dao.AccountDAO;
import vo.AccountSearchVO;
import vo.AccountVO;

@WebServlet("/account/searchAccountByPayment")
public class SearchAccountByPaymentController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountSearchVO aSearch= new AccountSearchVO();
		
		aSearch.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		aSearch.setPayment(request.getParameter("payment"));
		
		try {
			aSearch.setStartDay(new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("startDate")));
			aSearch.setEndDay(new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("endDate")));
			aSearch.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		} catch (ParseException e) {
			System.out.println("날짜 입력시 오류");
			e.printStackTrace();
		}

		List<AccountVO> resultAccountList = new AccountDAO().selectAccountByPayment(aSearch);
		request.setAttribute("resultAccountList", resultAccountList);

		
		int sumOfExpense = 0;
		int sumOfRevenue = 0;
		
		for(AccountVO account : resultAccountList){
			if(account.getAmount()>0){
				sumOfRevenue += account.getAmount();
			}else{
				sumOfExpense += account.getAmount();
			}
		}
		
		request.setAttribute("sumOfExpense", sumOfExpense);
		request.setAttribute("sumOfRevenue", sumOfRevenue);
		
		
		List<AccountVO> resultSumList = new AccountDAO().selectAccountByPaymentAndCategory(aSearch);
		request.setAttribute("resultSumList", resultSumList);
		
		
		

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/resultAccountList.jsp");
		rd.forward(request, response);
	}
	
}
