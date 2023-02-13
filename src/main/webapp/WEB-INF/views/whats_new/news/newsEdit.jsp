<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>뉴스 | Starbucks Korea</title>

    <style>
        /*상위부분 및 검색창   */
        .main{
            position:relative;
            width:100%;
            max-width:1100px;
            margin: 0 auto;
        }
        .top-section{
            margin-bottom: 20px;
        }
        .top-section h2{
            font-size: 30px;
            font-weight: bold;
            padding-top: 30px;
        }
        .nav {
            position: relative;
            padding-bottom: 20px;
        }
        ul.nav-ul{
            float: right;
        }
        .nav-ul li{
            display: inline-block;
            height: 24px;
            line-height: 24px;
            font-size: 12px;
            color: #666666;
            vertical-align: middle;
        }
        .nav-ul li img {
            padding-top: 4px;
        }
        .nav-ul li:nth-child(2) img, .nav-ul li:nth-child(4) img{
            padding-top: 7px;
        }

        /* 게시글  */
        .middle-section .title{
            position: relative;
            border-top: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            padding: 20px 140px 20px 20px;
            margin-bottom: 20px;
        }
        .middle-section .title input{
            font-size: 18px;
            font-weight: bold;
            color: #222222;
            width: 80%;
        }
        .listImg {
            border-bottom: 1px solid #dddddd;
            margin-bottom: 20px;
        }
        .listImg p {
            margin: 20px 0;
        }
        .listImg p input{
            width: 80%;
        }
        .kind{
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #dddddd;
        }
        .kind p, #kind{
            margin-right: 20px;
            display: inline-block;
        }
        .content {
            padding: 30px 10px;
            border-bottom: 1px solid #dddddd;
            font-size: 14px;
        }
        .content textarea{
            width: 100%;
            height: fit-content;
            min-height: 300px;
            resize: none;
        }
        .attachList p .add{
            vertical-align: text-bottom;
            cursor: pointer;
        }
        .attachList p {
            margin: 20px 0;
        }
        .attachList input{
            display: inline-block;
            margin: 10px 0;
            width: 80%;
        }
        .attachList span{
            cursor: pointer;
        }
        /*버튼 ------------------------------------------*/
        .button{
            position: relative;
            margin-bottom: 50px;
        }
        .pre-view,
        .cancel,
        .submit{
            float: right;
            width: 8%;
            height: 45px;
            position: relative;
            margin-top: 20px;
            margin-left: 10px;
        }
        .pre-view div,
        .cancel div,
        .submit div{
            display: block;
            font-size: 14px;
            border-radius: 3px;
            background-color: #666666;
            color: #fff;
            font-weight: bold;
            text-align: center;
            height: 45px;
            line-height: 45px;
        }
        .pre-view div:hover,
        .cancel div:hover,
        .submit div:hover{
            cursor: pointer;
            text-decoration: underline;
        }
        /*    미리보기 팝업------------------------------------ */
        .pre-view-section{
            display: none;
            z-index: 50;
            background-color: #fff;
            min-width: 500px;
            min-height: 500px;
            border: 2px solid black ;
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%,-50%);

        }
        .pre-view-section .preViewContent{
            position: relative;
            height: 80vh;
            overflow-y: auto;
        }
        .pre-view-section .preViewClose{
            position: absolute;
            bottom: 50px;
            right: -95px;
            height: 40px;
            width: 80px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            line-height: 40px;
            padding: 5px;
            background-color: #006633;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>뉴스 수정</h2>
                <nav class="nav">
                    <ul class="nav-ul">
                        <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)"> 뉴스</a></li>
                    </ul>
                </nav>
            </div>
            <div class="middle-section">
                <form id="form" action="/whats_new/news/edit" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="newsId" value="${n.newsId}">
                    <div class="title clear-fix">
                        <div>
                            제목 : <input type="text" name="title" value="${n.title}">
                        </div>
                    </div>
                    <div class="listImg">
                        <input type="hidden" name="originImage">
                        <p>리스트 이미지</p>
                        <img src="${n.listImg}">
                        <p>
                            파일경로 : <input type="text" name="listImg" value="${n.listImg}">
                        </p>
                        <p>
                            리스트이미지 파일 변경(260 X 260) : <input type="file" name="listImgFile">
                        </p>

                    </div>
                    <div class="kind">
                        <p >분류 : </p>
                        <select name="kind" id="kind" aria-label="">
                            <option value="PRODUCT">상품 출시</option>
                            <option value="CULTURE">스타벅스와 문화</option>
                            <option value="CONTRIBUTE">스타벅스 사회공헌</option>
                            <option value="CARD">스타벅스 카드출시</option>
                        </select>
                    </div>
                    <p>내용</p>
                    <div class="content">
                        <textarea name="content">${n.content}</textarea>
                    </div>
                    <div class="attachList">
                        <input type="hidden" name="attach">
                        <p>첨부파일 <span class="material-symbols-outlined add">add</span></p>
                        <div class="attachFile1">
                            <input name="attach-file" type="file"><br>
                            경로 : <input type="text" name="attach-name" value="none" disabled>
                                    <span class="del2">삭제</span>
                        </div>
                    </div>
                    <div class="button clear-fix">
                        <div class="cancel">
                            <div id="cancel">취소</div>
                        </div>
                        <div class="submit">
                            <div id="edit">수정</div>
                        </div>
                        <div class="pre-view">
                            <div id="pre-view">미리보기</div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="pre-view-section">

            </div>
        </div>
    </main>

    <%@ include file="../../include/footer.jsp"%>
