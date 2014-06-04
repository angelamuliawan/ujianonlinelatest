var objTestDetail = new Array();
var objTestDetailAnswer = new Array();
var curTestID = 0;
var TestName = '';
$(document).ready(function(){
	
	var TestID = $("#hdnTestID").val();
	
	$('.ui.checkbox').checkbox();
	// question event
	AB.ajax({
		url: AB.serviceUri + 'taketest/getQuestionList',
		type: 'post',
		dataType: 'json',
		data : JSON.stringify({TestID : TestID}),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			objTestDetail = new Array();
			for(var i = 0; i < data.length; i++)
			{
				objTestDetail.push({
					'QuestionDescription' : data[i].TestQuestion
				});
			}
			
			AB.ajax({
				url: AB.serviceUri + 'taketest/getOptionList',
				type: 'post',
				dataType: 'json',
				data : JSON.stringify({TestID : TestID}),
				contentType: 'application/json;charset=utf-8',
				success:function(data){
					var counter = 0;
					objTestDetailAnswer[counter] = new Array();
					for(var i = 0; i < data.length; i++)
					{
						if(i % 4 == 0){
							counter++;
							objTestDetailAnswer[counter] = new Array();
						}
						objTestDetailAnswer[counter].push({
							'OptionDescription' : data[i].TestDetailAnswerName,
							'OptionURL' : data[i].TestDetailURL
						});
					}
					
					// append template
					for(var i = 0; i < objTestDetail.length; i++){
						var tmp = $("#iTemplateQuestion").clone().removeAttr("id").addClass("datarow").css('display','');
						
						// set number of question
						$(".ui.header", tmp).text("Question No. " + (i+1));
						
						$("#txtTestQuestion", tmp).attr('name', 'question_desc' + (i+1));
						$("#txtTestQuestion", tmp).append(objTestDetail[i].QuestionDescription);
						
						$(".radio.optionA", tmp).attr('name','answer' + (i+1));
						$(".radio.optionB", tmp).attr('name','answer' + (i+1));
						$(".radio.optionC", tmp).attr('name','answer' + (i+1));
						$(".radio.optionD", tmp).attr('name','answer' + (i+1));
						
						$(".questionOptionA", tmp).attr('name', 'question'+(i+1)+'_OptionA');
						$(".questionOptionB", tmp).attr('name', 'question'+(i+1)+'_OptionB');
						$(".questionOptionC", tmp).attr('name', 'question'+(i+1)+'_OptionC');
						$(".questionOptionD", tmp).attr('name', 'question'+(i+1)+'_OptionD');
						
						$(".questionOptionA",tmp).val(objTestDetailAnswer[i+1][0]['OptionDescription']);
						$(".questionOptionB",tmp).val(objTestDetailAnswer[i+1][1]['OptionDescription']);
						$(".questionOptionC",tmp).val(objTestDetailAnswer[i+1][2]['OptionDescription']);
						$(".questionOptionD",tmp).val(objTestDetailAnswer[i+1][3]['OptionDescription']);
						
						$("#btnSaveAllQuestion").before(tmp);
						$('.ui.checkbox').checkbox();
					}
				}
			});
		}
	});
	
	$("#btnFinalizeAnswer").click(function(){
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
	
});