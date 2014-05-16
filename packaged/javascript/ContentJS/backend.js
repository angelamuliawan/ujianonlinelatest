$(document).ready(function(){
	loadDegree();

	$("body").on('click', '.btnAddDegree', function(){
		var DegreeName = $(this).closest("tr").find("input.txtDegree").val();
		var DegreeID = $(this).closest("tr").find("td.iDegreeID").text();
		var input = {DegreeName : DegreeName, DegreeID : DegreeID}
		AB.ajax({
		url: AB.serviceUri + 'backend/changeDegree',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadDegree();
			}	
		});
	});
	$("body").on('click', '.btnDeleteDegree', function(){
		var DegreeID = $(this).closest("tr").find("td.iDegreeID").text();
		var input = {DegreeID : DegreeID}
		AB.ajax({
		url: AB.serviceUri + 'backend/deleteDegree',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadDegree();
			}	
		});
	});

	$("body").on('click', '.btnEditDegree', function(){
		var DegreeName = $(this).closest("tr").find("td.iDegreeName").text();
		$(this).closest("tr").find("td.iDegreeName").empty().append("<div class='ui input'><input type='text' class='txtDegree' placeholder='Input Degree Name' value='"+DegreeName+"'/></div>")
		$(this).closest("tr").find("td.iAction").empty().append("<i class='add icon btnAddDegree link'></i>");
	});
});

function loadDegree(){
	AB.ajax({
		url: AB.serviceUri + 'backend/getDegree',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			var table = $("#tblDegree");
			$("tbody",table).find("tr").not("#iTemplateDeg").remove();
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplateDeg",table).clone().css("display","").removeAttr("id");
				$(".iDegreeID",newRow).text(data[i].DegreeID);
				$(".iDegreeName",newRow).text(data[i].DegreeName);
				$("tbody",table).append(newRow);
			}
			var tmp = $("#iTemplateDeg").clone().css("display", "").removeAttr("id").removeClass("loop").addClass("datarow");
			$(".iDegreeID",tmp).text(-1);
			$(".iDegreeName",tmp).append("<div class='ui input'><input type='text' class='txtDegree' placeholder='Input New Degree' /></div>");
			$(".iAction",tmp).empty().append("<i class='add icon btnAddDegree link'></i>");
			$("#tblDegree tbody").append(tmp);
		}
	});
}