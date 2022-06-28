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


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher=request.getRequestDispatcher("member/join.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String admin = request.getParameter("admin");
        
        
        //insert에 넣기위해 bean 생성
        MemberVO mVo = new MemberVO();
        mVo.setName(name);
        mVo.setUserid(userid);
        mVo.setPwd(pwd);
        mVo.setEmail(email);
        mVo.setPhone(phone);
        mVo.setAdmin(Integer.parseInt(admin));
        
        //DB에 insert 시키는 작업
        MemberDAO mDao = MemberDAO.getInstance();        
        int result = mDao.insertMember(mVo); 
        
        
        //받아온 result로 가입처리 , 메세지처리
        HttpSession session = request.getSession();
        if(result == 1) {
        	session.setAttribute("userid",mVo.getUserid());
        	request.setAttribute("message","회원가입에 성공했습니다.");
        }else {
        	request.setAttribute("message","회원가입에 실패했습니다.");
        }
        
        
        //login.jsp로 값을 배달
        RequestDispatcher dispatcher=request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request, response);
        //request.getRequestDispatcher("member/login.jsp").forward(request, response);
	}

}