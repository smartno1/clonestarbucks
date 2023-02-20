<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                  crossorigin="anonymous">
            <%@include file="../include/static-head.jsp" %>
            <title>드라이브 스루 | Starbucks Korea</title>

                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>

                <link rel="stylesheet" type="text/css" href="/css/store.css">
                <!-- 부트스트랩 아이콘 -->
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

                <!-- <script src="/js/drive.js" defer></script> -->




        </head>
        <body>
        <%@include file="../include/header.jsp"%>
        <div class="map_wrap">
        <div id="map" style="width:100%;height:100vh;"></div>
        </div>
        <jsp:include page="../include/footer.jsp"></jsp:include>
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88309d14c1b9cc591cb9410898d2903f&libraries=services">
            </script>

        <script>
            var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(35.566826, 126.9786567), // 지도의 중심좌표
                    level: 13 // 지도의 확대 레벨
                };

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();

            // 키워드로 장소를 검색합니다
            ps.keywordSearch('스타벅스 드라이브스루', placesSearchCB);

            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    
                        displayMarker(data);
                        

                }
            }



            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(places) {

                console.log(places);

                    var listEl = document.getElementById('placesList'),
                        menuEl = document.getElementById('menu_wrap'),
                        fragment = document.createDocumentFragment(),
                        bounds = new kakao.maps.LatLngBounds(),
                        listStr = '';

                for (var i = 0; i < places.length; i++) {
                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition,i);

                bounds.extend(placePosition);

                // 마커에 클릭이벤트를 등록합니다
                (function (marker, places) {
                kakao.maps.event.addListener(marker, 'click', function () {
                    displayInfowindow(marker, places);

                });
                })(marker, places[i]);

                }


            }


            function addMarker(position, idx, title) {
                var imageSrc = '/images/icon/pin_general_DT.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                    imageSize = new kakao.maps.Size(36, 57),  // 마커 이미지의 크기
                    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
                    marker = new kakao.maps.Marker({
                        position: position, // 마커의 위치
                        image: markerImage
                    });
                console.log("marker",marker);
                marker.setMap(map); // 지도 위에 마커를 표출합니다
                // markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                return marker;
            }

            function displayInfowindow(marker, places) {

                var content =
                    '<div class="map_marker_pop">' +
                    '<header>' + places.place_name.substr(5) + '</header>' +
                    ' <div class="close" onclick="infowindow.close()" title="닫기"></div>' +
                    '<article>' +
                    '<div class="map_marker_pop_inner">' +
                    '<div class="cont_wrap">';

                if (places.road_address_name) {
                    content += '<p class ="road_addr">' + places.road_address_name + '</p>'

                } else {
                    content += '<pclass ="jibun_addr">' + places.address_name + '</pclass>';
                }

                content +=
                    '<p class="tel">' + places.phone + '</p>' +
                    '<a class="btn_marker_detail" href="https://map.kakao.com/link/to/' + places.place_name + ',' + places.y + ',' + places.x + '" target="_blank">길찾기</a>' +
                    '</div>' +
                    '</div>' +
                    '</article>' +
                    '</div>';



                infowindow.setContent(content);
                infowindow.open(map, marker);
            }


        </script>






        </body>

        </html>