</div>

<script>
    // 기존 첨부파일 삭제 기능 ---------------------------------------------------------
    function delFile1() {
        const del = document.querySelectorAll('.del');
        del.forEach(function (del) {
            del.addEventListener('click', e => {
                if (!e.target.matches('.del')) return
                document.querySelector('.attachList').removeChild(e.target.parentElement);
            })
        })
    }
    // 추가 첨부파일 삭제 기능 ---------------------------------------------------------
    function delFile2(){
        const del2 = document.querySelectorAll('.del2');
        del2.forEach(function (del2){
            del2.addEventListener('click',e=>{
                if(!e.target.matches('.del2'))  return;
                const path = e.target.previousElementSibling.value;
                console.log(path);
                console.log()
                const reqInfoDel = {
                    method: 'DELETE',
                    body: path
                };
                if(path === "none") return;
                fetch('/whats_new/deleteFile', reqInfoDel)
                    .then(res => res.text())
                    .then(msg => {
                        console.log(msg);
                        document.querySelector('.attachList').removeChild(e.target.parentElement);
                    })
            })
        })
    }
    // 기존 첨부파일 보여주기 기능 -------------------------------------------------------
    let asNum = 1;
    function attachShow(){
        let attach = "${n.attach}";
        if(attach === "") return;
        console.log("attach : ",attach);
        let attachList = attach.split(",");
        const $attachList = document.querySelector('.attachList');
        attachList.forEach(function (al){
            console.log("al : ",al);
            const $div = document.createElement('div');
            $div.classList.add("attachShow"+asNum);
            asNum += 1;
            $div.innerHTML = `첨부파일 : <input type="text" name="attach-name" value="`+al+`" disabled><span class="del">삭제</span>`
            $attachList.insertBefore($div, $attachList.firstChild); //첫번째 자식으로 추가
        })
        delFile1();
    }
    function originImg(){
        // 최초 이미지  파일 경로 저장.
        const originImg = document.querySelector('input[name="listImg"]').value;
        document.querySelector('input[name="originImage"]').value = originImg;

        // 기존에 있던 파일 이름 가져오기 - 파일을 재선택시 기존의 전송된 파일 삭제 및 수정시 기존 이미지경로 저장
        console.log(originImg);
        document.querySelector("input[name='listImg']").value = originImg;
    }
    function uploadListImg(type){
        document.querySelector("input[name='listImgFile']").addEventListener("change",  e => {
            e.preventDefault();
            const oldFileName = document.querySelector('.listImg img').getAttribute('src');
            // 1. 선택된 파일 데이터 읽기
            console.log(e);
            const file = e.target.files[0];
            console.log('file data: ', file);

            // 2. 파일 데이터를 전송하기 위해 FormData객체필요
            const formData = new FormData();

            // 3. 전송할 파일을 formData안에 포장(form 태그로 submit 을 하지않고 보낼때)
            formData.append('file',file);

            // 4. 비동기 요청 전송
            const reqInfo = {
                method: 'POST',
                body: formData
            };
            fetch('/whats_new/upload?type='+type, reqInfo)
                .then(res => {
                    //console.log(res.status);
                    return res.text();
                })
                .then(fileName => {
                    console.log(fileName);
                    // 선택한 이미지를 보여주는 함수
                    showImgFile(fileName);
                    // DB에 파일경로 저장을 위해 input 태그에 파일 경로 저장.
                    document.querySelector("input[name='listImg']").value = fileName;

                    // 기존의 이미지파일 삭제 비동기 요청, 단 기존의 이미지 파일이 최초의 이미지가 아닐때.
                    const originImg = document.querySelector('input[name="originImage"]').value;
                    if(originImg !== oldFileName) {
                        const reqInfoDel = {
                            method: 'DELETE',
                            body: oldFileName
                        };
                        fetch('/whats_new/deleteFile', reqInfoDel)
                            .then(res => res.text())
                            .then(msg => {
                                console.log(msg);
                            })
                    }
                })
        })
    }
    // 업로드 된 이미지파일을 화면에 보여주는 함수------------------------------------------
    function showImgFile(fileName) {

        //원본 파일 명 추출
        let originFileName = fileName.substring(fileName.lastIndexOf("_") + 1);

        // 이미지면 썸네일을 렌더링
        const $img = document.querySelector('.listImg img');
        // 단순히 src 에 파일경로만 적으면 이미지를 불러오지 못함.
        // 이미지렌더링을 위해 서버로 파일 전송 비동기 요청을 하고 파일을 로드하던지,
        // 이미지 src의 경로를 적어주고, 스프링에서 WebConfig.java 에서 리소스 경로 매칭을 해주면
        // 이미지를 불러올 수 있음.
        $img.setAttribute('src', fileName);
        $img.setAttribute('alt', originFileName);
    }

    // 첨부파일 갯수 추가 --------------------------------------------------------------------
    let num = 2
    function attachFileAdd(){
        document.querySelector('.add').addEventListener("click", e=>{
            if(!e.target.matches('.add')) return;

            const $attachList = document.querySelector('.attachList');
            const $div = document.createElement('div')
            $div.classList.add("attachFile"+num);

            $div.innerHTML = `<input name="attach-file" type="file"><br>
                                경로 : <input type="text" name="attach-name" value="none" disabled><span class="del2">삭제</span>
                                `;

            num = num + 1;
            $attachList.appendChild($div);

            delFile2();
        })
    }

    // 첨부파일 비동기 업로드 -----------------------------------------------------------
    let attachList;
    function uploadAttachFile(type){
        document.querySelector(".attachList").addEventListener("change",  e => {
            e.preventDefault();
            console.log("change");
            // 첨부파일 변경시 이전 파일 경로 저장.
            const oldFileName = e.target.nextElementSibling.nextElementSibling.value;

            // 1. 선택된 파일 데이터 읽기
            console.log(e);
            const file = e.target.files[0];
            console.log('file data: ', file);

            // 2. 파일 데이터를 전송하기 위해 FormData객체필요
            const formData = new FormData();

            // 3. 전송할 파일을 formData안에 포장(form 태그로 submit 을 하지않고 보낼때)
            formData.append('file',file);

            // 4. 비동기 요청 전송
            const reqInfo = {
                method: 'POST',
                body: formData
            };
            fetch('/whats_new/upload?type='+type, reqInfo)
                .then(res => {
                    //console.log(res.status);
                    return res.text();
                })
                .then(fileName => {
                    console.log(fileName);
                    // 파일경로 보여주기
                    e.target.nextElementSibling.nextElementSibling.value = fileName;

                    // 기존의 이미지파일 삭제 비동기 요청
                    if(oldFileName !== 'none') {
                        console.log("oldFN : ", oldFileName);
                        const reqInfoDel = {
                            method: 'DELETE',
                            body: oldFileName
                        };
                        fetch('/whats_new/deleteFile', reqInfoDel)
                            .then(res => res.text())
                            .then(msg => {
                                console.log(msg);
                            })
                    }
                })
        })
    }

    // 미리보기 OR 수정 OR 취소 ----------------------------------------------------------------------------
    function submitData(){
        document.querySelector('.button').addEventListener('click', e=>{
            e.preventDefault();
            if(e.target.matches('#pre-view')){
                console.log("preView");
                const $preViewSection = document.querySelector('.pre-view-section');
                if($preViewSection.firstElementChild){
                    console.log("exist");
                    $preViewSection.replaceChildren();
                }

                const $div = document.createElement('div');
                const content = document.querySelector('textarea[name="content"]').value;
                $div.innerHTML = content;
                $div.classList.add('preViewContent');

                const $close = document.createElement('div');
                $close.classList.add('preViewClose')
                $close.textContent = '닫기';

                $preViewSection.appendChild($div);
                $preViewSection.appendChild($close);
                $preViewSection.style.display='block';

                if($preViewSection.firstElementChild) {
                    document.querySelector('.preViewClose').addEventListener('click', e => {
                        if (!e.target.matches('.preViewClose')) return;
                        console.log("preClose");
                        $preViewSection.style.display='none';
                    })
                }
            }

            if(e.target.matches('#edit')) {
                console.log("edit");
                // 이미지파일은 이미 업로드 되었기때문에 disabled
                document.querySelector('input[name="listImgFile"]').setAttribute("disabled", "");
                // = document.querySelector('input[name="file"]').disabled=true;

                const $attachFiles = document.querySelectorAll('input[name="attach-file"]');
                $attachFiles.forEach(function (a) {
                    a.setAttribute("disabled", "");
                })

                // 첨부파일 목록 생성 및 담기
                let attach="";
                const name = document.querySelectorAll('input[name="attach-name"]');
                console.log(name);
                name.forEach(function (n){
                    console.log("n.value : ", n.value);
                    if(n.value !== "none") {
                        if (attach === "") {
                            attach = attach + n.value;
                        } else {
                            attach = attach + "," + n.value;
                        }
                    }
                })
                console.log("attach : ",attach);
                document.querySelector('input[name="attach"]').value = attach;

                // 현제 렌더링한 이미지가 최초의 이미지가 아니라면 최초 이미지파일 제거
                const img = document.querySelector('input[name="listImg"]').value;
                const originImg = document.querySelector('input[name="originImage"]').value;
                if (originImg !== img) {
                    const reqInfoDel = {
                        method: 'DELETE',
                        body: originImg
                    };
                    fetch('/whats_new/deleteFile', reqInfoDel)
                        .then(res => res.text())
                        .then(msg => {
                            console.log(msg);
                            const $form = document.getElementById('form');
                            $form.submit();
                        })
                } else {
                    const $form = document.getElementById('form');
                    $form.submit();
                }
            }
            if(e.target.matches('#cancel')) {
                console.log("cancel");

                // 첨부했던 파일 목록 생성
                let nameList=[];
                const name = document.querySelectorAll('input[name="attach-name"]');
                name.forEach(function (n){
                    nameList.push(n.value);
                })

                // 현제 렌더링한 이미지가 최초의 이미지가 아니라면 현제 렌더링한 이미지파일 삭제목록에 추가
                const img = document.querySelector('input[name="listImg"]').value;
                const originImg = document.querySelector('input[name="originImage"]').value;
                if(originImg !== img ) {
                    nameList.push(img);
                }
                if (nameList) {
                    nameList.forEach(function (n){
                        const reqInfoDel = {
                            method: 'DELETE',
                            body: n
                        };
                        fetch('/whats_new/deleteFile', reqInfoDel)
                            .then(res => res.text())
                            .then(msg => {
                                console.log(msg);
                            })
                    })
                }
                history.go(-1);
            }
        })
    }

    function defaultKind(){
        const $kinds = [...document.getElementById('kind').children];
        $kinds.forEach(function (k){
            if(k.value === "${n.kind}"){
                k.selected=true;
            }
        })
    }
    const type="news";
    (function (){
        attachShow();
        originImg();
        uploadListImg(type);
        uploadAttachFile(type);
        submitData();
        attachFileAdd();
        defaultKind();
        delFile2();
    })();

</script>
</body>
</html>
