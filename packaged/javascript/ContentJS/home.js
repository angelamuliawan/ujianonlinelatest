$(document).ready(function(){

	loadTopTest();

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
						$.session.set('userlogin',  $("#loginusername").val());
						window.location.href= AB.dashboardUri;
					}
				}	
			});
		}
	});

	$(".btnLogout").click(function(){
		$.session.set('userlogin', false);
		window.location.href= AB.serviceUri+'home/doLogout';
	});
});

function loadTopTest(){
	AB.ajax({
		url: AB.serviceUri + 'home/loadTopTest',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			for(var i = 0; i<data.length; i++)
			{
				$(".animated.selection").append(''+
					'<div class="item item-popup" data-content="created by '+data[i].FullName+'" data-variation="inverted small">'+
						'<i class="checkmark icon"></i>'+
						'<a href="#">'+data[i].TestName+'</a> on '+
						data[i].CategoryName+' - ' + data[i].DegreeName+
						'<div class="right floated">'+data[i].NumberOfPeople+' people did</div>'+
					'</div>');
				if(data[i].LevelID == 1) $(".checkmark").addClass('green');
				else if (data[i].LevelID == 2) $(".checkmark").addClass('blue');
				else $(".checkmark").addClass('red');
			}
		}
	});
}