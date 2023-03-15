$('#delete').click(function(){
	console.log($('#delete').data('id'));
	if(confirm("정말로 삭제하시겠습니까?")){
		var id = $('#delete').data('id');
		console.log(id);
		const reqInfo = {
			method:"DELETE"
			,body:id
		};
		fetch("/coffee/bean/deleteCoffeeBean",reqInfo)
			.then(res => res.text())
			.then(msg => {
				console.log(msg);
				if(msg === "delete success"){
					alert("삭제에 성공하였습니다.");
					location.href = "../css/coffee/bean/list";
				}else{
					alert("삭제에 실패하였습니다.");
				}
			})
	}
});
$('#edit').click(function(){
	var link = "/coffee/bean/editCoffeeBeanForm?id="+$('#edit').data('id');
	console.log(link);
	location.href= link
});

$('#addMyFavorite').click(function(){
		if(!confirm("나만의 상품으로 등록 하시겠습니까?")) return;
		const id = $('#addMyFavorite').data('id');
		const reqInfo = {
			method: "POST",
			body: id
		}

		fetch('/favorite/addCoffee', reqInfo)
			.then(res => res.text())
			.then(msg => {
				if (msg === 'success') {
					alert("나만의 상품으로 등록하였습니다.");
				}else if(msg === 'exist'){
					alert("나만의 상품으로 이미 등록되어있습니다.")
				}else{
					alert("상품등록에 실패하였습니다.");
				}
			})
})