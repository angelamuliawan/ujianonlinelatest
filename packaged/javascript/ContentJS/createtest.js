var objTestDetail = new Array();
var objTestDetailAnswer = new Array();
var curTestID = 0;
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
	
	$("body").on('change', "input.radio", function(){
		var selector = $(this).attr('name');
		$("[name='"+selector+"']").val(0);
		$(this).val(1);
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
	
	// upload icon for option answer
	// new qq.FileUploaderBasic({
		// button: $(".column.btnOptionUpload")[0],
		// action: 'createtest/uploadfile',
		// debug: false,
		// allowedExtensions: ['doc', 'docx', 'zip', 'rar','pdf','xls'],
		// sizeLimit: 2048000,
		// forceMultipart:true,
		// onComplete:function(id, fileName, data)
		// {
			// alert($(this).parent().text());
			// //$("#FileExtention").val(data.ext);
			// //$("#sharedMaterial").val(data.name);
		// }
	// });
	
	
	
	$("#btnSaveAllQuestion").click(function(){
		var counter = 0;
		objTestDetail = new Array();
		objTestDetailAnswer = new Array();
		$(".column.datarow").each(function(){
			var tmp = $(this);
			
			// get question description
			var question = $("input[name='question_desc"+(counter+1)+"']").val();
			// if question contain uploaded file, temporary
			var testURL = 'N/A';
			
			// get option description
			var optionA_description = $(".questionOptionA", tmp).val();
			var optionB_description = $(".questionOptionB", tmp).val();
			var optionC_description = $(".questionOptionC", tmp).val();
			var optionD_description = $(".questionOptionD", tmp).val();
			
			// get option value, this will determine which answer is right or wrong
			// 1 is true, 0 is false.
			var optionA_value = $(".radio.optionA", tmp).val();
			var optionB_value = $(".radio.optionB", tmp).val();
			var optionC_value = $(".radio.optionC", tmp).val();
			var optionD_value = $(".radio.optionD", tmp).val();
			
			// get optionURI
			var optionA_URL = 'N/A';
			var optionB_URL = 'N/A';
			var optionC_URL = 'N/A';
			var optionD_URL = 'N/A';
			
			objTestDetail.push({
				'TestQuestion' : question,
				'TestURL' : testURL
			});
			
			objTestDetailAnswer[counter] = new Array();
			// push option A			
			objTestDetailAnswer[counter].push({
				'TestDetailAnswerName' : optionA_description,
				'TestDetailURL' : optionA_URL,
				'isAnswer' : optionA_value,
				'option' : 'A'
			});
			
			// push option B			
			objTestDetailAnswer[counter].push({
				'TestDetailAnswerName' : optionB_description,
				'TestDetailURL' : optionB_URL,
				'isAnswer' : optionB_value,
				'option' : 'B'
			});
			
			// push option C			
			objTestDetailAnswer[counter].push({
				'TestDetailAnswerName' : optionC_description,
				'TestDetailURL' : optionC_URL,
				'isAnswer' : optionC_value,
				'option' : 'C'
			});
			
			// push option D			
			objTestDetailAnswer[counter].push({
				'TestDetailAnswerName' : optionD_description,
				'TestDetailURL' : optionD_URL,
				'isAnswer' : optionD_value,
				'option' : 'D'
			});
			counter++;
		});
		
		var objParam = {
			listTestDetail : objTestDetail,
			listTestDetailAnswer : objTestDetailAnswer,
			TestID : curTestID
		}
		
		AB.ajax({
			url: AB.serviceUri + 'createtest/insertTestDetail',
			type: 'post',
			dataType: 'json',
			data:JSON.stringify(objParam),
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				alert("Test successfully created.");
			}	
		});
		
		//console.log(objTestDetail);
		//console.log(objTestDetailAnswer);
	});
	
	$("#btnCreateTest").click(function(e){
		e.preventDefault();
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
			//console.log(createtestdata);
			//alert('asdf');
			AB.ajax({
				url: AB.serviceUri + 'createtest/insertTest',
				type: 'post',
				dataType: 'json',
				data:JSON.stringify(createtestdata),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					console.log(data);
					curTestID = data;
					alert('Test created successfully.');
					
					$(".createTest").slideUp();
					$(".listQuestion").slideDown();
				}	
			});
		}
	});

	
	// question event
	var totalQuestion = 1;
	$("#btnAddQuestion").click(function(){
		
		var tmp = $(".column.iTemplateQuestion").clone().removeClass("iTemplateQuestion").addClass("datarow");
		
		// set number of question
		$(".ui.header", tmp).text("Question " + totalQuestion);
		
		$(".questionDescription", tmp).attr('name', 'question_desc' + totalQuestion);
		
		$(".radio.optionA", tmp).attr('name','answer' + totalQuestion);
		$(".radio.optionB", tmp).attr('name','answer' + totalQuestion);
		$(".radio.optionC", tmp).attr('name','answer' + totalQuestion);
		$(".radio.optionD", tmp).attr('name','answer' + totalQuestion);
		
		$(".questionOptionA", tmp).attr('name', 'question'+totalQuestion+'_OptionA');
		$(".questionOptionB", tmp).attr('name', 'question'+totalQuestion+'_OptionB');
		$(".questionOptionC", tmp).attr('name', 'question'+totalQuestion+'_OptionC');
		$(".questionOptionD", tmp).attr('name', 'question'+totalQuestion+'_OptionD');
		
		$("#btnAddQuestion").before(tmp);
		tmp.slideDown();
		totalQuestion++;
		$('.ui.checkbox').checkbox();
	});
	
	$("body").on('click','.btnDeleteQuestion', function(){
		totalQuestion--;
		var tempTotalQuestion = 1;
		$(this).closest("div.datarow").slideUp(function(){
			$(this).closest("div.datarow").remove();
			$(".column.datarow").each(function(){
				var tmp = $(this);
				// set number of question
				//alert(tmp.find(".ui.header").text());
				$(".ui.header", tmp).text("Question " + tempTotalQuestion);
				$(".questionDescription", tmp).attr('name', 'question_desc' + tempTotalQuestion);
				$(".radio.optionA", tmp).attr('name','answer' + tempTotalQuestion);
				$(".radio.optionB", tmp).attr('name','answer' + tempTotalQuestion);
				$(".radio.optionC", tmp).attr('name','answer' + tempTotalQuestion);
				$(".radio.optionD", tmp).attr('name','answer' + tempTotalQuestion);
				
				$(".questionOptionA", tmp).attr('name', 'question'+tempTotalQuestion+'_OptionA');
				$(".questionOptionB", tmp).attr('name', 'question'+tempTotalQuestion+'_OptionB');
				$(".questionOptionC", tmp).attr('name', 'question'+tempTotalQuestion+'_OptionC');
				$(".questionOptionD", tmp).attr('name', 'question'+tempTotalQuestion+'_OptionD');
				
				tempTotalQuestion++;
			});
		});
	});
	
	$("#btnRemoveAllQuestion").click(function(){
		$(".datarow").slideUp(function(){
			$(".datarow").remove();
		});
		totalQuestion = 1;
	});
});

function loadDegree(){
	AB.ajax({
		url: AB.serviceUri + 'createtest/getDegree',
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
		url: AB.serviceUri + 'createtest/getLevel',
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
		url: AB.serviceUri + 'createtest/getCategory',
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