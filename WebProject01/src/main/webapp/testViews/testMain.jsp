<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../../resources/css/locationMainSearchBar.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<form action="/testKakaoMap.test", method="post">
		<div class="search-container">
	        <input type="text" name="location_search_keyword" placeholder="우리 동네 맛있는 밥을 찾아보아요." class="search-input">
	        <a href="#" class="search-btn">
	                <i class="fas fa-search"></i>      
	        </a>		
	    </div>
	</form>
</body>
</html>