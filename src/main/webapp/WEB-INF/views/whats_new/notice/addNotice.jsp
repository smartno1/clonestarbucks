<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>Notice</title>
    <link rel="stylesheet" type="text/css" href="/css/whats_new/notice/addNotice.css">
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>공지사항 추가</h2>
                <nav class="nav">
                    <ul class="nav-ul">
                        <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)"> 공지사항</a></li>
                    </ul>
                </nav>
            </div>
            <div class="middle-section">
                <form id="form" action="/whats_new/notice/add" method="POST">
                    <div class="title clear-fix">
                        <input name="title" placeholder="제목을 입력하세요.">
                        <ul>
                            <li>

                            </li>
                        </ul>
                    </div>
                    <div class="content">
                        <textarea id="content" name="content" placeholder="내용을 입력하세요."></textarea>
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
                            <div id="add">추가</div>
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
    // 첨부파일 삭제버튼 ----------------------------------------------------------------
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
    // 첨부파일 갯수 추가 --------------------------------------------------------------------
    let num = 2
    function attachFileAdd(){
        document.querySelector('.add').addEventListener("click", e=>{
            if(!e.target.matches('.add')) return;

            const $attachList = document.querySelector('.attachList');
            const $div = document.createElement('div')
            $div.classList.add("attachFile"+num);

            $div.innerHTML = ` <input name="attach-file" type="file"><br>
                                경로 : <input type="text" name="attach-name" value="none" disabled>
                                        <span class="del2">삭제</span>
                                `;
            num = num + 1;
            $attachList.appendChild($div);
            delFile2();
        })
    }


    // 첨부파일 비동기 업로드 -----------------------------------------------------------
    function uploadAttachFile(type){
        document.querySelector(".attachList").addEventListener("change",  e => {
            e.preventDefault();
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
            if(e.target.matches('#add')) {
                console.log("add");
                // 파일은 이미 업로드 되었기때문에 disabled
                const $attachFiles = document.querySelectorAll('input[name="attach-file"]');
                $attachFiles.forEach(function (a){
                    a.setAttribute("disabled","");
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

                // submit 전송.
                const $form = document.getElementById('form');
                $form.submit();
            }
            if(e.target.matches('#cancel')) {
                console.log("cancel");
                // 업로드 된 파일이 있으면 제거
                const name = document.querySelectorAll('input[name="attach-name"]');
                const nameList=[];
                name.forEach(function (n){  // 첨부파일 목록 담기
                    nameList.push(n.value);
                })
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
    const type="notice";
    (function (){
        uploadAttachFile(type);
        submitData();
        attachFileAdd();
        delFile2();
    })();
</script>
</body>
</html>
