$(document).ready(function(){
	$('.ui.selection.dropdown').dropdown();

	$("#formRegister").submit(function(e){
		e.preventDefault();
		var data = $("#formRegister").serialize();
		console.log(data);
		alert(data);
	});
})