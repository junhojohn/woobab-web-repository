<%@page import="com.woobab.consts.TEST_REQ_ACTION_ENUM"%>
<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../../resources/css/testMain.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=TEST_REQ_ACTION_ENUM.REQ_TEST_KAKAO_MAP.getRequestURI() %>", method="post">
		<div class="search-container">
	        <input type="text" name="<%= Const.LOC_SEARCH_KEYWORD%>" placeholder="우리 동네 맛있는 밥을 찾아보아요." class="search-input">
	        <a href="#" class="search-btn">
	                <i class="fas fa-search"></i>      
	        </a>		
	    </div>
	</form>
</body>
</html>