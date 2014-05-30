<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/register.js"></script>

<div class="segment">
	<div class="container">
		<!-- Title -->
	  <h2 class="ui dividing header">Register</h2>
	  	<!-- Content -->
	  	<div class="ui form segment">
	  	<form id="formRegister">
		    <div class="field">
		        <label>Username</label>
		        <div class="ui left labeled input">
		          <input placeholder="Type your username here..." type="text" name="username" id="username">
		        </div>
		    </div>
		    <div class="field">
		    	<label>Photo</label>
				<img src="" id="picture" style="height: 170px; width: 150px; padding-bottom: 10px;" />
				<div id="fine-uploader-basic" class="ui blue button small" style="margin-top:-44.2px;">Browse</div>
			</div>
			<input type="hidden" name="photo" id="registeredPhoto" value="" />
		    <div class="field">
		        <label>Full Name</label>
		        <div class="ui left labeled input">
		          <input placeholder="Type your fullname here..." type="text" name="fullname" id="fullname">
		        </div>
		    </div>
		    <div class="two fields">
			    <div class="field">
			        <label>Password</label>
			        <div class="ui left labeled input">
			          <input type="password" placeholder="Type your password here..." name="password" id="password">
			        </div>
			    </div>
			    <div class="field">
			        <label>Confirm Password</label>
			        <div class="ui left labeled input">
			          <input type="password" placeholder="Confirm your password here..." name="confirmpassword" id="confirmpassword">
			        </div>
			    </div>
			</div>
		    <div class="field">
		        <label>Email</label>
		        <div class="ui left labeled input">
		          <input type="text" placeholder="Type your email here..." id="email">
		        </div>
		    </div>
		    <div class="field">
		        <label>User Type</label>
		        <div class="ui fluid selection dropdown">
					<div class="default text">Select</div>
					<i class="dropdown icon"></i>
					<input type="hidden" name="usertype" id="usertype">
					<div class="menu">
						<div class="item" data-value="individu">Individual</div>
						<div class="item" data-value="company">Company</div>
					</div>
		    	</div>
		    </div>
		    <div class="inline field">
				<div class="ui checkbox">
					<label>
						<input type="checkbox" name="agreed" id="agreed">
						<label>I agree to the terms and conditions</label>
					</label>
				</div>
			</div>
      	<div class="ui blue submit button" id="btnRegister">Register</div>
      	</form>
    	</div>
		<!-- End Of Content -->
	</div>
</div>