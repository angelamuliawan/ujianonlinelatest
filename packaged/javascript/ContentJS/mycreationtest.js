$(document).ready(function(){
	loadCreationTest();

	$("body").on('click', '.iSearch', function(){
		var testid = $(this).closest('tr').find('td.iTestID').text();
		var input = { testid : testid}
		AB.ajax({
			url: AB.serviceUri + 'mycreationtest/getNumberOfPeople',
			type: 'post',
			data:JSON.stringify(input),
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			success:function(data){
				var table = $("#tblNumberOfPeople");
				$("tbody",table).find("tr").not("#iTemplateNumOfPeople").remove();
				for(var i = 0; i<data.length; i++)
				{
					var newRow = $("#iTemplateNumOfPeople",table).clone().css("display","").removeAttr("id");
					$(".iName",newRow).text(data[i].Name);
					$(".iType",newRow).text(data[i].Type);
					$(".iNumber",newRow).text(data[i].RightTotalAnswer);
					$("tbody",table).append(newRow);
				}
			}
		});
	})
});

function loadCreationTest()
{
	AB.ajax({
		url: AB.serviceUri + 'mycreationtest/getCreationTest',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			var table = $("#tblCreationTest");
			var access;
			$("tbody",table).find("tr").not("#iTemplateCreTest").remove();
			for(var i = 0; i<data.length; i++)
			{
				access = (data[i].AccessType == 1)?('Private'):('Public');
				var newRow = $("#iTemplateCreTest",table).clone().css("display","").removeAttr("id");
				$(".iTestID",newRow).text(data[i].TestID);
				$(".iPublish",newRow).text(data[i].PublishDate);
				$(".iTestName",newRow).text(data[i].TestName);
				$(".iDegree",newRow).text(data[i].DegreeName);
				$(".iCategory",newRow).text(data[i].CategoryName);
				$(".iLevel",newRow).text(data[i].LevelName);
				$(".iType",newRow).text(access);
				$(".iNumberOfPeople",newRow).append(data[i].NumberOfPeople+'<i class="search icon iSearch link openmodalpeople" style="position:absolute;">');
				$("tbody",table).append(newRow);
				$('.peoplemodal.modal').modal('attach events', '.openmodalpeople', 'show');
			}
		}
	});
}