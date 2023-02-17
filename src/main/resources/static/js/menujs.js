
    /*
    * 분류보기 메뉴 업 다운
    */
    function navShow(){
    document.querySelector('.arrow').addEventListener('click', e =>{
        if(!e.target.matches('.arrow img')) return;
        console.log("arrow-{}", e.target);
        const $img = e.target;
        if($img.getAttribute("src") === "/images/icon/list_up_btn.png") {
            $img.setAttribute("src", "/images/icon/list_down_btn.png")
            $img.parentElement.previousElementSibling.style.borderBottom = "none";
            document.querySelector('.search_kind').style.display = "none";
            document.querySelector('.search_type').style.display = "none";
        }else{
            $img.setAttribute("src", "/images/icon/list_up_btn.png")
            $img.parentElement.previousElementSibling.style.borderBottom = "1px solid #ddd";
            document.querySelector('.search_kind').style.display = "block";
            document.querySelector('.search_type').style.display = "block";
        }
    })
}
    /*
    * 원두 비아 캡슐 선택시 해당 리스트 보여주기
    */
    // kind 선택시 색상 변경
    function selectKind(){
    document.querySelector('.search_kind').addEventListener('click', e => {
        if(!e.target.matches('.search_kind a')) return;
        console.log(e.target);
        const $kinds = [...document.querySelector('.search_kind').children];
        for(const k of $kinds){
            if (k.firstElementChild === e.target){
                e.target.classList.add("selected");
                console.log("selected-{}",e.target);
            }else{
                k.firstElementChild.classList.remove("selected");
                console.log("remove selected-{}",k.firstElementChild);
            }
        }
        defaultType();
    })
}
    // kind 선택시 해당 리스트 보여주기


    // 전체 체크시 나머지 해제, 나머치 체크시 전체 해제
    function inputChecker(e){
    const $All = document.querySelector('.all');
    const $check = document.querySelectorAll('.check');
    console.log("e-{}",e);
    if(e === $All && e.checked === true){
    $check.forEach(function (check) {
    console.log("allcheck");
    check.checked = false;
})
}
    $check.forEach(function (check) {
    console.log("check");
    if (check.checked) {
    $All.checked = false;
}
})
}

    // type 체크시 체크된 타입의 리스트 요청
    function selectType(){
    // 체크시마다 이벤트 발생.
    document.querySelector('.search_type').addEventListener('change', e => {
        console.info("check-{}",e.target);
        inputChecker(e.target);

        // 체크 된 옵션을 보여주기, 체크해제된것은 안보이게,
        showTypeList();
    })
}
    // 체크 된 옵션을 보여주기, 체크해제된것은 안보이게,
    function showTypeList(){
    const $check = document.querySelectorAll('.check'); // 타입 요소를 전부 가져오고
    const $All = document.querySelector('.all');    // 전체선택 타입 요소 가져오고
    let all = false;
    if($All.checked){ all = true;  }    // 전체선택이면 true 변수 설정.

    $check.forEach(function (check) { // 타입 배열에서 하나씩 꺼냄
    const show = document.querySelector('.'+check.value); // 타입에 맞는 리스트 가져오기
    const showContent = show.firstElementChild.lastElementChild.firstElementChild;
    if(check.checked){ // 타입이 체크되었고
    if(showContent) { // 리스트에 목록이 있으면
    console.log("show-check: ", showContent);
    show.style.display = "block";   // 보여준다
}
}else if(all){  // 타입체크는 안되있고, 전체보기 체크면
    if(showContent) { // 리스트에 목록이 있으면
    console.log("show-all: ", showContent);
    show.style.display = "block";   // 보여준다
}
}else{  // 타입체크 x , 전체보기 x
    console.log("no show: ",show);
    show.style.display = "none";    // 숨긴다.
}
})
}

    // 처음 전체선택이 되게 하고 목록이 있는 리스트만 보여주기
    function defaultType(){
    // 먼저 모든 타입을 안보이게 설정.
    const dt = document.querySelectorAll('.coffee-wrapper');
    dt.forEach(function (d){
    d.style.display = "none";
})
    document.querySelector('input.all').checked = true;
    // 선택된 옵션에 맞는 타입 보여주기
    showTypeList();
}

    // 처음 원두 선택되게
    function defaultKind(){
    const $kinds = [...document.querySelector('.search_kind').children];
    $kinds[0].firstElementChild.classList.add('selected');
}

    // 선택된 kind에 맞는 목록 가져오기
    function kindList(){
    const kind = document.querySelector('.search_kind .selected').dataset.kind;

}

    (function (){
    defaultKind();
    defaultType();
    navShow();
    selectKind();
    selectType();
})();
