$('#delete').click(function(){
		console.log($('#delete').data('seq'));
	if(confirm("정말로 삭제하시겠습니까?")){
	   	var link = "deleteCoffeeBean?seq="+$('#delete').data('seq');
	   	console.log(link);
		location.href= link
	}
	else{
	}
});
$('#edit').click(function(){
	   	var link = "editCoffeeBeanForm?seq="+$('#edit').data('seq');
	   	console.log(link);
		location.href= link
});