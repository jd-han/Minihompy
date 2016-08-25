package controller.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;


@WebServlet("/account/deleteAccount")
public class DeleteAccountController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new AccountDAO().deleteAccount(Integer.parseInt(request.getParameter("no")));
		
		response.sendRedirect(request.getContextPath()+"/account/recentList");
	}
	
}
