$(document).ready(function(){
	if($('.tasting_notes p').text() == ""){
		$('.tasting_notes').style.display="none";
	}
	if($('.enjoy_with p').text() == ""){
		$('.enjoy_with').style.display="none";
	}
	if($('.processing_method p').text() == ""){
		$('.processing_method').style.display="none";
	}
	
})