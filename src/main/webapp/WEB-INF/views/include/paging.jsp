
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

.bottom-section {
margin-top: 50px;
padding-bottom: 80px;

}
.bottom-section nav {
height: 27px;
margin-top: 50px;
width: 100%;
}
.bottom-section nav ul {
flex: 9;
display: flex;
justify-content: center;
}

.pagination-custom li {
display: inline-block;
vertical-align: middle;
height: 28px;
line-height: 28px;

color: #555555;
font-size: 12px;
padding: 0 10px;
}

.pagination-custom li.active a{
font-weight: bold;
color: #006633 !important;
text-decoration: underline;
}
.pagination-custom li:hover a {
text-decoration: underline;
}

</style>

<!-- 게시글 목록 하단 영역 -->
<div class="bottom-section">

    <!-- 페이지 버튼 영역 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination-lg pagination-custom">

            <c:if test="${pm.prev}">
                <li class="page-item">
                    <a class="page-link prevPage" href="?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">
                        <img src="/images/whats_new/notice/prev.png">
                    </a>
                </li>
            </c:if>

            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                <li data-page-num="${n}" class="page-item">
                    <a class="page-link page" href="?pageNum=${n}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">${n}</a>
                </li>
            </c:forEach>

            <c:if test="${pm.next}">
                <li class="page-item">
                    <a class="page-link nextPage" href="?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">
                        <img src="/images/whats_new/notice/next.png">
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<script type="text/javascript" defer>
    //현재 위치한 페이지에 active 스타일 부여하기

    // 현재 내가 보고 있는 페이지 넘버
    const curPageNum = '${pm.page.pageNum}';
    // console.log("현재페이지: ", curPageNum);

    // 페이지 li태그들을 전부 확인해서
    // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
    // li를 찾아서 class active 부여
    const $ul = document.querySelector('.pagination');

    for (let $li of [...$ul.children]) {
        if (curPageNum === $li.dataset.pageNum) {
            $li.classList.add('active');
            break;
        }
    }
    // 페이지 href 적용
    const prevPage = document.querySelector('.prevPage');
    const pages = document.querySelectorAll('.page');
    const nextPage = document.querySelector('.nextPage');
    if (prevPage){
        prevPage.setAttribute("href", href + prevPage.getAttribute("href") );
    }
    if(nextPage){
        nextPage.setAttribute("href", href + nextPage.getAttribute("href"));
    }
    for(let page of pages){
        page.setAttribute("href", href + page.getAttribute("href"));
    }

</script>
