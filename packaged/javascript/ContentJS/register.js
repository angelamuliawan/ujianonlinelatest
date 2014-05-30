$(document).ready(function(){
	$('.ui.selection.dropdown').dropdown();

	//$("#registeredPhoto").val("1.jpg")
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
	    		  $("#picture").attr('src','/ujianonlinelatest/packaged/images/registereduser/'+data.name);  
	    	  }
	    	  	$("#registeredPhoto").val(data.name);
	      }});

	$('#formRegister').form({
		username: {
	      identifier : 'username',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter a username',
	        }
	      ]
	    },
	    fullname: {
	      identifier : 'fullname',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter a full name'
	        }
	      ]
	    },
	    password: {
	      identifier : 'password',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter a password'
	        },
	        {
	          type   : 'length[4]',
	          prompt : 'Your password must be at least 6 characters'
	        }
	      ]
	    },
	    passwordConfirm: {
	      identifier : 'confirmpassword',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please confirm your password'
	        },
	        {
	          type   : 'match[password]',
	          prompt : 'Password doesn\'t match'
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
	    },
	    usertype: {
	      identifier : 'usertype',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter your type'
	        }
	      ]
	    },
		terms: {
	      identifier : 'agreed',
	      rules: [
	        {
	          type   : 'checked',
	          prompt : 'You must agree to the terms and conditions'
	        }
	      ]
	    }
	},{
	    inline : true,
	    on     : 'blur'
	});

	$("#btnRegister").click(function(){
		if(!($('#formRegister .field').hasClass('error')))
		{
			var registerdata ={
				username : $("#username").val(),
				photo : $("#registeredPhoto").val(),
				fullname : $("#fullname").val(),
				password : $("#password").val(),
				email : $("#email").val(),
				usertype : $("#usertype").val(),
				agreed : $("#agreed").val(),
			}
			AB.ajax({
				url: AB.serviceUri + 'register/insertuser',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(registerdata),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					window.location.href= AB.dashboardUri;
				}	
			});
		}
	});
})