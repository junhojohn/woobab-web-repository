<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao ���� �����ϱ�</title>
</head>
<body>
	<div id="map" style="width:100vw;height:100vh;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be563747fda0ec6ddacbb930f5089b3&libraries=services,clusterer,drawing"></script>
	
	<script>
	var keyword = '${ requestScope.location_search_keyword}'
	
	// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
	    };  
	
	// ������ �����մϴ�    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// ��� �˻� ��ü�� �����մϴ�
	var ps = new kakao.maps.services.Places(); 
	
	// Ű����� ��Ҹ� �˻��մϴ�
	ps.keywordSearch(keyword, placesSearchCB);
	
	// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
	        map.setBounds(bounds);
	    } 
	}
	
	// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function displayMarker(place) {
	    
	    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	</script>
</body>
</html>