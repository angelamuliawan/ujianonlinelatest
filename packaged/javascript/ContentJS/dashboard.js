$(document).ready(function(){
	LoadUserProfile();

	//Initialize Photo Uploader
	new qq.FileUploaderBasic({
		button: $("#fine-uploader-basic")[0],
		action: 'general/douploadimage',
		debug: false,
		allowedExtensions: ['jpeg', 'jpg', 'gif', 'png'],
		sizeLimit: 2048000,
		forceMultipart:true,
		onUpload : '',
		onComplete:function(id, fileName, data){
			if(data.status == '1'){
				$("#userimage").attr('src','/ujianonlinelatest/packaged/images/registereduser/'+data.name);  
			}
			$("#originalPhotoName").val(data.name);
		}
	});
	
	//change profile validation
	$('#formChangeProfile').form({
		fullname: {
	      identifier : 'fullname',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter a full name'
	        }
	      ]
	    },
		email: {
	      identifier : 'email',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter your email'
	        },
	        {
	          type   : 'email',
	          prompt : 'Please enter a valid email address'
	        }
	      ]
	    }
	},{
	    inline : true,
	    on     : 'blur'
	});
	//end of change password validation

	//start of change password validation
	$('#formChangePassword').form({
		password: {
	      identifier : 'password',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter your old password'
	        },
	        {
	          type   : 'length[4]',
	          prompt : 'Your olg password should be at least 4 characters'
	        }
	      ]
	    },
	    newpassword: {
	      identifier : 'newpassword',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter new password'
	        },
	        {
	          type   : 'length[4]',
	          prompt : 'Your new password must be at least 4 characters'
	        }
	      ]
	    },
	    confirmnewpassword: {
	      identifier : 'confirmnewpassword',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please confirm your password'
	        },
	        {
	          type   : 'match[newpassword]',
	          prompt : 'Password doesn\'t match'
	        }
	      ]
	    },
		},{
	    inline : true,
	    on     : 'blur'
	});
	//end of change password validation

	//change profile
	$("#btnChangeProfile").click(function(){
		if(!($('#formChangeProfile .field').hasClass('error')))
		{
			var changeprofiledata ={
				photo : $("#originalPhotoName").val(),
				fullname : $("#fullname").val(),
				email : $("#email").val()
			}
			AB.ajax({
				url: AB.serviceUri + 'dashboard/changeUserProfile',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(changeprofiledata),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					window.location.reload();
				}	
			});
		}
	});
	//change password
	$("#btnChangePassword").click(function(){
		if(!($('#formChangePassword .field').hasClass('error')))
		{
			var changepassworddata ={
				password : $("#password").val(),
				newpassword : $("#newpassword").val()
			}
			AB.ajax({
				url: AB.serviceUri + 'dashboard/changePassword',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(changepassworddata),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					window.location.reload();
				}	
			});
		}
	});


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
			$("#fullname").val(d.FullName);
			$("#username").val(d.UserName);
			$("#email").val(d.Email);
			$("#userimage").attr("src", AB.userPhotoUri+'/'+d.UserPhoto);
			$("#originalPhotoName").val(d.UserPhoto);
		}
	});
}