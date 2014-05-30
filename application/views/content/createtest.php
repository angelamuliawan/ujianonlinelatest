<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/createtest.js"></script>

<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">Create Test</h2>
	  	<!-- Content -->
	  	<div class="ui form segment">
	  	<form id="formCreateTest">
		    <div class="field">
		        <label>Test Name</label>
		        <div class="ui left labeled input">
		          <input placeholder="Type your test name here..." type="text" name="testname" id="testname">
		        </div>
		    </div>
		    <div class="field">
		        <label>Description</label>
		        <div class="ui left labeled input">
		          <input placeholder="Type your test description here..." type="text" name="description" id="description">
		        </div>
		    </div>
		    <div class="field">
		        <label>User Type</label>
		        <div class="ui fluid selection dropdown">
					<div class="default text">Select</div>
					<i class="dropdown icon"></i>
					<input type="hidden" name="degree" id="degree">
					<div class="menu ddlDegree">
						<!--<div class="item" data-value="individu">Individual</div>
						<div class="item" data-value="company">Company</div>-->
					</div>
		    	</div>
		    </div>
      	<div class="ui blue submit button" id="btnRegister">Register</div>
      	</form>
    	</div>
		<!-- End Of Content -->
	</div>
</div>