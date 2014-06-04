$(document).ready(function(){
	
	var categoryID = $("#hdnCategoryID").val();
	AB.ajax({
		url: AB.serviceUri + 'listitempercategory/getDegreeWithCategory',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify({categoryID : categoryID}),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			$("#passedDegree").after(data[0].DegreeName);
			$("#passedCategory").after(data[0].CategoryName);
		}	
	});
	
	// Get list item per category table
	AB.ajax({
		url: AB.serviceUri + 'listitempercategory/getListItemPerCategory',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify({categoryID : categoryID}),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			for(var i = 0; i < data.length; i++){
				var tmp = $("#iListTemplate").clone().removeAttr('id').addClass('datarow').css('display','');
				$(".iTestName",tmp).text(data[i].TestName);
				$(".iTestName",tmp).attr('href',mainDomain+'/taketest/index/' + data[i].TestID);
				$(".iTestDescription",tmp).text(data[i].TestDescription);
				$(".iTotalPassedBy",tmp).text(data[i].PassedBy);
				
				$("#tableListItemPerCategory tbody").append(tmp);
			}
			
		}	
	});
})