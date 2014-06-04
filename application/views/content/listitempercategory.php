<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<style>
</style>
<input type="hidden" id="hdnCategoryID" value="<?php echo $CategoryID;?>" />
<script src="<?=$domain?>/packaged/javascript/ContentJS/listitempercategory.js"></script>
<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">List Item Per Category</h2>
	  	<a href="<?=$domain?>/listcategory" class="item-popup" data-variation="small" data-content="Back" style="float:right;margin-top:-38px;">
	  		<i class="left basic icon"></i>
		</a>
	  	<!-- Content -->
		<div class="ui list">
		  <div class="item">
		    <div id="passedDegree" class="header">Degree :</div>
		  </div>
		  <div class="item">
		    <div id="passedCategory" class="header">Category :</div>
		  </div>
		 </div>
		 <!--Table -->
		 <table class="ui table segment" id="tableListItemPerCategory">
		  	<thead>
			    <tr>
			    	<th>Name</th>
				    <th>Description</th>
				    <th>Passed By</th>
			  	</tr>
			</thead>
			<tbody>
			    <tr id="iListTemplate" style="display:none;">
					<td>
						<a href="#" class="iTestName"></a>
					</td>
					<td class="iTestDescription"></td>
					<td class="iTotalPassedBy"></td>
			    </tr>
			</tbody>
		</table>
		<!-- End Of Table -->
		<!-- End Of Content -->
	</div>
</div>