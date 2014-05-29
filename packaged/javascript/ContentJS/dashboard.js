$(document).ready(function(){
	LoadUserProfile();
})

function LoadUserProfile()
{
	AB.ajax({
		url: AB.serviceUri + 'dashboard/getUserProfile',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			var d = data[0];
			$("#fullname").text(d.FullName);
			$("#username").val(d.UserName);
			$("#email").val(d.Email);
			$("#userimage").attr("src", AB.userPhotoUri+'/'+d.UserPhoto);
		}
	});
}