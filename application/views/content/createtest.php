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
		<h2 class="ui dividing header createTest">Create Test</h2>
	  	<!-- Content -->
	  	<div class="ui form segment createTest">
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
							<input type="radio" checked="checked" value="1" class="radio" name="accessType" >
							<label>Public</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" class="radio" value="0" name="accessType">
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
				
				<div class="ui blue button small" id="btnCreateTest">Lets customize test</div>
			</form>
    	</div>
		<!-- End Of Content -->
		
		<!-- Title -->
		<h2 class="ui dividing header listQuestion" style="display:none;">List Question</h2>
	  	<!-- Content -->
	  	<div class="ui form segment listQuestion" style="display:none;">
			<form id="formQuestion">
				
				<!-- template, not displayed -->
				<div class="column iTemplateQuestion" style="display:none;">
					<div class="ui fluid form segment">
					  <h3 class="ui header">Question X</h3>
					  <div class="field">
						  <input type="text" class="questionDescription" placeholder="Type question here ...">
						</div>
					  <div class="two fields">
						<div class="field">
						  <div class="ui radio checkbox">
							<input type="radio" checked="checked" value="1" class="radio optionA" >
							<label>Option A</label>
						  </div>
						  <input type="text" class="questionOptionA" placeholder="Type answer here...">
						  <br/><div class="column"><i class="upload icon"></i>Upload File</div>
						</div>
						<div class="field">
						  <div class="ui radio checkbox">
							<input type="radio" value="0" class="radio optionB" >
							<label>Option B</label>
						  </div>
						  <input type="text" class="questionOptionB" placeholder="Type answer here...">
						  <br/><div class="column"><i class="upload icon"></i>Upload File</div>
						</div>
					  </div>
					  <div class="two fields">
						<div class="field">
						  <div class="ui radio checkbox">
							<input type="radio" value="0" class="radio optionC" >
							<label>Option C</label>
						  </div>
						  <input type="text" class="questionOptionC" placeholder="Type answer here...">
						  <br/><div class="column"><i class="upload icon"></i>Upload File</div>
						</div>
						<div class="field">
						  <div class="ui radio checkbox">
							<input type="radio" value="0" class="radio optionD" >
							<label>Option D</label>
						  </div>
						  <input type="text" class="questionOptionD" placeholder="Type answer here...">
						  <br/><div class="column"><i class="upload icon"></i>Upload File</div>
						</div>
					  </div>
					  
					  <div class="ui red button small btnDeleteQuestion">Delete this question</div>
					</div>
				</div>
				
				
				<div class="ui green button small" id="btnAddQuestion">Add Question</div>
				<div class="ui red button small" id="btnRemoveAllQuestion">Remove all question</div>
				<div class="ui blue button small" id="btnSaveAllQuestion">Save Sheet</div>
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