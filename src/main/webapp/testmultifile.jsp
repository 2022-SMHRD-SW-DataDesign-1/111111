
<%@page import="com.smhrd.model.FollowDTO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.PolicyDAO"%>
<%@page import="com.smhrd.model.PolicyDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.smhrd.model.CommentDTO"%>
<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.FollowDAO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
</style>
<body>
	<%int count = 0; %>
	<form action="BoardService"  enctype="multipart/form-data"  method="post" id="filelist">
		test 글 내용 작성 : <textarea  rows="10" style="resize: none;" name="content"></textarea><br><!-- 글 작성 --> 
		<input type="submit" value="test글 작성"><!-- 글 작성 -->
		<input  type="file" style="float: right;" name="filename<%=count%>" ><!-- 파일 경로..?넣기  --> 
	</form>
		<input type="submit" value="+" onclick="addbtn()"><br><!-- 파일경로 추가해주는 버튼  -->
	
		<%count++; %>
	<script type="text/javascript">
		function addbtn(){
			$("#filelist").append("<input  type='file' style='float: right;' name='filename<%=count%>' multiple>")
		}
	</script>
	
	
	
	
	
<!-- 카카오 로그인 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>



<!-- 네이버 로그인 api  -->
<!-- //네이버 로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>


<!-- 네이버아디디로로그인 초기화 Script -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("n2hM2OM8Nq0pdDU9ufkL", "http://localhost:8081/dirverR/naverLogin.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8081/dirverR/testmultifile.jsp");
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
</html>








			<!-- 여기부터 카카오 로그인 script  -->
<script>
Kakao.init('10f8004f601643f56798d54c5fc82e6e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
			//카카오로그인
			let m_Phone = "0000";
			let m_Pw = "0000";
			function kakaoLogin() {
			    Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  console.log(response)
			        	  console.log(response.id)
			        	  console.log(m_Pw)
			        	  console.log(response.kakao_account.email)
			        	  console.log(response.properties.nickname)
			        	  console.log(m_Phone)
			        	  
			        	   $.ajax({
			        		   url : "KakaoService",    
			        		   type: "post",
			        		        
			        		        data :{
					        		       	"m_id": response.id,
					        		       	"m_pw": m_Pw,
					        		       	"m_email": response.kakao_account.email,
					        		       	"m_nickname": response.properties.nickname,
					        		       	"m_Phone": m_Phone
			        		        },
			        		        success : function (data){
			        		        	console.log(data);
			        		        },
			        		})
			        	  
			          },
			          fail: function (error) {
			           	console.log(error)
			          },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      },
			    })
			  }
			
			
			//카카오로그아웃  
			function kakaoLogout() {
			    if (Kakao.Auth.getAccessToken()) {
			      Kakao.API.request({
			        url: '/v1/user/unlink',
			        success: function (response) {
			        	console.log(response)
			        },
			        fail: function (error) {
			          console.log(error)
			        },
			      })
			      Kakao.Auth.setAccessToken(undefined)
			    }
			  }  
</script>

	
	
</body>
</html>