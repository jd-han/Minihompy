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

@WebServlet("/account/searchAccountByTerm")
public class SearchAccountByTermController extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountSearchVO aSearch = new AccountSearchVO();
				
		try {
			aSearch.setStartDay(new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("startDate")));
			aSearch.setEndDay(new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("endDate")));
			aSearch.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		} catch (ParseException e) {
			System.out.println("날짜 입력시 오류");
			e.printStackTrace();
		}

		List<AccountVO> resultAccountList = new AccountDAO().selectAccountByTerm(aSearch);
		
		

		request.setAttribute("resultAccountList", resultAccountList);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/resultAccountList.jsp");
		rd.forward(request, response);
	}
	
}
