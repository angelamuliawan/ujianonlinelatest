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

		</div>
		<div class="ui tab segment" data-tab="user">

		</div>
		<div class="ui tab segment" data-tab="test">

		</div>

		<!-- End Of Content -->
	</div>
</div>