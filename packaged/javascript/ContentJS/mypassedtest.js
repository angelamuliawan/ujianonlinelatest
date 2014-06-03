$(document).ready(function(){
	loadPassedTest();

});

function loadPassedTest()
{
	AB.ajax({
		url: AB.serviceUri + 'mypassedtest/getPassedTest',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			var table = $("#tblPassedTest");
			var access;
			$("tbody",table).find("tr").not("#iTemplatePasTest").remove();
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplatePasTest",table).clone().css("display","").removeAttr("id");
				$(".iTestID",newRow).text(data[i].TestID);
				$(".iDate",newRow).text(data[i].Date);
				$(".iTestName",newRow).text(data[i].TestName);
				$(".iDegree",newRow).text(data[i].DegreeName);
				$(".iCategory",newRow).text(data[i].CategoryName);
				$(".iLevel",newRow).text(data[i].LevelName);
				$(".iScore",newRow).text(data[i].Score);
				$("tbody",table).append(newRow);
			}
		}
	});
}