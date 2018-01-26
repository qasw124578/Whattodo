package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.model.dao.UserDAO;
import com.java.model.vo.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		//post�� ���� -> �ѱ� ������ �ʰ� 
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password"); //getParameter() �ϳ��� ������ �޾ƿ�
//		String[] hobby = request.getParameterValues("hobby"); //getParameterValues() �ټ��� ������ �޾ƿ� 
		
		// ��ȿ�� �˻� �κ�
		if(userid == null || userid.trim().length() ==0 ||
				password== null || password.trim().length() ==0){
				
			System.out.println("��ȿ�� �˻� ����");
			
			/*request.setAttribute("errorMessage", "��ȿ�� �˻� ����"); //setAttribute(key,��)
			request.getRequestDispatcher("login.jsp").forward(request, response);*/
			//response.sendRedirect("login.jsp");	//login.jsp �������� �̵� �ڵ�, �׻� ������ �̵� �ڵ带 ����Ҷ� �ݵ�� return�� ����
			return;									//response.sendRedirect("login.jsp"); ���ڵ�δ� ������ ������ �� ����.
		}
		
		UserDAO userdao = new UserDAO();
		String name = userdao.login(userid, password); // UserDAO���� �޾ƿ� id, password�� name�̶� ������ �ִ°� 
		if(name !=null){
			//�α��� ����
			HttpSession session = request.getSession();
			session.setAttribute("user", new User(userid, name));
			System.out.println(name);
			System.out.println("�α��� ����");
			response.sendRedirect("recommend.jsp");
			return;
		}else{
			//�α��� ����
			System.out.println("�α��� ����"); // server�� ���� �ֿܼ� ������ sysout
			request.setAttribute("errorMessage", "����� ��й�ȣ�� �ٽ� Ȯ���� �ּ���."); //setAttribute(key,��)			
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;		
		}
			
		
		
	}

}
