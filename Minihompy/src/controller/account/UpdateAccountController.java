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
import vo.AccountVO;

@WebServlet("/account/updateAccount")
public class UpdateAccountController extends HttpServlet {

	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		
		AccountVO account = new AccountVO();
		account.setSortNo(Integer.parseInt(request.getParameter("sortNo")));
		account.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		account.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		account.setAmount(Integer.parseInt(request.getParameter("amount")));
		account.setPayment(request.getParameter("payment"));
		account.setDescription(request.getParameter("description"));
		account.setNote(request.getParameter("note"));
				
		try {
			account.setTranDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(request.getParameter("tranDate")));
		} catch (ParseException e) {
			System.out.println("수정시 날짜 오류");
			e.printStackTrace();
		}
		
		
		new AccountDAO().updateAccount(account);
		
		response.sendRedirect(request.getContextPath()+"/account/detailAccount?no=" + account.getSortNo());
		
//		RequestDispatcher rd = request.getRequestDispatcher("/account/detailAccount?no=" + account.getSortNo());
//		rd.forward(request, response);
	}
	
}
