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

@WebServlet("*.do")
public class LControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI();
		
		out.println(uri+"<br>");
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		out.println(com);
		
		switch (com.trim()) {
		case "list":
			LoginDao dao = new LoginDao();
			ArrayList<LoginDto> dtos = dao.select();
			request.setAttribute("dtos", dtos);
			
			RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
			break;
		case "insert":
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
