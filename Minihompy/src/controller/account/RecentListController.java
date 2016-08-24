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

@WebServlet("/account/recentList")
public class RecentListController extends HttpServlet {

	@Override

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		int userNo = request.getSession().getAttribute("LOGIN_USER_INFO").getUserNo();
		int userNo=1;
		List<AccountVO> recentAccountList = new AccountDAO().selectRecentAccount(userNo);

		request.setAttribute("recentAccountList", recentAccountList);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/recentAccountList.jsp");
		rd.forward(request, response);
	}

}
