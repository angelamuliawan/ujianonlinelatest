<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<style>
</style>
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
		          <input placeholder="Type your username here..." type="text" name="username">
		        </div>
		    </div>
		    <div class="field">
		        <label>Full Name</label>
		        <div class="ui left labeled input">
		          <input placeholder="Type your fullname here..." type="text" name="fullname">
		        </div>
		    </div>
		    <div class="field">
		        <label>Password</label>
		        <div class="ui left labeled input">
		          <input type="password" placeholder="Type your password here..." name="password">
		        </div>
		    </div>
		    <div class="field">
		        <label>Email</label>
		        <div class="ui left labeled input">
		          <input type="text" placeholder="Type your email here..." name="email">
		        </div>
		    </div>
		    <div class="field">
		        <label>User Type</label>
		        <div class="ui fluid selection dropdown">
					<div class="text">Select</div>
					<i class="dropdown icon"></i>
					<input type="hidden" name="gender">
					<div class="menu">
						<div class="item" data-value="male">Individual</div>
						<div class="item" data-value="female">Company</div>
					</div>
		    	</div>
		    </div>
		    <div class="inline field">
				<div class="ui checkbox">
					<label>
						<input type="checkbox" name="agreed">
						<label>I agree to the terms and conditions</label>
					</label>
				</div>
			</div>
      	<div class="ui blue submit button" type="submit">Register</div>
      	</form>
    	</div>
		<!-- End Of Content -->
	</div>
</div>