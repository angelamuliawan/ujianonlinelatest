<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/mycreationtest.js"></script>

<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">My Creation Test</h2>
	  	<!-- Content -->
	  	<div class="ui segment">
	  		<!--Table -->
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
					    <th>Print</th>
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
						<td><i class="print icon iPrint link"></i></td>
					</tr>
				 </tbody>
			</table>
			<!-- End Of Table -->
	  	</div>
		<!-- End Of Content -->
	</div>
</div>

<!-- Start Of Modal Login Register -->
<div class="ui peoplemodal modal">
	<i class="close icon"></i>
	<div class="header">
	    People Score
	 </div>
	<div class="content">
		<table class="ui table segment" id="tblNumberOfPeople" width="50">
		  	<thead>
			    <tr>
			    	<th>Name/Email</th>
				    <th>Type</th>
				    <th>Right Answer/Total Question</th>
			  	</tr>
			</thead>
			<tbody>
				<tr id="iTemplateNumOfPeople" style="display:none" class="loop">
					<td class="iName"></td>
					<td class="iType"></td>
					<td class="iNumber"></td>
				</tr>
			 </tbody>
		</table>
	 </div>
</div>
<!-- End Of Modal Login Register -->