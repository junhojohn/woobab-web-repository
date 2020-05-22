<%@page import="com.woobab.consts.TEST_REQ_ACTION_ENUM"%>
<%@page import="com.woobab.consts.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/css/testMain02.css" type="text/css">
<link rel="stylesheet" href="../../resources/css/testSearchAddr.css" type="text/css">
<title>Insert title here</title>

<script type="text/javascript">
	function showSearchWrap(){
		var map_wrap = document.getElementById("map_wrap")
		map_wrap.style.display = 'block'
	}
	
	function hideSearchWrap(){
		var map_wrap = document.getElementById("map_wrap")
		map_wrap.style.display = 'none'		
	}
</script>
</head>
<body>
	<!-- 
	����: ��� �׺���̼� �� ǥ�� 
	���̺귯��: bootstrap.min.css �̿�
	 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="#">ī�� ������ ã�� ����</a>
	</nav>
	
	<!-- 
	����: ����ȭ���� �̹����� �̹��� ���� �˻� â�� ������ 
	���̺귯��: testBootstrap.css �̿�
	 -->	
	<div class="main-container">
		
		<div class="sub-container">
			<h1 class="mainText">ī�� ��� ����,</h1>
			<form class="form-inline my-2 my-lg-0" action="<%=TEST_REQ_ACTION_ENUM.REQ_TEST_KAKAO_MAP.getRequestURI() %>", method="post" style="padding-top:20px; padding-bottom:20px;">
		        <input autocomplete="off" class="form-control mr-sm-2" type="text" name="<%= Const.LOC_SEARCH_KEYWORD%>" placeholder="�츮 ���� Ȥ�� �������� ã�ƺ�����." style="width:800px; height:50px;">
			</form>
	        <button class="btn btn-primary" type="submit" style="width:400px; height:50px;">���� �� ��ġ�� ã���ּ���.</button>
			<button class="btn btn-secondary my-2 my-sm-0" type="submit" style="width:400px; height:50px;">�ǳʶٱ� ></button>							
		</div>
		<div class="map_wrap" id="map_wrap" style="display:none;">		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		            	<img class="search_back" src="../resources/img/test_search_back.png" onclick="hideSearchWrap()">
		                <form onsubmit="searchPlaces(); return false;">
		                    Ű���� : <input type="text" value="���¿� ����" id="keyword" size="15"> 
		                    <button type="submit">�˻��ϱ�</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be563747fda0ec6ddacbb930f5089b3&libraries=services,clusterer,drawing"></script>
	<script>
	// ��Ŀ�� ���� �迭�Դϴ�
	var markers = [];
	
	// ��� �˻� ��ü�� �����մϴ�
	var ps = new kakao.maps.services.Places();  
	
	
	// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('Ű���带 �Է����ּ���!');
	        return false;
	    }
	
	    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // ���������� �˻��� �Ϸ������
	        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
	        displayPlaces(data);
	
	        // ������ ��ȣ�� ǥ���մϴ�
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('�˻� ����� �������� �ʽ��ϴ�.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
	        return;
	
	    }
	}
	
	// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
	    removeAllChildNods(listEl);
	
	    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�
	
	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	        bounds.extend(placePosition);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	}
	
	// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
	        imageSize = new kakao.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	            offset: new kakao.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // ��Ŀ�� ��ġ
	            image: markerImage 
	        });
	
	    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
	
	    return marker;
	}
	
	// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // ������ �߰��� ��������ȣ�� �����մϴ�
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	 // �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	</script>	
</body>
</html>