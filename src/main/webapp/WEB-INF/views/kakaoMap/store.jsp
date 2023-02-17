<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>


            <%@include file="../include/static-head.jsp" %>


                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>

                <link rel="stylesheet" type="text/css" href="/css/store.css">
                <!-- 부트스트랩 아이콘 -->
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

                <!-- <script src="/js/store.js" defer></script> -->




        </head>

        <body>

            <jsp:include page="../include/header.jsp"></jsp:include>

            <div class="map_wrap">
                <!-- 지도를 표시할 div 입니다 -->
                <div id="map">
                </div>










                <section class="find_store_wrap">

                    <div class="find_store_cont" class="bg_white">
                        <div id="menu_wrap">
                            <header class="find_store_header active">
                                <h2 class="btn_find_store"><a href="javascript:void(0);">매장찾기</a></h2>
                            </header>
                            <article class="search bg_white">
                                <div class="quick_search">
                                    <div class="quick_search_inner">
                                        <input placeholder="매장명 또는 주소" title="퀵 검색" type="text" name="keyword"
                                            id="keyword">
                                        <a href="javascript:void(0);" class="quickSearchBtn"><i
                                                class="bi bi-search"></i></a>
                                    </div>
                                </div>


                                <div class="search_count">
                                    검색결과 없음
                                </div>
                                <article>
                                    <ul id="placesList"></ul>
                                    <div id="pagination"></div>
                                </article>
                            </article>


                            <!-- <header id="find_road_warp">
                                <div clas="find_road_header">
                                    <h2 class="btn_road_store"><a href="javascript:void(0);">길찾기</a></h2>
                                </div>

                            </header>
                            <article class="">


                            </article> -->


                        </div>


                    </div>

                </section>

                <!-- <jsp:include page="../include/footer.jsp"></jsp:include> -->


            </div>

            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88309d14c1b9cc591cb9410898d2903f&libraries=services">
                </script>
            <script>

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                        level: 2 // 지도의 확대 레벨
                    };


                // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });



                // 마커를 담을 배열입니다
                var markers = [];




                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 장소 검색 객체를 생성합니다
                var ps = new kakao.maps.services.Places();




                // 키워드로 장소를 검색합니다
                searchPlaces();


                // 키워드 검색을 요청하는 함수입니다
                function searchPlaces() {



                    var keyword = document.getElementById('keyword').value;



                    if (!keyword) {

                        keyword = "서울특별시청";
                    }




                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                        alert('매장명 또는 주소');
                        return false;
                    }

                    keyword += " 스타벅스";

                    console.log("키워드 : " + keyword);


                    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                    ps.keywordSearch(keyword, placesSearchCB);
                }

                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                function placesSearchCB(data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {

                        // 정상적으로 검색이 완료됐으면
                        // 검색 목록과 마커를 표출합니다
                        displayPlaces(data);


                        // 페이지 번호를 표출합니다
                        displayPagination(pagination);

                    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                        alert('검색 결과가 존재하지 않습니다.');
                        return;

                    } else if (status === kakao.maps.services.Status.ERROR) {

                        alert('검색 결과 중 오류가 발생했습니다.');
                        return;

                    }
                }

                // 검색 결과 목록과 마커를 표출하는 함수입니다
                function displayPlaces(places) {



                    var listEl = document.getElementById('placesList'),
                        menuEl = document.getElementById('menu_wrap'),
                        fragment = document.createDocumentFragment(),
                        bounds = new kakao.maps.LatLngBounds(),
                        listStr = '';

                    // 검색 결과 목록에 추가된 항목들을 제거합니다
                    removeAllChildNods(listEl);

                    // 지도에 표시되고 있는 마커를 제거합니다
                    removeMarker();

                    for (var i = 0; i < places.length; i++) {
       

                        // 마커를 생성하고 지도에 표시합니다
                        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                            marker = addMarker(placePosition, i),
                            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다

                        bounds.extend(placePosition);

                        // 마커와 검색결과 항목에 mouseover 했을때
                        // 해당 장소에 인포윈도우에 장소명을 표시합니다
                        // mouseout 했을 때는 인포윈도우를 닫습니다
                        (function (marker, places) {
                            kakao.maps.event.addListener(marker, 'click', function () {
                                displayInfowindow(marker, places);

                            });

                            // kakao.maps.event.addListener(marker, 'mouseout', function () {
                            //     infowindow.close();
                            // });

                            itemEl.onclick = function () {
                                
                                //지도 범위 재설정
                                panTo(marker.getPosition());
                                //정보창 호출
                                displayInfowindow(marker, places);
                            };

                            // itemEl.onmouseout = function () {
                            //     infowindow.close();
                            // };
                        })(marker, places[i]);


                        fragment.appendChild(itemEl);
                    }

                    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                    listEl.appendChild(fragment);
                    menuEl.scrollTop = 0;

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                }

                // 검색결과 항목을 Element로 반환하는 함수입니다
                function getListItem(index, places) {

                    var el = document.createElement('li'),
                        itemStr = '<span class="markerbg marker"></span>' +
                            '<div class="info">' +
                            '   <h5>' + places.place_name.substr(5) + '</h5>';

                    if (places.road_address_name) {
                        itemStr += '    <p class ="road gray">' + places.road_address_name + '</p>'
                        // +'   <span class="jibun gray">' + places.address_name + '</span>';
                    } else {
                        itemStr += '    <p>' + places.address_name + '</p>';
                    }

                    itemStr += '  <p class="tel">' + places.phone + '</p>' +
                        '</div>';

                    el.innerHTML = itemStr;
                    el.className = 'item';

                    return el;
                }

                //지도이동
                function panTo(moveLatLon) {
                    // 이동할 위도 경도 위치를 생성합니다 

                    // 지도 중심을 부드럽게 이동시킵니다
                    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
                    map.panTo(moveLatLon);            
                }        

                // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                function addMarker(position, idx, title) {
                    var imageSrc = '/images/icon/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                        imageSize = new kakao.maps.Size(36, 57),  // 마커 이미지의 크기
                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
                        marker = new kakao.maps.Marker({
                            position: position, // 마커의 위치
                            image: markerImage
                        });

                    marker.setMap(map); // 지도 위에 마커를 표출합니다
                    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                    return marker;
                }

                // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                function removeMarker() {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(null);
                    }
                    markers = [];
                }

                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                function displayPagination(pagination) {


                    document.querySelector(".search_count").innerHTML = "(검색 결과 " + pagination.totalCount + "개)";


                    var paginationEl = document.getElementById('pagination'),
                        fragment = document.createDocumentFragment(),
                        i;

                    // 기존에 추가된 페이지번호를 삭제합니다
                    while (paginationEl.hasChildNodes()) {
                        paginationEl.removeChild(paginationEl.lastChild);
                    }

                    for (i = 1; i <= pagination.last; i++) {
                        var el = document.createElement('a');
                        el.href = "#";
                        el.innerHTML = i;

                        if (i === pagination.current) {
                            el.className = 'on';
                        } else {
                            el.onclick = (function (i) {
                                return function () {
                                    pagination.gotoPage(i);
                                }
                            })(i);
                        }

                        fragment.appendChild(el);
                    }
                    paginationEl.appendChild(fragment);
                }

                // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                // 인포윈도우에 장소명을 표시합니다
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



                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                function removeAllChildNods(el) {
                    while (el.hasChildNodes()) {
                        el.removeChild(el.lastChild);
                    }

                }

            </script>
            <script>


                // // 검색버튼 이벤트
                $(".quickSearchBtn").click(function () {
                    searchPlaces();
                }
                );



                $("#keyword").keyup(function (key) {
                    if (key.keyCode === 13) {
                        searchPlaces();
                    }
                });



            </script>
        </body>

        </html>