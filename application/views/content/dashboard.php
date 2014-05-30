<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>
<script src="<?=$domain?>/packaged/javascript/ContentJS/dashboard.js"></script>
<div class="segment">
	<div class="container">
		<!-- Title -->
	 	<h3 class="ui header">Dashboard</h3>
	  	<!-- Content -->
	  	<div class="ui segment">
			<div class="ui form">
				<form id="formChangeProfile">
					<h4 class="ui dividing header">Basic Information</h4>
					<div class="inline field">
				        <label style="width:190px;">Username</label>
				        <input  style="width:300px;" type="text" name="username" id="username" disabled>
				    </div>
					<div class="inline field">
				        <label style="width:190px;">Fullname</label>
				        <input  style="width:300px;" type="text" name="fullname" id="fullname">
				    </div>
					
				   	<div class="inline field">
				        <label style="width:190px;">Email</label>
				        <input style="width:300px;" type="text" name="email" id="email">
				    </div>
				    <div class="inline field">    
					    <label style="width:190px;">User Photo</label>
					    <!--<img class="ui small image" id="userimage">-->
						<img src="" id="userimage" style="height: 170px; width: 150px; margin-bottom: 10px;" />
						<div id="fine-uploader-basic" class="ui blue button small" style="margin-top:-44.2px;">Browse</div>
						<input type="hidden" name="photo" id="originalPhotoName" value="" />
				    </div>
				    <div class="field">
				    	<div class="ui blue button small" id="btnChangeProfile">Save</div>
				    </div>
			    </form>
		    </div>
		    <div class="ui form">
				<form id="formChangePassword">
				<h4 class="ui dividing header">Change Password</h4>
						<div class="inline field">
					        <label style="width:190px;">Password</label>
					        <input style="width:300px;" type="password" placeholder="filled old password" name="password" id="password">
					    </div>
				        <div class="inline field">
					        <label style="width:190px;">New Password</label>
					        <input style="width:300px;" type="password" placeholder="filled for change password" name="newpassword" id="newpassword">
					     </div>
					    <div class="inline field">
					        <label style="width:190px;">Confirm New Password</label>
					        <input  style="width:300px;"type="password" placeholder="Retype new password" name="confirmnewpassword" id="confirmnewpassword">
					    </div>
					    <div class="field">
					    	<div class="ui blue button small" id="btnChangePassword">Change Password</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>