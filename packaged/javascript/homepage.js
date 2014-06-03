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

    $('.ui.accordion').accordion();
    $('.ui.form').form(validationRules, {on: 'blur'});
    $('.masthead .information').transition('scale in');
    setInterval(changeSides, 3000);
	
	
	// our code goes here
	if($.session.get('userlogin') !== undefined){
		AB.ajax({
			url: AB.serviceUri + 'backend/getDegree',
			type: 'post',
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				for(var i = 0; i < data.length; i++)
				{
					var tmp = $("#iTemplateDegree").clone().removeAttr("id").addClass("datarow").css('display','');
					$(tmp).attr('data-id',data[i].DegreeID);
					$(".iDegree",tmp).after(data[i].DegreeName);
					$(".iContainerDegree").append(tmp);
					
					//console.log(tmp);
				}
			}
		});
	}
	
	$("body").on('click', '.title.datarow', function(e){
		$(".title.datarow.active").removeClass('active');
		var cur = $(this);
		cur.addClass('active');
		var DegreeID = cur.attr('data-id');
		AB.ajax({
			url: AB.serviceUri + 'backend/getCategoryByDegreeID',
			type: 'post',
			dataType: 'json',
			data:JSON.stringify({ 'DegreeID' :  DegreeID}),
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				$(".datacontent").remove();
				if(data.length <= 0){
					var tmp = $("#iTemplateAccordion").clone().removeAttr("id").addClass("datacontent");
					$(".iCategoryName",tmp).text("No category available");
					tmp.addClass('active');
					cur.after(tmp);
					tmp.slideDown('fast');
				}
				else{
					for(var i = 0; i < data.length; i++)
					{
						var tmp = $("#iTemplateAccordion").clone().removeAttr("iTemplateAccordion").addClass("datacontent");
						$(".iCategoryName",tmp).text(data[i].CategoryName);
						$(".iCategoryName",tmp).attr('href', mainDomain+'/listitempercategory/index/'+data[i].CategoryID);
						tmp.addClass('active');
						cur.after(tmp);
						tmp.slideDown('fast');
					}
				}
			}
		});
	});
});