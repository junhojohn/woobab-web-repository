<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8"/>
		<link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="../../../resources/css/testMapGeoLocation.css" type="text/css">
		<link rel="stylesheet" href="../../../resources/css/sweetalert2.min.css" type="text/css">
		<script type="text/javascript" src="../../../resources/js/jquery-1.7.1.min.js" ></script>
		<script type="text/javascript" src="../../../resources/js/jquery-ui-1.9.1.min.js" ></script> 
		<script type="text/javascript" src="../../../resources/js/sweetalert2.min.js" ></script>
		<!-- deploy용 카카오 맵 api 키 -->  
		<!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c653575481fafacddf8a4a01c8c4abb6&libraries=services,clusterer,drawing"></script>-->
		<!-- dev용 카카오 맵 api 키 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be563747fda0ec6ddacbb930f5089b3&libraries=services,clusterer,drawing"></script>
		
		<script>
			
			var latitude
			var longitude
			
			/*html 문서를 로드할 때*/
			$(document).ready(function(){
				// Geo Location 허용일 때는 띄우지 말아야 한다.
				createGPSConfirmModal()
			})
			
			function createGPSConfirmModal(){
				/*API DOCS: https://sweetalert2.github.io/*/
				/*DOWNLOAD: https://www.jsdelivr.com/package/npm/sweetalert2*/
				const swalWithBootstrapButtons = Swal.mixin({
					  customClass: {
					    confirmButton: 'btn btn-success',
					    cancelButton: 'btn btn-danger'
					  },
					  buttonsStyling: false
					})

					swalWithBootstrapButtons.fire({
					  title: 'GPS 설정하기',
					  text: "지금 내 위치 찾기를 설정하면 주변 카드 가맹점을 바로 볼 수 있어요!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonText: '네 설정할래요',
					  cancelButtonText: '그냥 둘러볼래요',
					  reverseButtons: false
					}).then((result) => {
					  if (result.value) {
						  init()
					  } else if (
					    /* Read more about handling dismissals below */
					    result.dismiss === Swal.DismissReason.cancel
					  ) {
						  loadMap(33.450701, 126.570667)
					  }
					})
					loadMap(33.450701, 126.570667)
					
			}
			
			/*맵을 로드한다.*/
			function loadMap(value01, value02) {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(value01, value02), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 				
			}
			
			function init(){
				
				var lat = 33.450701
				var lon = 126.570667 
				
				if (navigator.geolocation) {
				    navigator.geolocation.getCurrentPosition(
				        function(location){
				            //succ - 유저가 허용버튼을 클릭하여 값을 가져올 수 있는 상태
				            lat = location.coords.latitude;
				            lon = location.coords.longitude;
				            loadMap(lat, lon)
				        },
				        function(error){
				            //fail - 유저가 차단버튼을 클릭하여 값을 가져올 수 없는 상태
				        	loadMap(lat, lon)
				       }
				    );
				}
				else {
				    //fail - 애초에 GPS 정보를 사용할 수 없는 상태
		        	loadMap(lat, lon)
				}

			}
			
		</script>		
		<title>카드 가맹점 찾기-지도 펼쳐보기</title>
	</head>
	
	<body>
		
		<!-- 
		설명: 상단 네비게이션 바 표시 
		라이브러리: bootstrap.min.css 이용
		 -->
		<nav id="mainNavbar" class="navbar navbar-expand-lg navbar-dark bg-primary">
		  <a id="mainBrand" class="navbar-brand" href="#">카드 가맹점 찾기 서비스</a>
		</nav>
		
		<div id="map_wrap" class="map_wrap">
			<div id="map" class="map"></div>
			<div id="searchBox" class="searchBox">
				<input id="searchInput" class="searchInput" type="text" placeholder="우리 동네 혹은 가맹점을 검색해보세요.">
				<button id="searchButton" class="searchButton">검색</button>
			</div>			
		</div>	
		
		
		
	</body>
</html>