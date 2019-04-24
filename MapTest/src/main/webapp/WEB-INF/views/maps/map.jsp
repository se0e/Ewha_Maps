<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=858d46e161319283ff802cc91ae88157&libraries=services"></script>
<style>
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
<div id="map" style="width:100%;height:350px;"></div>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=858d46e161319283ff802cc91ae88157">
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			var places = new daum.maps.services.Places();

			places.setMap(map);
			
			var geocoder = new daum.maps.services.Geocoder();

			var callback = function(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			        console.log(result);
			    }
			};

			geocoder.addressSearch('해남군 송지면', callback);
			
			var coord = new daum.maps.LatLng(37.56496830314491, 126.93990862062978);
			var callback = function(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			        console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
			    }
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new daum.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			    message += '경도는 ' + latlng.getLng() + ' 입니다';
			    
			    var resultDiv = document.getElementById('clickLatlng'); 
			    resultDiv.innerHTML = message;
			    
			});

			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title">' + 
			            '            카카오 스페이스닷원' + 
			            '            <div class="close" id="closeOverlay" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new daum.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});

			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			daum.maps.event.addListener(marker, 'click', function() {
			    overlay.setMap(map);
			});
			
			$("#closeOverlay").click(function(event) {
				event.preventDefault();
				overlay.setMap(null);  
			});

 			
/* 			var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
			var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
			var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
			var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
			var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {

			    // 마우스로 클릭한 위치입니다 
			    var clickPosition = mouseEvent.latLng;

			    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
			    if (!drawingFlag) {

			        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
			        drawingFlag = true;
			        
			        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
			        deleteClickLine();
			        
			        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
			        deleteDistnce();

			        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
			        deleteCircleDot();
			    
			        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
			        clickLine = new daum.maps.Polyline({
			            map: map, // 선을 표시할 지도입니다 
			            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다
			        });
			        
			        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
			        moveLine = new daum.maps.Polyline({
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다    
			        });
			    
			        // 클릭한 지점에 대한 정보를 지도에 표시합니다
			        displayCircleDot(clickPosition, 0);

			            
			    } else { // 선이 그려지고 있는 상태이면

			        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();

			        // 좌표 배열에 클릭한 위치를 추가합니다
			        path.push(clickPosition);
			        
			        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
			        clickLine.setPath(path);

			        var distance = Math.round(clickLine.getLength());
			        displayCircleDot(clickPosition, distance);
			    }
			});
			    
			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

			    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag){
			        
			        // 마우스 커서의 현재 위치를 얻어옵니다 
			        var mousePosition = mouseEvent.latLng; 

			        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			        
			        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
			        var movepath = [path[path.length-1], mousePosition];
			        moveLine.setPath(movepath);    
			        moveLine.setMap(map);
			        
			        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
			            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
			        
			        // 거리정보를 지도에 표시합니다
			        showDistance(content, mousePosition);   
			    }             
			});                 

			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

			    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag) {
			        
			        // 마우스무브로 그려진 선은 지도에서 제거합니다
			        moveLine.setMap(null);
			        moveLine = null;  
			        
			        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			    
			        // 선을 구성하는 좌표의 개수가 2개 이상이면
			        if (path.length > 1) {

			            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
			            if (dots[dots.length-1].distance) {
			                dots[dots.length-1].distance.setMap(null);
			                dots[dots.length-1].distance = null;    
			            }

			            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
			                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
			                
			            // 그려진 선의 거리정보를 지도에 표시합니다
			            showDistance(content, path[path.length-1]);  
			             
			        } else {

			            // 선을 구성하는 좌표의 개수가 1개 이하이면 
			            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
			            deleteClickLine();
			            deleteCircleDot(); 
			            deleteDistnce();

			        }
			        
			        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
			        drawingFlag = false;          
			    }  
			});    

			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
			    if (clickLine) {
			        clickLine.setMap(null);    
			        clickLine = null;        
			    }
			}

			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {
			    
			    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
			        
			        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			        distanceOverlay.setPosition(position);
			        distanceOverlay.setContent(content);
			        
			    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
			        
			        // 커스텀 오버레이를 생성하고 지도에 표시합니다
			        distanceOverlay = new daum.maps.CustomOverlay({
			            map: map, // 커스텀오버레이를 표시할 지도입니다
			            content: content,  // 커스텀오버레이에 표시할 내용입니다
			            position: position, // 커스텀오버레이를 표시할 위치입니다.
			            xAnchor: 0,
			            yAnchor: 0,
			            zIndex: 3  
			        });      
			    }
			}

			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce () {
			    if (distanceOverlay) {
			        distanceOverlay.setMap(null);
			        distanceOverlay = null;
			    }
			}

			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {

			    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			    var circleOverlay = new daum.maps.CustomOverlay({
			        content: '<span class="dot"></span>',
			        position: position,
			        zIndex: 1
			    });

			    // 지도에 표시합니다
			    circleOverlay.setMap(map);

			    if (distance > 0) {
			        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			        var distanceOverlay = new daum.maps.CustomOverlay({
			            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
			            position: position,
			            yAnchor: 1,
			            zIndex: 2
			        });

			        // 지도에 표시합니다
			        distanceOverlay.setMap(map);
			    }

			    // 배열에 추가합니다
			    dots.push({circle:circleOverlay, distance: distanceOverlay});
			}

			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
			    var i;

			    for ( i = 0; i < dots.length; i++ ){
			        if (dots[i].circle) { 
			            dots[i].circle.setMap(null);
			        }

			        if (dots[i].distance) {
			            dots[i].distance.setMap(null);
			        }
			    }

			    dots = [];
			}

			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {

			    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			    var walkkTime = distance / 67 | 0;
			    var walkHour = '', walkMin = '';

			    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			    if (walkkTime > 60) {
			        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			    }
			    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			    var bycicleTime = distance / 227 | 0;
			    var bycicleHour = '', bycicleMin = '';

			    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			    if (bycicleTime > 60) {
			        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
			    }
			    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

			    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			    var content = '<ul class="dotOverlay distanceInfo">';
			    content += '    <li>';
			    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			    content += '    </li>';
			    content += '    <li>';
			    content += '        <span class="label">도보</span>' + walkHour + walkMin;
			    content += '    </li>';
			    content += '    <li>';
			    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
			    content += '    </li>';
			    content += '</ul>'

			    return content;
			} */
		})
	</script>
</body>
</html>