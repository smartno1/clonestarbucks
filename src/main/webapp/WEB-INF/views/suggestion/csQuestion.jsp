<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <%--헤더 잡코딩--%>
        <%@include file="../include/static-head.jsp"%>
        <title>마이 스타벅스 | Starbucks Korea</title>
        <%--마이페이지 CSS--%>
        <link rel="stylesheet" type="text/css" href="/css/voc_Q.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div class="all-mo"> <%-- 바디 전체틀 --%>
                <div class="toptittle"><%-- 머리글 --%>
                    <div class="ms_sub_tit_inner">
                        <h4><img alt="고객의 소리" src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png"></h4>
                        <ul class="smap">
                            <li><a href="/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="하위메뉴"></li>
                            <li><a href="/my/index.do">My Starbucks</a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="하위메뉴"></li>
                            <li><a href="/my/vocList.do"><span class="kor">참여 현황</span></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="하위메뉴"></li>
                            <li><a href="/my/vocList.do"><span class="kor">고객의 소리</span></a></li>
                        </ul>
                    </div>
                    <div class="body-box"><%--body-box--%>
                        <nav class="ms_nav" id="msRnb">
                            <ul>
                                <li class="msRnb_btn"><a href="/util/faq.do">자주 하는 질문</a></li> <!-- 20210809 수정 -->
                                <li class="msRnb_btn"><a href="/customer/suggestionWrite.do">고객의 소리</a></li>
                                <li class="msRnb_btn"><a href="/util/storecareList.do">스토어 케어</a></li>
                                <li><a href="javascript:void(0);">스타벅스 이용 팁<span class="sbox_arrow_down"></span></a>
                                    <ul>
                                        <li><a href="/util/web_tip.do">· 홈페이지 이용 팁</a></li>
                                        <li><a href="/util/app_tip.do">· 애플리케이션 이용 팁</a></li>
                                        <li><a href="/util/partnership_card.do">· 제휴카드 안내</a></li>
                                    </ul></li>
                                <li class="msRnb_btn"><a href="/util/online_survey.do">고객 경험 설문조사</a></li> <!-- 20210811 수정 -->


                            </ul>
                        </nav>
                        <div class="voc_top_bg">
                            <!-- s: 고객의 소리 개선 220615 -->
                            <div class="voc_top_txt">
                                <p class="pc_txt"><b>스타벅스는 고객님의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.<br>이용하시면서 불편한 점이나 개선이 필요한 점이 있다면 알려주세요. 좀 더 나은 서비스로 보답하겠습니다.</b></p><!-- 문구 수정 220830 -->

                                <ul>
                                    <li><span>전화상담(1522-3232) : 365일, 07:00~22:00</span></li>
                                    <!-- <li><span>고객의 소리 : 365일, 09:00~18:00</span></li> 삭제 220830 -->
                                    <li class="description">※ 답변완료 시, APP PUSH로 알려드립니다.</li>
                                </ul>
                            </div>
                            <a class="btn_ask_list" href="/suggestion/vocList">나의 문의 내역 보기</a>
                        </div>
                        <div class="cheak-box">
                            <div class="voc_input_tbl">
                                <p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
                                <form id="voc_form" action="/suggestion/insert" method="post">
                                    <table >
                                    <!-- 항목명 수정 220615 -->
                                    <caption>문의분류, 답변 받으실 메일, 연락처, 장소, 제목, 내용, 파일첨부에 대한 테이블</caption>
                                    <colgroup>
                                        <col width="200">
                                        <col width="630">
                                    </colgroup>
                                    <tbody>

<%--                                    <tr id="trProd" style="display:none;">--%>
<%--                                        <th scope="row">제품/상품</th>--%>
<%--                                        <td>--%>

<%--                                            <div class="prod_section">--%>

<%--                                                <div class="prod_wrap" id="prod_wrap1">--%>
<%--                                                    <div class="input_wrap"><input class="voc_prod_input" readonly="" type="text" id="NM_GOODS1"></div><!--  고객의 소리 개선 220615 -->--%>
<%--                                                    <div class="voc_prod_btn">--%>
<%--                                                        <input class="voc_prod_input_btn" type="button" value="상품찾기" idx="1"><!-- 고객의 소리 개선 수정 220830 스크립트에서 수정 필요 -->--%>
<%--                                                        <input class="voc_prod_input_hidden" type="hidden" name="CD_GOODS" id="CD_GOODS1">--%>
<%--                                                    </div>--%>
<%--                                                    <!-- <a class="prod_add" href="javascript:void(0);" onClick="$voc.prodInsert(); return false;">더하기 </a> 고객의 소리 개선 수정 220830 스크립트에서 삭제 필요 -->--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                    <tr style="display:none;">--%>
<%--                                        <th scope="row">답변 알림 서비스<img alt="필수입력" src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"></th>--%>
<%--                                        <td>--%>
<%--                                            <div class="tbl_radio_wrap">--%>
<%--                                                <input id="TP_CSTMR_RPLY1" name="TP_CSTMR_RPLY" type="radio" value="N">--%>
<%--                                                <label for="TP_CSTMR_RPLY1">받지 않음</label>--%>
<%--                                                <input id="TP_CSTMR_RPLY2" name="TP_CSTMR_RPLY" type="radio" value="Y" checked="checked">--%>
<%--                                                <label for="TP_CSTMR_RPLY2">받음 (APP Push)</label>--%>
<%--                                            </div>--%>

