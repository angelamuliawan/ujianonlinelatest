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
				<tr id="iTemplateDeg"style="display:none" class="loop">
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

		<!-- End Of Content -->
	</div>
</div>