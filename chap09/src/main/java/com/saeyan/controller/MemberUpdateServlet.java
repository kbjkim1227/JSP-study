package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.MemberDAO;
import com.saeyan.dto.MemberVO;


@WebServlet("/MemberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid=request.getParameter("userid");
		//  위 회원의 정보를 가져오자 ( 수정 폼 페이지에 보이게놓자)
		
		//수정할 회원 정보를 가져다가 뷰에 보이게하자
		MemberDAO mDao=MemberDAO.getInstance();
		MemberVO mVo=mDao.getMember(userid);
		
		//mVo에 저장해 옴
		request.setAttribute("mVo", mVo);
		
		//memberUpdate.jsp에 보이게함
		RequestDispatcher dispatcher=request
				.getRequestDispatcher("member/memberUpdate.jsp");
		dispatcher.forward(request,response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone= request.getParameter("phone");
        String admin = request.getParameter("admin");
        
        MemberVO mVo = new MemberVO();
       
        mVo.setUserid(userid);
        mVo.setPwd(pwd);
        mVo.setEmail(email);
        mVo.setPhone(phone);
        mVo.setAdmin(Integer.parseInt(admin));
        
        MemberDAO dao=MemberDAO.getInstance();
        dao.updateMember(mVo); //수정하러 보내기
        
        //수정후에 login.do의 get으로가기 
        //세션에 데이터가 있는 상태이기때문에 request로 전달 할 필요가없다.
        //페이지 자체를 변경시키는 redirect로 실행
        response.sendRedirect("login.do");
	}

}