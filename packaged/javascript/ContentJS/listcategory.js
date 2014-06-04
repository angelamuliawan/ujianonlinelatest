$(document).ready(function(){
	loadDegreeCategory();
});

function loadDegreeCategory()
{
	AB.ajax({
		url: AB.serviceUri + 'listcategory/getCategoryPerDegree',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			console.log(data);
			for(var i = 0; i<data.length; i++)
			{
			if(i==0 || data[i].DegreeID != data[i-1].DegreeID )
			{
				$('.viewdegcat').append(
				'<div class="title">'+
				   '<i class="dropdown icon"></i>'+
				    data[i].DegreeName+
				  '</div>'+
				  '<div class="content">'+
				    '<div class="accordion">'+
				      '<div class="title">'+
				          '<a href="'+mainDomain+'/listitempercategory/index/'+data[i].CategoryID+'">'+data[i].CategoryName+
				      '</div>'+
				    '</div>'+
				  '</div>');
				if(i == 0) 
					{
						$('.title').addClass(".active");
						$('.content').addClass(".active");
					}
			}
			else
			{
				$('.viewdegcat').append(
				'<div class="content">'+
				    '<div class="accordion">'+
				      '<div class="title">'+
				          data[i].CategoryName+
				      '</div>'+
				    '</div>'+
				  '</div>');
			}
				$('.ui.accordion').accordion();
			}
		}
	});
}