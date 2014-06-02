<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/createtest.js"></script>

<link rel="stylesheet" href="<?=$domain?>/packaged/javascript/datepicker/lib/themes/default.css" id="theme_base">
<link rel="stylesheet" href="<?=$domain?>/packaged/javascript/datepicker/lib/themes/default.date.css" id="theme_date">
<link rel="stylesheet" href="<?=$domain?>/packaged/javascript/datepicker/lib/themes/default.time.css" id="theme_time">


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
					<label>Degree</label>
					<div class="ui fluid selection dropdown">
						<div class="default text">Select</div>
						<i class="dropdown icon"></i>
						<input type="hidden" name="hdnDegree" id="hdnDegree">
						<div class="menu ddlDegree">
							<!--<div class="item" data-value="individu">Individual</div>
							<div class="item" data-value="company">Company</div>-->
						</div>
					</div>
				</div>
				<div class="field">
					<label>Category</label>
					<div class="ui fluid selection dropdown">
						<div class="default text">Select</div>
						<i class="dropdown icon"></i>
						<input type="hidden" name="hdnCategory" id="hdnCategory">
						<div class="menu ddlCategory">
							<!--<div class="item" data-value="individu">Individual</div>
							<div class="item" data-value="company">Company</div>-->
						</div>
					</div>
				</div>
				<div class="field">
					<label>Level</label>
					<div class="ui fluid selection dropdown">
						<div class="default text">Select</div>
						<i class="dropdown icon"></i>
						<input type="hidden" name="hdnLevel" id="hdnLevel">
						<div class="menu ddlLevel">
							<!--<div class="item" data-value="individu">Individual</div>
							<div class="item" data-value="company">Company</div>-->
						</div>
					</div>
				</div>
				<div class="grouped inline fields">
					<label>Access Type</label>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" checked="checked" value="public" class="radio" name="accessType" >
							<label>Public</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" class="radio" value="private" name="accessType">
							<label>Private</label>
						</div>
					</div>
				</div>
				
				<div class="grouped inline fields">
					<label>Publish on</label>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" checked="checked" value="forever" class="radio" name="publishDate" >
							<label>Forever</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" value="date" class="radio" name="publishDate">
							<label>Datepicker</label>
						</div>
					</div>
				</div>
				<div class="field dateRange" style="display:none;">
					<div class="ui left labeled input">
						<input id="startDate" class="fieldset__input js__datepicker" type="text" placeholder="Start Date">
					</div>
				</div>
				<div class="field dateRange" style="display:none;">
					<div class="ui left labeled input">
						<input id="endDate" class="fieldset__input js__datepicker" type="text" placeholder="End Date">
					</div>
				</div>
				
				<div class="field">    
					<label style="width:190px;">Shared Material</label>
					<input type="text" name="sharedMaterial" id="sharedMaterial" value="" disabled="disabled" />
					<input type="hidden" id="FileExtention" value="" />
					<div id="fine-uploader-basic" class="ui blue button small">Browse Material</div>
				</div>
				
				<div class="ui blue submit button" id="btnCreateTest">Lets customize test</div>
			</form>
    	</div>
		<!-- End Of Content -->
	</div>
</div>

<script src="<?=$domain?>/packaged/javascript/datepicker/lib/picker.js"></script>
<script src="<?=$domain?>/packaged/javascript/datepicker/lib/picker.date.js"></script>
<script src="<?=$domain?>/packaged/javascript/datepicker/lib/picker.time.js"></script>
<script src="<?=$domain?>/packaged/javascript/datepicker/lib/legacy.js"></script>
<script src="<?=$domain?>/packaged/javascript/datepicker/demo/scripts/demo.js"></script>
<script src="<?=$domain?>/packaged/javascript/datepicker/demo/scripts/rainbow.js"></script>