<%--                                        </td>--%>
<%--                                    </tr>--%>
                                    <!-- 고객의 소리 개선 수정 220830 휴대폰 추가 -->
                                    <tr class="trCellphone">
                                        <th scope="row">휴대폰<img alt="필수입력" src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <p class="phone_sel_wrap">
                                                    <label for="phone1">010</label>
                                                    <select id="phone1" name="phone1" required>
                                                        <option value="010" selected="">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option></select>
                                                </p>
                                                <p class="cell_hyphen">-</p>
                                                <input class="cellphone_input"  id="phone2" name="phone2" type="text" maxlength="4" ref="num" value="" onkeyup="this.value = numberCheck(this);">
                                                <p class="cell_hyphen">-</p>
                                                <input class="cellphone_input"  id="phone3" name="phone3" type="text" maxlength="4" ref="num" value="" onkeyup="this.value = numberCheck(this);">
                                            </div>
                                            <p class="description">입력된 연락처를 우선으로 고객센터(또는 매장)에서 연락드릴 수 있습니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제목<img alt="필수입력" src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input class="voc_ttl_input1" id="voc_title" name="title" value="" type="text" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;"> <!--  style="width:514px"> -->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">내용<img alt="필수입력" src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"></th>
                                        <td>
                                            <!-- <textarea id="DS_VOC_CN" name="DS_VOC_CN"  style="height:200px"></textarea> -->
                                            <textarea class="textArea" id="voc_context" name="context" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" required placeholder="관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보 보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다."></textarea>
                                            <br><span id="realByte">0 / 2500byte</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                            <div class="voc_info_input_guide">
                                <ul>
                                    <!-- <li>본 고객의 소리는 e-mail을 통한 상담으로만 진행됩니다. 전화 상담 요청은 불가하오니 양해 부탁 드립니다.</li> 고객의 소리 개선, 항목 삭제 220615 -->
                                    <li>
                                        고객의 소리 민원 처리를 위해 고객님의 연락처로 고객센터(또는 매장)에서 연락드릴 수 있습니다.<!-- 220811 문구 수정 -->
                                    </li>
                                    <!-- <li>답변은 직접 기재하여 주신 메일주소로 발송되며, 기재 오류 및 계정문제가 발생한 경우에는 답변이 불가할 수 있으므로 메일 주소를 꼭 확인해 주시기 바랍니다.</li> 고객의 소리 개선, 항목 삭제 220615 -->
                                    <li>관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다.</li>
                                    <li>공정거래위원회에서 고시한 소비자분쟁해결기준에 의거 소비자 피해에 대한 교환/환불 처리 해드립니다.</li>
                                </ul>
                            </div>
                            <div class="voc_info_input_btns">
                                <ul>
                                    <li class="voc_info_input_btn1"><a href="#none" onclick="voc_submit();" >고객의 소리 등록 하기</a></li>
                                    <!-- <li class="voc_info_input_btn2"><a href="#n" onclick="$voc.cancel(); return false;">취소</a></li> -->
                                </ul>
                            </div>

                        </div>
                    </div><%--body-box end--%>

                    </div>

                </div><%-- 머리글 Rmx--%>



            </div><%-- 바디 전체틀 끝--%>





        </div>
        <%--바디 내용끝--%>






        <%--푸터 내용시작--%>

<div class="foodboot_end">
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div><%--푸터 내용끝--%>

        <%--자바스크릡트 공간입니다.--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var error = "${error}";
            var msg = "error is " + error;
            if (error) {
                alert(msg);
            }
        });
        function numberCheck(e){
            console.info("e : ", e.value)
            console.info("e : ", e.value.replace(/[^0-9]/g,''))
           return e.value.replace(/[^0-9]/g,'');

        }


        function voc_submit(){
            const $form = document.getElementById('voc_form');
            const phone1 = document.getElementById('phone1');
            const phone2 = document.getElementById('phone2');
            const phone3 = document.getElementById('phone3');
            const title = document.getElementById('voc_title');
            const context = document.getElementById('voc_context');
            const input = [phone1.value, phone2.value, phone3.value, title.value, context.value]

            console.info("input : ", input);

            if(input.indexOf("") > -1){
                alert("필수 입력 사항을 확인하세요.")
                return;
            }else{
                $form.submit();
            }


        }

        (function (){

        })();

    </script>


    </body>

</html>