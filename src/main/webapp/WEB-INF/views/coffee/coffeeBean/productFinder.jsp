<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>커피 | Starbucks Korea</title>

    <style>
        .findWrap{
            width: 100%;
            letter-spacing: -0.5px;
        }
        .findHeader {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }
        .findHeader .container-name{
            /*margin-top: 120px;*/
            margin-bottom: 20px;
            width: 100%;
            height: 98px;
            background: #ffffff;
            position: relative;
        }
        .findHeader .container-name h2{
            font-size: 30px;
            font-weight: bold;
            padding-top: 30px;
        }
        .findHeader .container-name p {
            font-size: 16px;
            color: #666;
            padding-top: 20px;
        }
        .findHeader .nav .nav-ul{
            float: right;
            position: absolute;
            right: 0;
            top: 60px;
        }
        .findHeader .nav .nav-ul li{
            display: inline-block;
            height: 24px;
            line-height: 24px;
            font-size: 12px;
            color: #666666;
            vertical-align: middle;
        }
        .findHeader .nav .nav-ul li img {
            padding-top: 4px;
        }
        .findHeader .nav .nav-ul li > img{
            padding-top: 7px;
        }
        .findListWrap {
            width: 100%;
            height: 700px;
            overflow: hidden;
            position: relative;
            background: url("/images/coffee/bean/findWrap_bg.jpg") 50% 0;
        }
        .findListWrap .findList{
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;

        }
        .findListWrap .findList .findSections{
            width: inherit;
            position: absolute;
            transition: 1s;
        }
        .findListWrap .findList .findSection{
            width: 100%;
            max-width: 1100px;

            height: 469px;
            padding-top: 85px;
            position: absolute;

        }
        .findListWrap .findList .findSection > p{
            margin-bottom: 90px;
            position: relative;
            text-align: center;
        }
        .findListWrap .findList .findSection > p img {
            display: inline-block;
            vertical-align: top;
            width: 100%;
            max-width: 524px;
            cursor: pointer;
        }
        .findListWrap .findList .findSection > ul {
            position: absolute;
            top: 700px;
            width: 100%;
            max-width: 1100px;
            justify-content: center;
        }
        .findListWrap .findList .findSection > ul li {
            float: left;
            width: 100%;
            max-width: 22%;
            margin-right: 4%;
            position: relative;
        }
        .findListWrap .findList .findSection > ul li:last-child{
            margin-right: 0;
        }
        .findListWrap .findList .findSection > ul li img{
            width: 100%;
            max-width: 242px;
        }
        .findListWrap .findList .findSection > ul li p {
            padding-top: 15px;
            font-size: 14px;
            font-weight: bolder;
            text-align: center;
        }
        .findListWrap .findList .section2{
            top: 700px;
        }
        .findTaste2 li:first-child, .findTaste3 li:first-child{
           padding-left: 13%;
        }
        .findListWrap .findList .section3{
            top: 1400px;
        }
        .findListWrap .findList .section3 ul{

        }


    </style>
