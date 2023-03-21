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
	var link = "/menu/drinkEdit?id="+$('#edit').data('id');
	console.log(link);
	location.href= link
});

$('#editFood').click(function(){
	var link = "/menu/foodEdit?id="+$('#edit1').data('id');
	console.log(link);
	location.href= link
});
$('#editProduct').click(function(){
	var link = "/menu/productEdit?id="+$('#edit2').data('id');
	console.log(link);
	location.href= link
});