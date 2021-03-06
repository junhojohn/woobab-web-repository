<%@page import="com.woobab.consts.TEST_REQ_ACTION_ENUM"%>
<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8"/>
		
		<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="../../resources/css/testMap.css" type="text/css">
		<link rel="stylesheet" href="../../resources/css/testMain04.css" type="text/css">

		<!-- SPA(Single Page Application) 적용 중. -->		
		<script type="text/javascript">
			function showMainMap(){
				var mapDiv = document.getElementById("map")
				mapDiv.style.display = 'block'
				var mainTitleDiv = document.getElementById("mainTitleDiv")
				mainTitleDiv.style.display = "none"
			}
			
			function hideMainMap(){
				var mapDiv = document.getElementById("map")
				mapDiv.style.display = 'none'
				var mainTitleDiv = document.getElementById("mainTitleDiv")
				mainTitleDiv.style.display = "block"				
			}
		</script>
		
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
					<div id="mainTitleDiv" class="mainTitleDiv">
						<h1 id="mainTitle01" class="mainTitle01">카드 사용 전에,</h1>
						<br>
						<h1 id="mainTitle02" class="mainTitle02">우리동네 또는 가맹점을 찾아보세요!</h1>
						<br>
			        	<button id="buttonFindCurrentLocation" class="btn btn-primary" type="submit" onclick="showMainMap()">지금 내 위치를 찾아주세요.</button>
			        	<button id="buttonGotoMap" class="btn btn-secondary my-2 my-sm-0" type="submit" onclick="showMainMap()">지도 바로보기 ></button>					
					</div>

					<!-- 지도 section -->
					<!-- 지금 내 위치를 찾아주세요 혹은 지도 바로보기 버튼 클릭 시, 메인 section이 사라지고, 지도 section이 표시된다. -->
					<!-- SPA(Single Page Application 적용 중. -->
					<div id="map"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be563747fda0ec6ddacbb930f5089b3&libraries=services,clusterer,drawing"></script>
					<script>
						var keyword = '양재동 맛집'
						
						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new kakao.maps.InfoWindow({zIndex:1});
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places(); 
						
						// 키워드로 장소를 검색합니다
						ps.keywordSearch(keyword, placesSearchCB);
						
						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB (data, status, pagination) {
						    if (status === kakao.maps.services.Status.OK) {
						
						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        var bounds = new kakao.maps.LatLngBounds();
						
						        for (var i=0; i<data.length; i++) {
						            displayMarker(data[i]);    
						            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						        }       
						
						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						        map.setBounds(bounds);
						    } 
						}
						
						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(place) {
						    
						    // 마커를 생성하고 지도에 표시합니다
						    var marker = new kakao.maps.Marker({
						        map: map,
						        position: new kakao.maps.LatLng(place.y, place.x) 
						    });
						
						    // 마커에 클릭이벤트를 등록합니다
						    kakao.maps.event.addListener(marker, 'click', function() {
						        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
						        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
						        infowindow.open(map, marker);
						    });
						}
					</script>						
				</section>
				
			</header>
		</section>
	</body>

</html>