<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script>
			function init()
			{
			    window.navigator.geolocation.getCurrentPosition(current_position);
			}
			 
			function current_position(position)
			{
			    var msg;
			    
			    msg = "Latitude: " + position.coords.latitude + ", " + "Longitude: " + position.coords.longitude;
			    
			    alert(msg);
			}
			 
			window.addEventListener("load", init);
		 
		</script>
		
		<title>Geolocation API 테스트</title>
	
	</head>

	<body>
	
	</body>
</html>