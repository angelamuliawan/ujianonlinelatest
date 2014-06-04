<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/backend.js"></script>

<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">Backend</h2>
	  	<!-- Content -->
	  	<div class="ui pointing secondary demo menu">
		  <a class="active blue item" data-tab="level">Level</a>
		  <a class="blue item" data-tab="degree">Degree</a>
		  <a class="blue item" data-tab="category">Category</a>
		  <a class="blue item" data-tab="user">User</a>
		  <a class="blue item" data-tab="test">Test</a>
		</div>

		<div class="ui tab segment" data-tab="level">
			<!--Level Section-->
		  	<h4>Level</h4>
			 <!--Table -->
			 <table class="ui table segment" id="tblLevel" width="50">
			  	<thead>
				    <tr>
				    	<th>Level Name</th>
					    <th>Action</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplateLev"style="display:none" class="loop">
						<td class="iLevelID" style="display:none"></td>
						<td class="iLevelName"></td>
						<td class="iAction">
							<i class="edit icon btnEditLevel link" ></i>
							<i class="trash icon btnDeleteLevel link"></i>
						</td>
					</tr>
				 </tbody>
			</table>
			<!-- End Of Table -->
			<!--End Of Level Section-->	
		</div>
		<div class="ui tab segment" data-tab="degree">
			<!--Degree Section-->
		  	<h4>Degree</h4>
			 <!--Table -->
			 <table class="ui table segment" id="tblDegree" width="50">
			  	<thead>
				    <tr>
				    	<th>Name</th>
					    <th>Action</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplateDeg"style="display:none" class="loop">
						<td class="iDegreeID" style="display:none"></td>
						<td class="iDegreeName"></td>
						<td class="iAction">
							<i class="edit icon btnEditDegree link" ></i>
							<i class="trash icon btnDeleteDegree link"></i>
						</td>
					</tr>
				 </tbody>
			</table>
			<!-- End Of Table -->
			<!--End Of Degree Section-->
		</div>
		<div class="ui tab segment" data-tab="category">
			<!--Category Section-->
		  	<h4>Degree</h4>
			 <!--Table -->
			 <table class="ui table segment" id="tblCategory" width="50">
			  	<thead>
				    <tr>
				    	<th>Category Name</th>
				    	<th>Degree</th>
					    <th>Action</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplateCat"style="display:none" class="loop">
						<td class="iCategoryID" style="display:none"></td>
						<td class="iCategoryName"></td>
						<td class="iDegreeCat">
							<div class="ui fluid selection dropdown" id="degreecat">
								<div class="default text">Select</div>
								<i class="dropdown icon"></i>
								<input type="hidden" name="degreecatval" id="degreecatval">
								<div class="menu ddlCat">
									<!--<div class="item" data-value="individu">Individual</div>
									<div class="item" data-value="company">Company</div>-->
								</div>
					    	</div>

						</td>
						<td class="iActionCat">
							<i class="edit icon btnEditCategory link" ></i>
							<i class="trash icon btnDeleteCategory link"></i>
						</td>
					</tr>
				 </tbody>
			</table>
			<!-- End Of Table -->
			<!--End Of Category Section-->
		</div>
		<div class="ui tab segment" data-tab="user">
			<h4>User</h4>
			<table class="ui table segment" id="tblUser" width="50">
			  	<thead>
				    <tr>
				    	<th>Username</th>
				    	<th>Fullname</th>
				    	<th>Email</th>
				    	<th>Type</th>
				    	<th>Total Created</th>
						<th>Total Passed</th>
					    <th>Action</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplateUser"style="display:none" class="loop">
						<td class="iUserID" style="display:none"></td>
						<td class="iUsername"></td>
						<td class="iFullName"></td>
						<td class="iEmail"></td>
						<td class="iType"></td>
						<td class="iCount1"></td>
						<td class="iCount2"></td>
						<td class="iActionCat">
							<i class="trash icon btnDeleteUser link"></i>
						</td>
					</tr>
				 </tbody>
			</table>
		</div>
		<div class="ui tab segment" data-tab="test">
			<table class="ui table segment" id="tblCreationTest" width="50">
			  	<thead>
				    <tr>
				    	<th>Publish On</th>
					    <th>Test Name</th>
					    <th>Degree</th>
					    <th>Category</th>
					     <th>Level</th>
					    <th>Type</th>
					    <th>Number Of People</th>
					    <th>Delete</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplateCreTest" style="display:none" class="loop">
						<td class="iTestID" style="display:none"></td>
						<td class="iPublish"></td>
						<td class="iTestName"></td>
						<td class="iDegree"></td>
						<td class="iCategory"></td>
						<td class="iLevel"></td>
						<td class="iType"></td>
						<td class="iNumberOfPeople" style="width:50px;"></i></td>
						<td><i class="trash icon btnDeleteTest link"></i></td>
					</tr>
				 </tbody>
			</table>
		</div>

		<!-- End Of Content -->
	</div>
</div>