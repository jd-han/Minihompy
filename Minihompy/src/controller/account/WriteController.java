package controller.account;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.AccountDAO;
import vo.AccountVO;



@WebServlet("/account/writeAccount")
public class WriteController extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccountVO account = new AccountVO();
		account.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		account.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
		account.setAmount(Integer.parseInt(request.getParameter("amount")));
		account.setPayment(request.getParameter("payment"));
		account.setDescription(request.getParameter("description"));
		account.setNote(request.getParameter("note"));		
		try {
			account.setTranDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(request.getParameter("tranDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		// 게시물 저장 처리 부탁..
		
		new AccountDAO().insertAccount(account);		
		
		response.sendRedirect(request.getContextPath()+"/account/recentList");
	}

}
