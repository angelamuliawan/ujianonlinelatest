<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<style>
</style>
<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">Backend</h2>
	  	<!-- Content -->
	  	<h4>Degree</h4>
		 <!--Table -->
		 <table class="ui table segment">
		  	<thead>
			    <tr>
			    	<th>Name</th>
				    <th>Action</th>
			  	</tr>
			</thead>
			<tbody>
				<tr id="iTemplate"style="display:none"class="loop" >
					<td class="iDegreeID" style="display:none"></td>
					<td class="iDegreeName"></td>
					<td>
						<i class="edit icon btnEditDegree"></i>
						<i class="trash icon btnDeleteDegree"></i>
					</td>
				</tr>
			 </tbody>
		</table>
		<!-- End Of Table -->
		<!-- End Of Content -->
	</div>
</div>