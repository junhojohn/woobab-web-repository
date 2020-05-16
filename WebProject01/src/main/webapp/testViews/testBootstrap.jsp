<%@page import="com.woobab.consts.TEST_REQ_ACTION_ENUM"%>
<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/css/testBootstrap.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	설명: 상단 네비게이션 바 표시 
	라이브러리: bootstrap.min.css 이용
	 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Features</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Pricing</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">About</a>
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
	</nav>
	
	<!-- 
	설명: 메인화면의 이미지와 이미지 위에 검색 창을 보여줌 
	라이브러리: testBootstrap.css 이용
	 -->	
	<div class="main-container">
		<img src="../resources/img/test_main_background.jpg" style="width:100vw;height:50vh;">
		<div class="sub-container">
			<form action="<%=TEST_REQ_ACTION_ENUM.REQ_TEST_KAKAO_MAP.getRequestURI() %>", method="post">
				<div class="search-container">
			        <input type="text" name="<%= Const.LOC_SEARCH_KEYWORD%>" placeholder="우리 동네 맛있는 밥을 찾아보아요." class="search-input">
			        <a href="#" class="search-btn">
			                <i class="fas fa-search"></i>      
			        </a>		
			    </div>
			</form>				
		</div>
	</div>
</body>
</html>