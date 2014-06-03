<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/mypassedtest.js"></script>

<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">My Passed Test</h2>
	  	<!-- Content -->
	  	<div class="ui segment">
	  		<!--Table -->
			<table class="ui table segment" id="tblPassedTest" width="50">
			  	<thead>
				    <tr>
				    	<th>Date</th>
					    <th>Test Name</th>
					    <th>Degree</th>
					    <th>Category</th>
					    <th>Level</th>
					    <th>Score</th>
				  	</tr>
				</thead>
				<tbody>
					<tr id="iTemplatePasTest" style="display:none" class="loop">
						<td class="iTestID" style="display:none"></td>
						<td class="iDate"></td>
						<td class="iTestName"></td>
						<td class="iDegree"></td>
						<td class="iCategory"></td>
						<td class="iLevel"></td>
						<td class="iScore" style="width:50px;"></i></td>
					</tr>
				 </tbody>
			</table>
			<!-- End Of Table -->
	  	</div>
		<!-- End Of Content -->
	</div>
</div>