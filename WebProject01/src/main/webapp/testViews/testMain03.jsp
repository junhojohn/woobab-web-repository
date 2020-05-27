<%@page import="com.woobab.consts.TEST_REQ_ACTION_ENUM"%>
<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8"/>
		<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="../../resources/css/testMain03.css" type="text/css">
		<title>카드 가맹점 찾기</title>
	</head>

	<body>
		<section id="mainViewport" class="viewport">
			<header id="mainHeader" class="header body-header">
				
				<!-- 
				설명: 상단 네비게이션 바 표시 
				라이브러리: bootstrap.min.css 이용
				 -->
				<nav id="mainNavbar" class="navbar navbar-expand-lg navbar-dark bg-primary">
				  <a id="mainBrand" class="navbar-brand" href="#">카드 가맹점 찾기 서비스</a>
				</nav>
				
				<!-- 메인 section -->
				<section id="mainTitleSection" class="mainTitleSection">
					<h1 id="mainTitle01" class="mainTitle01">카드 사용 전에,</h1>
					<br>
					<h1 id="mainTitle02" class="mainTitle02">우리동네 또는 가맹점을 찾아보세요!</h1>
					<br>
					<form id="gotoMapForm" class="form-inline my-2 my-lg-0" action="<%=TEST_REQ_ACTION_ENUM.REQ_TEST_MAP.getRequestURI() %>", method="post">
			        	<button id="buttonFindCurrentLocation" class="btn btn-primary" type="submit" name="<%= Const.LOC_SEARCH_KEYWORD%>" value="">지금 내 위치를 찾아주세요.</button>
			        	<button id="buttonGotoMap" class="btn btn-secondary my-2 my-sm-0" type="submit" name="<%= Const.LOC_SEARCH_KEYWORD%>" value="">지도 바로보기 ></button>
					</form>
				</section>
				
			</header>
		</section>
	</body>

</html>