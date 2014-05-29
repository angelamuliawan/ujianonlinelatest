<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/dashboard.js"></script>
<div class="segment">
	<div class="container">
		<!-- Title -->
		<img class="ui small floated image" id="userimage">
	 	<h3 class="ui header" id="fullname"></h3>
	  	<!-- Content -->
	  	<div class="ui segment">
			<div class="ui form">
				<form id="formChangeProfile">
					<div class="inline field">
				        <label style="width:190px;">Username</label>
				        <input  style="width:300px;" type="text" name="username" id="username" disabled>
				    </div>
				   	 <div class="inline field">
				        <label style="width:190px;">Email</label>
				        <input style="width:300px;" type="text" name="email" id="email">
				    </div>
				        <div class="inline field">
					        <label style="width:190px;">Password</label>
					        <input style="width:300px;" type="password" placeholder="filled to change email or password or both" name="password" id="password">
					    </div>
				        <div class="inline field">
					        <label style="width:190px;">New Password</label>
					        <input style="width:300px;" type="password" placeholder="filled for change password" name="newpassword" id="newpassword">
					     </div>
					    <div class="inline field">
					        <label style="width:190px;">Confirm New Password</label>
					        <input  style="width:300px;"type="password" placeholder="Retype new password" name="confirmnewpassword" id="confirmnewpassword">
					    </div>
			    </form>
		    </div>
		</div>
	</div>
</div>