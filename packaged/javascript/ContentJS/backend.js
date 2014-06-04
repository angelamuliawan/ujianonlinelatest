var ddlDegree = [];
$(document).ready(function(){
	loadDegree();
	loadLevel();
	loadCategory();
	loadUser();
	loadTest();

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

	/*Start Of Category*/
	$("body").on('click', '.btnAddCategory', function(){
		var CategoryName = $(this).closest("tr").find("input.txtCategory").val();
		var DegreeID = $(this).closest("tr").find("input#degreecatval").val();
		var CategoryID = $(this).closest("tr").find("td.iCategoryID").text();
		var input = {CategoryName : CategoryName, DegreeID : DegreeID, CategoryID : CategoryID}
		console.log(input);
		AB.ajax({
		url: AB.serviceUri + 'backend/changeCategory',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadCategory();
			}	
		});
	});
	$("body").on('click', '.btnDeleteCategory', function(){
		var CategoryID = $(this).closest("tr").find("td.iCategoryID").text();
		var input = {CategoryID : CategoryID}
		AB.ajax({
		url: AB.serviceUri + 'backend/deleteCategory',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadCategory();
			}	
		});
	});

	$("body").on('click', '.btnDeleteUser', function(){
		var UserID = $(this).closest("tr").find("td.iUserID").text();
		var input = {UserID : UserID}
		AB.ajax({
		url: AB.serviceUri + 'backend/deleteUser',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadUser();
			}	
		});
	});

	$("body").on('click', '.btnDeleteTest', function(){
		var TestID = $(this).closest("tr").find("td.iTestID").text();
		var input = {TestID : TestID}
		AB.ajax({
		url: AB.serviceUri + 'backend/deleteTest',
		type: 'post',
		dataType: 'json',
		data:JSON.stringify(input),
		contentType: 'application/json;charset=utf-8',
		success:function(data){
				loadTest();
			}	
		});
	});

	$("body").on('click', '.btnEditCategory', function(){
		var CategoryName = $(this).closest("tr").find("td.iCategoryName").text();
		$(this).closest("tr").find("td.iCategoryName").empty().append("<div class='ui input'><input type='text' class='txtCategory' placeholder='Input Category Name' value='"+CategoryName+"'/></div>")
		$(this).closest("tr").find("td.iActionCat").empty().append("<i class='save icon btnAddCategory link'></i>");
	});
	/*End Of Category*/

});

function loadDegree(){
	AB.ajax({
		url: AB.serviceUri + 'backend/getDegree',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(data){
			ddlDegree = data;
			console.log(data);
			console.log(ddlDegree);
			var table = $("#tblDegree");
			$("tbody",table).find("tr").not("#iTemplateDeg").remove();
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplateDeg",table).clone().css("display","").removeAttr("id");
				$(".iDegreeID",newRow).text(data[i].DegreeID);
				$(".iDegreeName",newRow).text(data[i].DegreeName);
				$("tbody",table).append(newRow);

				$(".menu.ddlCat").append(
					'<div class="item" data-value="'+data[i].DegreeID+'">'+data[i].DegreeName+'</div>'
				);
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
			console.log(ddlDegree[0]);
			var stringDDL = '';
			var table = $("#tblCategory");
			//console.log(table);
			$("tbody",table).find("tr").not("#iTemplateCat").remove();
			
			//console.log(table);
			
			for(var i = 0; i<data.length; i++)
			{
				var newRow = $("#iTemplateCat",table).clone().css("display","").removeAttr("id");
				$(".iCategoryID",newRow).text(data[i].CategoryID);
				$(".iCategoryName",newRow).text(data[i].CategoryName);
				for(a=0;a<ddlDegree.length;a++)
				{
					if(ddlDegree[a].DegreeID == data[i].DegreeID)
					{stringDDL = ddlDegree[a].DegreeName;break;}

				}
				$(".iDegreeCat .default",newRow).text(stringDDL);
				$("tbody",table).append(newRow);
			}
			var tmp = $("#iTemplateCat").clone().css("display", "").removeAttr("id").removeClass("loop").addClass("datarow");
			$(".iCategoryID",tmp).text('-1');
			$(".iCategoryName",tmp).append("<div class='ui input'><input type='text' class='txtCategory' placeholder='Input New Category' /></div>");
			$(".iActionCat",tmp).empty().append("<i class='add icon btnAddCategory link'></i>");
			$("#tblCategory tbody").append(tmp);
			
			$('.ui.selection.dropdown').dropdown();
		}
	});
}

function loadUser(){
	AB.ajax({
		url: AB.serviceUri + 'backend/GetUserAndAnswer',
		type: 'post',
		dataType: 'json',
		contentType: 'application/json;charset=utf-8',
		success:function(dataTemp){
			var table = $("#tblUser");
			$("tbody",table).find("tr").not("#iTemplateUser").remove();
			for(var i = 0; i<dataTemp.length; i++)
			{
				var newRow = $("#iTemplateUser",table).clone().css("display","").removeAttr("id");
				$(".iUserID",newRow).text(dataTemp[i].UserID);
				$(".iUsername",newRow).text(dataTemp[i].UserName);
				$(".iFullName",newRow).text(dataTemp[i].FullName);
				$(".iEmail",newRow).text(dataTemp[i].Email);
				$(".iType",newRow).text(dataTemp[i].UserType);
				$(".iCount1",newRow).text(dataTemp[i].CreateTest);
				$(".iCount2",newRow).text(dataTemp[i].PassedTest);
				$("tbody",table).append(newRow);
			}
		}
	});
	
}

function loadTest(){
	AB.ajax({
		url: AB.serviceUri + 'backend/GetAllTest',
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
				$(".iNumberOfPeople",newRow).text(data[i].NumberOfPeople);
				$("tbody",table).append(newRow);
			}
		}
	});
}