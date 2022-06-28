package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.saeyan.dto.MemberVO;


public class MemberDAO {
   private MemberDAO() {
      
   }
   
   private static MemberDAO instance = new MemberDAO();
   
   public static MemberDAO getInstance() {
      return instance;
   }
   
   public Connection getConnection() throws Exception{
      
      Connection conn = null;
      Context initContext = new InitialContext();
      Context envContext = (Context)initContext.lookup("java:/comp/env");
      DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
      conn = ds.getConnection();
      return conn;
   }
   //사용자 인증시 사용하는 메소드
   public int userCheck(String userid,String pwd) {
		int result=-1;
		String sql="select pwd from member where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getNString("pwd") != null && rs.getString("pwd").equals(pwd)){
					    result=1; //아이디 패스워드 일치
					}else {
						result=0; //아이디는 있지만 패스워드 불일치
					}
				}else {
					result=-1; //아이디 존재하지않음
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return result;
		}
   //아이디로 회원정보 가져오는 메소드
   public MemberVO getMember(String userid) {
		MemberVO mVo=null;
		String sql="select * from member where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mVo = new MemberVO(); 
				mVo.setName(rs.getString("name"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAdmin(rs.getInt("admin"));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return mVo;
	}
   /*중복확인
	해당 아이디가 있는지 없는지 확인하는 메소드 ( 1있음 ,-1없음 )*/
	public int confirmID(String userid) {
		System.out.println("confirmID dao");
		int result=-1;
		String sql="select userid from member where userid=?";
		Connection conn=null;
		//바인딩변수가 있으면 prepareStatement, 없으면 statement
		PreparedStatement pstmt=null;
		//아이디와 비번이 있는지 없는지 조회를 해가지고와 resultSet
		ResultSet rs=null;
		
		
		
		try {
			conn=getConnection();//오라클 11,localhost에 xe,scott1400 tiger가 연결되어있음
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=1; // 해당 id 사용불가 
			}else { 
				result=-1; // 해당 id 사용가능
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result; //다시 서블릿으로 결과값 들고가기
	}
    /*join 게시판에서 작성한 6개 회원 정보를 입력하는 메소드*/
	public int insertMember(MemberVO mVo) {
		int result=-1;//
		String sql="insert into member values(?,?,?,?,?,?)"; //바인딩변수
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mVo.getName());
            pstmt.setString(2, mVo.getUserid());
            pstmt.setString(3, mVo.getPwd());
            pstmt.setString(4, mVo.getEmail());
            pstmt.setString(5, mVo.getPhone());
            pstmt.setInt(6, mVo.getAdmin());
            
            result = pstmt.executeUpdate(); // 한행이 추가 되서 반환값이 (1)
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) 
					pstmt.close();
				if(conn != null) 
					conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	    // JoinServlet으로 이동!
	    return result;
	}
    /* 수정 게시판에서 작성한 내용(4개)항목을 수정하는 sql명령을 수행 */		
	 public int updateMember(MemberVO mVo) {
		 int result=-1;
		 Connection conn=null;
		 String sql="update member set pwd=?, email=?, phone=?, admin=? where userid=?";
		 PreparedStatement pstmt=null;
		 
		 try{
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, mVo.getPwd());
	            pstmt.setString(2, mVo.getEmail());
	            pstmt.setString(3, mVo.getPhone());
	            pstmt.setInt(4, mVo.getAdmin());
	            pstmt.setString(5, mVo.getUserid());
	 
	            result = pstmt.executeUpdate(); //수정한 행의 개수 반환 (1)
	            
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	            try{
	                if(pstmt != null) pstmt.close();
	                if(conn != null) conn.close();
	            }catch(Exception e){
	                e.printStackTrace();
	            }
	        }
	        
	        return result;
	 }
	
	
}
