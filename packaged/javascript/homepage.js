$(document).ready(function(){

	// template. copied from semantic ui
    var
      changeSides = function() {
        $('.ui.shape')
          .eq(0)
            .shape('flip over')
            .end()
          .eq(1)
            .shape('flip over')
            .end()
          .eq(2)
            .shape('flip back')
            .end()
          .eq(3)
            .shape('flip back')
            .end()
        ;
      },
      validationRules = {
        firstName: {
          identifier  : 'email',
          rules: [
            {
              type   : 'empty',
              prompt : 'Please enter an e-mail'
            },
            {
              type   : 'email',
              prompt : 'Please enter a valid e-mail'
            }
          ]
        }
      }
    ;

    $('.ui.dropdown').dropdown({on: 'hover'});
    $('.ui.form').form(validationRules, {on: 'blur'});
    $('.masthead .information').transition('scale in');
    setInterval(changeSides, 3000);
	
	
	// our code goes here
	if($.session.get('userlogin') == true){
		
		AB.ajax({
			url: AB.serviceUri + 'backend/getCategory',
			type: 'post',
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				
				for(var i = 0; i<data.length; i++)
				{
					var tmp = $(".title.iTemplateDegree").clone().removeClass("iTemplateDegree").addClass("datarow");
				}
			}
		});
		
	}
});