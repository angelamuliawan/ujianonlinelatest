var objTestDetail = new Array();
var objTestDetailAnswer = new Array();
var TestID = 0;
var TestName = '';
var email = null;
var isInvited = 0;
var objUserAnswerDetail = new Array();

$(document).ready(function(){
	
	TestID = $("#hdnTestID").val();
	
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
					'TestDetailID' : data[i].TestDetailID,
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
							'TestDetailAnswerID' : data[i].TestDetailAnswerID,
							'OptionDescription' : data[i].TestDetailAnswerName,
							'OptionURL' : data[i].TestDetailURL
						});
					}
					
					// append template
					for(var i = 0; i < objTestDetail.length; i++){
						var tmp = $("#iTemplateQuestion").clone().removeAttr("id").addClass("datarow").css('display','');
						
						// set number of question
						$(".ui.header", tmp).text("Question No. " + (i+1)).attr('data-id', objTestDetail[i].TestDetailID);
						
						$("#txtTestQuestion", tmp).attr('name', 'question_desc' + (i+1));
						$("#txtTestQuestion", tmp).append(objTestDetail[i].QuestionDescription);
						
						$(".radio.optionA", tmp).attr('name','answer' + (i+1)).val(objTestDetailAnswer[i+1][0]['TestDetailAnswerID']);
						$(".radio.optionB", tmp).attr('name','answer' + (i+1)).val(objTestDetailAnswer[i+1][1]['TestDetailAnswerID']);
						$(".radio.optionC", tmp).attr('name','answer' + (i+1)).val(objTestDetailAnswer[i+1][2]['TestDetailAnswerID']);
						$(".radio.optionD", tmp).attr('name','answer' + (i+1)).val(objTestDetailAnswer[i+1][3]['TestDetailAnswerID']);
						
						$(".questionOptionA", tmp).attr('name', 'question'+(i+1)+'_OptionA');
						$(".questionOptionB", tmp).attr('name', 'question'+(i+1)+'_OptionB');
						$(".questionOptionC", tmp).attr('name', 'question'+(i+1)+'_OptionC');
						$(".questionOptionD", tmp).attr('name', 'question'+(i+1)+'_OptionD');
						
						$(".questionOptionA",tmp).val(objTestDetailAnswer[i+1][0]['OptionDescription']);
						$(".questionOptionB",tmp).val(objTestDetailAnswer[i+1][1]['OptionDescription']);
						$(".questionOptionC",tmp).val(objTestDetailAnswer[i+1][2]['OptionDescription']);
						$(".questionOptionD",tmp).val(objTestDetailAnswer[i+1][3]['OptionDescription']);
						
						$("#btnFinalizeAnswer").before(tmp);
						$('.ui.checkbox').checkbox();
					}
					
					if($.session.get('userlogin') === undefined){
						$("#btnFinalizeAnswer").before('<input type="text" id="txtEmail" placeholder="Input email ...">');
					}
				}
			});
		}
	});
	
	$("#btnFinalizeAnswer").click(function(){
	
		// set user email, if loggedin, then set to null
		if($.session.get('userlogin') === undefined){
			email = $("#txtEmail").val();
			isInvited = 1; // for public, 1 for private
		}
		objUserAnswerDetail = new Array();
		$(".column.datarow").each(function(){
			var tmp = $(this);
			
			var TestDetailID = $(".ui.header", tmp).attr('data-id');
			var TestDetailAnswerID = $(".radio :checked", tmp).val();
			
			objUserAnswerDetail.push({
				'TestDetailID' : TestDetailID,
				'TestDetailAnswerID' : TestDetailAnswerID
			});
		});

		var objParam = {
			listUserAnswerDetail : objUserAnswerDetail,
			TestID : TestID,
			email : email,
			isInvited : isInvited
		}
		
		
		AB.ajax({
			url: AB.serviceUri + 'taketest/insertUserAnswer',
			type: 'post',
			dataType: 'json',
			data:JSON.stringify(objParam),
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				alert("Your answer was successfully submitted");
				AB.ajax({
					url: AB.serviceUri + 'taketest/checkUserAnswer',
					type: 'post',
					dataType: 'json',
					data:JSON.stringify({ TestID : TestID, email : email}),
					contentType: 'application/json;charset=utf-8',
					success:function(data){
						console.log(data[0])
						var split = data[0].RightTotalAnswer.split('/');
						alert("Your total right answer is " + split[0] + ' out of ' + split[1] + ' question.');
						location.href = AB.serviceURI + 'mypaseedtest';
					}	
				});
			}	
		});

	});
	
});