$(document).ready(function(){
	$('.ui.selection.dropdown').dropdown();

	//$("#registeredPhoto").val("1.jpg")
	//Initialize Photo Uploader
	 new qq.FileUploaderBasic({
	      button: $("#fine-uploader-basic")[0],
	      action: 'localhost:8088/ujianonlinelatest/general/douploadimage',
	      debug: false,
	      
	      allowedExtensions: ['jpeg', 'jpg', 'gif', 'png'],
	      sizeLimit: 2048000,
    	  forceMultipart:true,
    	  onUpload : '',
	      onComplete:function(id, fileName, data){
	    	  if(data.status == '1'){
	    		  $("#picture").attr('src','localhost:8088/ujianonlinelatest/packaged/images/registereduser/'+data.name);  
	    	  }
	    	  	alert(data.name);
	    	  	$("#registeredPhoto").val(data.name);
	    	  	//$(".preloader").trigger("ajaxComplete");
	      }});

	$("#btnRegister").click(function(){
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
			}	
		});
	});
})