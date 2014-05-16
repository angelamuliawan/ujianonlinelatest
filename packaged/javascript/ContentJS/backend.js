$(document).ready(function(){

	AB.ajax({
		url: AB.serviceUri + 'login/loginUser',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		data: JSON.stringify(loginParam),
		success:function(data){
			if(data.status == 'success') {
				location.href = AB.dashboardUri;
			} else {
				alert('Login failed');
			}
		}
	});

	/*$('#loginForm').submit(function(e){
		e.preventDefault();
		var loginParam = $(this).serializeJSON();
		AB.ajax({
			url: AB.serviceUri + 'login/loginUser',
			type: 'post',
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			data: JSON.stringify(loginParam),
			success:function(data){
				if(data.status == 'success') {
					location.href = AB.dashboardUri;
				} else {
					alert('Login failed');
				}
			}
		});
	});*/
});