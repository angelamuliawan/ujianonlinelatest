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
	
});