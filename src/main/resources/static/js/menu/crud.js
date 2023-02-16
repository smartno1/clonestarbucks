$('#delete').click(function(){
	console.log($('#delete').data('id'));
	if(confirm("정말로 삭제하시겠습니까?")){
		var id = $('#delete').data('id');
		console.log(id);
		const reqInfo = {
			method:"DELETE"
			,body:id
		};
		fetch("/menu/deleteMenulist",reqInfo)
			.then(res => res.text())
			.then(msg => {
				console.log(msg);
				if(msg === "delete success"){
					alert("삭제에 성공하였습니다.");
					location.href = "/menu/list"
				}else{
					alert("삭제에 실패하였습니다.");
				}
			})
	}
});
$('#edit').click(function(){
	var link = "/menu/editmenuListForm?id="+$('#edit').data('id');
	console.log(link);
	location.href= link
});