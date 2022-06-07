package com.controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;
import com.dto.LoginDto;
import com.service.LoginInsertService;
import com.service.LoginListService;
import com.service.LoginService;

@WebServlet("*.do")
public class LControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = null;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI();
		System.out.println("view : "+viewPage);
		System.out.println("uri : "+uri);
		
		out.println(uri+"<br>");
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		out.println(com);
		
		switch (com.trim()) {
		case "list":
			LoginService serviceList = new LoginListService();
			serviceList.execute(request, response);
			viewPage="/WEB-INF/view/list.jsp";
			break;
		case "index":
			viewPage="/WEB-INF/view/index.html";
			break;
		case "insertForm":
			viewPage="/WEB-INF/view/insertForm.jsp";
			break;
		case "insert":
			LoginService serviceInsert = new LoginInsertService();
			serviceInsert.execute(request, response);
			viewPage="/WEB-INF/view/index.html";
			break;
		}

		System.out.println("change view : "+viewPage);
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
