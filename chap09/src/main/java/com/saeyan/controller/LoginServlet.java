package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.MemberDAO;
import com.saeyan.dto.MemberVO;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//a링크에서 get방식으로 넘어올때 login.jsp로 연결시켜주는 방법
		String url="member/login.jsp";
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			url="main.jsp";//메인 페이지로 이동한다.
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="member/login.jsp";
		//post방식 
		String userid = request.getParameter("userid");
	    String pwd = request.getParameter("pwd");

	    MemberDAO mDao = MemberDAO.getInstance(); //리턴받기위한 인스턴스 객체생성
	    int result = mDao.userCheck(userid,pwd); //(1,0,-1 중 하나를 받아옴)		
	  
	    //첫 가입후 1번을 가지고옴
	    if(result == 1) {
	    	
	    	//세션에 그 사람의 정보를 올려놓고 통행증 발급
	    	MemberVO mVo = mDao.getMember(userid);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", mVo); //loginUser 세션에 mVo객체 저장
            
            // 회원가입에 성공하면 main.jsp로 가니까 굳이 써야 할 의미가 없다.
            request.setAttribute("message", "회원가입을 성공했어요.");
            url = "main.jsp";
	    }else if(result == 0){
            request.setAttribute("message", "비밀번호가 틀렸어요.");
            
        }else if(result == -1){
            request.setAttribute("message", "존재하지 않는 회원입니다.");
        }
	    //login.jsp에 가자(message를 들고 간다.)
	    System.out.println(url);
	    RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}

}