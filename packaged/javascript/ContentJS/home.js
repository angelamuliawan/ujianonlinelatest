$(document).ready(function(){
	$('#formLogin').form({
	username: {
      identifier : 'loginusername',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a username'
        }
      ]
    },
    password: {
      identifier : 'loginpassword',
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
    }
   });


	$('#btnLogin').click(function(){
		if(!($('#formLogin .field').hasClass('error')))
		{
			var datalogin = {
				username : $("#loginusername").val(),
				password : $("#loginpassword").val()
			}
			AB.ajax({
				url: AB.serviceUri + 'home/doLogin',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(datalogin),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					if(data[0].UserID == -1)
						$("#errorLogin").text("Invalid Username or Password");
					else 
					{
						$("#errorLogin").text("");
						window.location.href= AB.dashboardUri;
					}
				}	
			});
		}
	});
	$(".btnLogout").click(function(){
		window.location.href= AB.serviceUri+'home/doLogout';
	});
});