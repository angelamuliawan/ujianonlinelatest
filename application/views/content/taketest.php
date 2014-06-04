<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/taketest.js"></script>
<input type="hidden" id="hdnTestID" value="<?php echo $TestID;?>" />
<div class="segment">
	<div class="container">

		<!-- Title -->
		<h2 class="ui dividing header">Test name</h2>
	  	<!-- Content -->
	  	<div class="ui form segment">
			<form id="formQuestion">
				<!-- template, not displayed -->
				<div class="column" id="iTemplateQuestion" style="display:none;">
					<div class="ui fluid form segment">
						<h3 class="ui header">Question No.</h3>
						<div class="field" id="txtTestQuestion"></div>
						<div class="two fields">
							<div class="field">
								<div class="ui radio checkbox">
								<input type="radio" checked="checked" value="1" class="radio optionA" >
								<label>Option A</label>
							</div>
							<input type="text" disabled="disabled" class="questionOptionA">
							<!-- Image goes here -->
							</div>
							<div class="field">
								<div class="ui radio checkbox">
								<input type="radio" value="0" class="radio optionB" >
								<label>Option B</label>
							</div>
							<input type="text" disabled="disabled" class="questionOptionB">
							<!-- Image goes here -->
							</div>
						</div>
						
						<div class="two fields">
							<div class="field">
								<div class="ui radio checkbox">
								<input type="radio" value="0" class="radio optionC" >
								<label>Option C</label>
							</div>
							<input type="text" disabled="disabled" class="questionOptionC" />
							<!-- Image goes here -->
							</div>
							<div class="field">
								<div class="ui radio checkbox">
								<input type="radio" value="0" class="radio optionD" >
								<label>Option D</label>
							</div>
							<input type="text" disabled="disabled" class="questionOptionD">
							<!-- Image goes here -->
							</div>
						</div>
					</div>
				</div>

				<div class="ui blue button small" id="btnFinalizeAnswer">Finalize Answer</div>
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