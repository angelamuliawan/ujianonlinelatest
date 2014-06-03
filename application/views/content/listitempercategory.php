<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<style>
</style>
<input type="hidden" id="hdnCategoryID" />
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
		    <div class="header">Degree:</div>
		   	University
		  </div>
		  <div class="item">
		    <div class="header">Category:</div>
		    Anapersis
		  </div>
		 </div>
		 <!--Table -->
		 <table class="ui table segment">
		  	<thead>
			    <tr>
			    	<th>Name</th>
				    <th>Description</th>
				    <th>Passed By</th>
			  	</tr>
			</thead>
			<tbody>
			    <tr>
			      <td>
			      	<a href="#">Latihan UTS</a>
			      </td>
			      <td>Anapersis kisi2 uts</td>
			      <td>100 people</td>
			    </tr>
			    <tr>
			      <td>
			      	<a href="#">Compiler Step</a>
			      </td>
			      <td>kisi2 uts tekom</td>
			      <td>500 people</td>
			    </tr>
			  </tbody>
		</table>
		<!-- End Of Table -->
		<!-- End Of Content -->
	</div>
</div>