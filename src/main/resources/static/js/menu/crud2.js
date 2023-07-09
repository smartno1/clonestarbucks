$('#deleteDrink').click(function(){
	console.log($('#deleteDrink').data('id'));
	if(confirm("정말로 삭제하시겠습니까?")){
		var id = $('#deleteDrink').data('id');
		console.log(id);
		const reqInfo = {
			method:"DELETE"
			,body:id
		};
		fetch("/menu/drinkDelete",reqInfo)
			.then(res => res.text())
			.then(msg => {
				console.log(msg);
				if(msg === "delete success"){
					alert("삭제에 성공하였습니다.");
					location.href = "/menu/drinkList"
				}else{
					alert("삭제에 실패하였습니다.");
				}
			})

	}
});


$('#deleteFood').click(function(){
	console.log($('#deleteFood').data('id'));
	if(confirm("정말로 삭제하시겠습니까?")){
		var id = $('#deleteFood').data('id');
		console.log(id);
		const reqInfo = {
			method:"DELETE"
			,body:id
		};
		fetch("/menu/foodDelete",reqInfo)
			.then(res => res.text())
			.then(msg => {
				console.log(msg);
				if(msg === "delete success"){
					alert("삭제에 성공하였습니다.");
					location.href = "/menu/foodList"
				}else{
					alert("삭제에 실패하였습니다.");
				}
			})

	}
});

$('#deleteProduct').click(function(){
	console.log($('#deleteProduct').data('id'));
	if(confirm("정말로 삭제하시겠습니까?")){
		var id = $('#deleteProduct').data('id');
		console.log(id);
		const reqInfo = {
			method:"DELETE"
			,body:id
		};
		fetch("/menu/productDelete",reqInfo)
			.then(res => res.text())
			.then(msg => {
				console.log(msg);
				if(msg === "delete success"){
					alert("삭제에 성공하였습니다.");
					location.href = "/menu/productList"
				}else{
					alert("삭제에 실패하였습니다.");
				}
			})

	}
});
$('#editDrink').click(function(){
	var link = "/menu/drinkEdit?id="+$('#editDrink').data('id');
	console.log(link);
	location.href= link
});

$('#editFood').click(function(){
	var link = "/menu/foodEdit?id="+$('#editFood').data('id');
	console.log(link);
	location.href= link
});
$('#editProduct').click(function(){
	var link = "/menu/productEdit?id="+$('#editProduct').data('id');
	console.log(link);
	location.href= link
});

$('#addMyFavorite').click(function(){
	if(!confirm("나만의 상품으로 등록 하시겠습니까?")) return;
	const id = $('#addMyFavorite').data('id');
	const type = "menu";
	const param = { "id":id, "type":type};
	const reqInfo = {
		method: "POST",
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(param)
	}

	fetch('/myStarbucks/favorite/add', reqInfo)
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
