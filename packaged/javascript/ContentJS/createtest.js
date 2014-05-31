$(document).ready(function(){
	loadDegree();
	loadLevel();
	loadCategory();
});

function loadDegree(){
	AB.ajax({
		url: AB.serviceUri + 'backend/getDegree',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			for(var i = 0; i<data.length; i++)
			{
				$(".menu.ddlDegree").append(
					'<div class="item" data-value="'+data[i].DegreeID+'">'+data[i].DegreeName+'</div>'
				);
			}
		}
	});
}

function loadLevel(){
	AB.ajax({
		url: AB.serviceUri + 'backend/getLevel',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			for(var i = 0; i<data.length; i++)
			{
				$(".menu.ddlLevel").append(
					'<div class="item" data-value="'+data[i].LevelID+'">'+data[i].LevelName+'</div>'
				);
			}
		}
	});
}

function loadCategory(){
	
	AB.ajax({
		url: AB.serviceUri + 'backend/getCategory',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			for(var i = 0; i<data.length; i++)
			{
				$(".menu.ddlCategory").append(
					'<div class="item" data-value="'+data[i].CategoryID+'">'+data[i].CategoryName+'</div>'
				);
			}
			$('.ui.selection.dropdown').dropdown();
		}
	});
}