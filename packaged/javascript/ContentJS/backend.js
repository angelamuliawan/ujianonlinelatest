var ddlDegree = [];
$(document).ready(function(){
	loadDegree();
	loadLevel();
	loadCategory();

	$('.ui.selection.dropdown').dropdown();
	$('.demo.menu .item').tab(); //to activate the tab menu

	/*Start Of Degree*/
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
		$(this).closest("tr").find("td.iAction").empty().append("<i class='save icon btnAddDegree link'></i>");
	});
	/*End Of Degree*/

	/*Start Of Level*/
	$("body").on('click', '.btnAddLevel', function(){
		var LevelName = $(this).closest("tr").find("input.txtLevel").val();
		var LevelID = $(this).closest("tr").find("td.iLevelID").text();
		var input = {LevelName : LevelName, LevelID : LevelID}
		AB.ajax({
		url: AB.serviceUri + 'backend/changeLevel',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadLevel();
			}	
		});
	});
	$("body").on('click', '.btnDeleteLevel', function(){
		var LevelID = $(this).closest("tr").find("td.iLevelID").text();
		var input = {LevelID : LevelID}
		AB.ajax({
		url: AB.serviceUri + 'backend/deleteLevel',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadLevel();
			}	
		});
	});

	$("body").on('click', '.btnEditLevel', function(){
		var LevelName = $(this).closest("tr").find("td.iLevelName").text();
		$(this).closest("tr").find("td.iLevelName").empty().append("<div class='ui input'><input type='text' class='txtLevel' placeholder='Input Level Name' value='"+LevelName+"'/></div>")
		$(this).closest("tr").find("td.iAction").empty().append("<i class='save icon btnAddLevel link'></i>");
	});
	/*End Of Level*/

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

				//to fill dropdown in loadCategory()
				//ddlDegree.push({value:data[i].DegreeID, text:data[i].DegreeName});
				/*for(var j =0; j<ddlDegree.length; j++)
				{
					$(".menu .ddlCat").append(
						'<div class="item" data-value="'+ddlDegree[j].value+'">'+ddlDegree.text+'</div>'
					);
				}*/
			}
			var tmp = $("#iTemplateDeg").clone().css("display", "").removeAttr("id").removeClass("loop").addClass("datarow");
			$(".iDegreeID",tmp).text('-1');
			$(".iDegreeName",tmp).append("<div class='ui input'><input type='text' class='txtDegree' placeholder='Input New Degree' /></div>");
			$(".iAction",tmp).empty().append("<i class='add icon btnAddDegree link'></i>");
			$("#tblDegree tbody").append(tmp);


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
			var table = $("#tblLevel");
			$("tbody",table).find("tr").not("#iTemplateLev").remove();
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplateLev",table).clone().css("display","").removeAttr("id");
				$(".iLevelID",newRow).text(data[i].LevelID);
				$(".iLevelName",newRow).text(data[i].LevelName);
				$("tbody",table).append(newRow);
			}
			var tmp = $("#iTemplateLev").clone().css("display", "").removeAttr("id").removeClass("loop").addClass("datarow");
			$(".iLevelID",tmp).text('-1');
			$(".iLevelName",tmp).append("<div class='ui input'><input type='text' class='txtLevel' placeholder='Input New Level' /></div>");
			$(".iAction",tmp).empty().append("<i class='add icon btnAddLevel link'></i>");
			$("#tblLevel tbody").append(tmp);
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
			var table = $("#tblCategory");
			$("tbody",table).find("tr").not("#iTemplateCat").remove();
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplateCat",table).clone().css("display","").removeAttr("id");
				$(".iCategoryID",newRow).text(data[i].CategoryID);
				$(".iCategoryName",newRow).text(data[i].CategoryName);
				//$(".iDegreeCat",newRow).text(data[i].DegreeID);
				$("tbody",table).append(newRow);
			}
			var tmp = $("#iTemplateCat").clone().css("display", "").removeAttr("id").removeClass("loop").addClass("datarow");
			$(".iCategoryID",tmp).text('-1');
			$(".iCategoryName",tmp).append("<div class='ui input'><input type='text' class='txtCategory' placeholder='Input New Category' /></div>");
			//$(".iDegreeCat",tmp).text(0);
			$(".iAction",tmp).empty().append("<i class='add icon btnAddCategory link'></i>");
			$("#tblCategory tbody").append(tmp);
		}
	});
}