</head>
<body>
<div class="wrap">
<%@include file="../../include/header.jsp"%>
<main class="findWrap">
    <section class="findHeader">
        <div class="container-name">
            <h2>나와 어울리는 커피</h2>
            <p>여러분에게 잘 맞는 커피를 찾기 위한 3가지 질문입니다.</p>
            <nav class="nav">
                <ul class="nav-ul">
                    <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean/list" class="en">COFFEE</a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean/list">커피</a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean/productFinder">나와 어울리는 커피</a></li>
                </ul>
            </nav>
        </div>
    </section>
    <section class="findListWrap">
        <div class="findList">
            <div class="findSections">
                <div class="findSection section1">
                    <p class="find_con1">
                        <img src="/images/coffee/bean/taste_find_ttl1.png" alt="1. 어떤 풍미에 가장 끌리세요? 가장 좋아하는 음식을 생각해보세요. 그 음식의 어떤 풍미와 재료에 끌리나요?">
                    </p>
                    <ul class="findTaste1 clear-fix" data-tKind="flavor">
                        <li class="ft1_1">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste1_1.png" data-taste="salty" alt="">
                                </a>
                            </div>
                            <p>
                                짭잘한 맛
                            </p>
                        </li>
                        <li class="ft1_2">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste1_2.png" data-taste="fruit" alt="">
                                </a>
                            </div>
                            <p>
                                과일 맛
                            </p>
                        </li>
                        <li class="ft1_3">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste1_3.png" data-taste="nutty" alt="">
                                </a>
                            </div>
                            <p>
                                고소한 맛
                            </p>
                        </li>
                        <li class="ft1_4">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste1_4.png" data-taste="caramel" alt="">
                                </a>
                            </div>
                            <p>
                                달콤한(캐러멜) 맛
                            </p>
                        </li>
                    </ul>
                </div>
                <div class="findSection section2">
                    <p class="find_con2">
                        <img src="/images/coffee/bean/taste_find_ttl2.png" alt="2. 어떤 느낌을 가장 좋아하세요? 느낌이란 커피가 혀와 입천장에 닿았을 때 느껴지는 감각을 의미합니다.">
                    </p>
                    <ul class="findTaste2" data-tkind="feel">
                        <li class="ft2_1">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste2_1.png" data-taste="refresh" alt="">
                                </a>
                            </div>
                            <p>
                                상쾌한 느낌
                            </p>
                        </li>
                        <li class="ft2_2">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste2_2.png" data-taste="soft" alt="">
                                </a>
                            </div>
                            <p>
                                부드러운 느낌
                            </p>
                        </li>
                        <li class="ft2_3">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste2_3.png" data-taste="longLasting" alt="">
                                </a>
                            </div>
                            <p>
                                오랫동안 여운이 남는 느낌
                            </p>
                        </li>
                    </ul>
                </div>
                <div class="findSection section3">
                    <p class="find_con3">
                        <img src="/images/coffee/bean/taste_find_ttl3.png" alt="3. 어느 정도의 강도를 원하세요? 강도란 커피의 로스트와 풍미의 정도를 말합니다">
                    </p>
                    <ul class="findTaste3" data-tkind="degree">
                        <li class="ft3_1">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste3_1.png" data-taste="gentle" alt="">
                                </a>
                            </div>
                            <p>
                                은은하고 부드러움
                            </p>
                        </li>
                        <li class="ft3_2">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste3_2.png" data-taste="medium" alt="">
                                </a>
                            </div>
                            <p>
                                미디업으로 균형 잡힘
                            </p>
                        </li>
                        <li class="ft3_3">
                            <div>
                                <a href="javascript:void(0)">
                                    <img src="/images/coffee/bean/taste3_3.png" data-taste="strong" alt="">
                                </a>
                            </div>
                            <p>
                                무게감을 주는 강렬함
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="input">
        <input type="hidden" name="flavor">
        <input type="hidden" name="feel">
        <input type="hidden" name="degree">
    </section>
</main>
<%@include file="../../include/footer.jsp"%>
</div>

<script>
    const taste = [];

    function defaultSlide() {
        const $ul1 = document.querySelector('.findTaste1');
        const $se = document.querySelector('.findSections');
        $ul1.style.transition="1.5s ease 0.5s";
        $ul1.style.top = "347px";
        $ul1.style.transition = "0";
        $se.style.top = "0";
    }

    function slide(){
        document.querySelector('.findList').addEventListener('click', e => {
            if(!e.target.matches('.findSection ul li img')) return;
            console.log(e.target);
            const value = e.target.dataset.taste;
            const $tkind = e.target.parentElement.parentElement.parentElement.parentElement;
            console.log($tkind.dataset.tkind);
            const $section = document.querySelector('.findSections');
            if($tkind.dataset.tkind === 'flavor'){
                console.log("flavor")
                taste.push(value);
                const $nexttkind = $tkind.parentElement.nextElementSibling;
                $nexttkind.lastElementChild.style.transition = "1.5s ease 0.5s";
                $nexttkind.lastElementChild.style.top = "347px";
                $nexttkind.lastElementChild.style.transition = "0";
                $section.style.top = "-700px";
            }
            if($tkind.dataset.tkind === 'feel'){
                taste.push(value)
                const $nexttkind = $tkind.parentElement.nextElementSibling;
                console.log($nexttkind);
                $nexttkind.lastElementChild.style.transition = "1.5s ease 0.5s";
                $nexttkind.lastElementChild.style.top = "347px";
                $nexttkind.lastElementChild.style.transition = "0";
                $section.style.top = "-1400px";
            }
            if($tkind.dataset.tkind === 'degree'){
                taste.push(value);

                location.href = "/coffee/bean/findDone?flavor="+taste[0]+"&feel="+taste[1]+"&degree="+taste[2];
            }
        })
    }

    (function (){
        defaultSlide();
        slide();
    })();
</script>
</body>
</html>
