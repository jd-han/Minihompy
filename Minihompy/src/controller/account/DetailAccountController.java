package controller.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import vo.AccountVO;

@WebServlet("/account/detailAccount")
public class DetailAccountController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int findNo = Integer.parseInt(request.getParameter("no"));
		AccountVO Account = new AccountDAO().selectAccountByNo(findNo);
		
		request.setAttribute("account", Account);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/detailAccount.jsp?no=" + Account.getSortNo());
		rd.forward(request, response);
	}
	
}
