$(document).ready(function(){
	loadDegree();
	loadLevel();
	loadCategory();
	$('.ui.checkbox').checkbox();
	//create test validation
	$('#formCreateTest').form({
		testname: {
	      identifier : 'testname',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter a test name'
	        }
	      ]
	    },
		description: {
	      identifier : 'description',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please enter the description of the test'
	        }
	      ]
	    },
		hdnDegree: {
	      identifier : 'hdnDegree',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please choose degree'
	        }
	      ]
	    },
		hdnCategory: {
	      identifier : 'hdnCategory',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please choose category'
	        }
	      ]
	    },
		hdnLevel: {
	      identifier : 'hdnLevel',
	      rules: [
	        {
	          type   : 'empty',
	          prompt : 'Please choose level'
	        }
	      ]
	    }
	},{
	    inline : true,
	    on     : 'blur'
	});
	//end of create test validation
	
	$("input[name='publishDate']").change(function(){
		
		var selectedValue = $(this).val();
		if(selectedValue == 'date')
			$(".field.dateRange").stop().slideDown();
		else
			$(".field.dateRange").stop().slideUp();
		
	});
	
	new qq.FileUploaderBasic({
		button: $("#fine-uploader-basic")[0],
		action: 'createtest/uploadfile',
		debug: false,
		allowedExtensions: ['doc', 'docx', 'zip', 'rar','pdf','xls'],
		sizeLimit: 2048000,
		forceMultipart:true,
		//onUpload : function(){$(".preloader").trigger("ajaxSend");},
		onComplete:function(id, fileName, data)
		{
			$("#FileExtention").val(data.ext);
			$("#sharedMaterial").val(data.name);
		}
	});
	
	$("#btnCreateTest").click(function(e){
	
		var selectedAccessType, publishDate, startDate, endDate;
		selectedAccessType = $("input[name='accessType']:checked").val();
		publishDate = $("input[name='publishDate']:checked").val();
		if(publishDate == 'forever'){
			//startDate = null;
			//endDate = null;
			startDate =  '2012-12-12';
			endDate = '2012-12-12';
		}
		else if(publishDate == 'date'){
			//startDate = $("#startDate").val();
			//endDate = $("#endDate").val();
			startDate =  '2012-12-12';
			endDate = '2012-12-12';
		}
		
		if(!($('#formCreateTest .field').hasClass('error')))
		{
			var createtestdata = {
				TestName : $("#testname").val(), 
				TestDescription : $("#description").val(),
				CategoryID : $("#hdnCategory").val(), 
				LevelID : $("#hdnLevel").val(), 
				DegreeID : $("#hdnDegree").val(), 
				AccessType : selectedAccessType,
				PublishStartDate : startDate,
				PublishEndDate : endDate,
				UploadTutorial : $("#sharedMaterial").val()
			}
			AB.ajax({
				url: AB.serviceUri + 'createtest/insertTest',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(createtestdata),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					alert('Test created successfully.');
				}	
			});
		}
	});

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
			$('.ui.selection.dropdown').dropdown();
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
			$('.ui.selection.dropdown').dropdown();
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