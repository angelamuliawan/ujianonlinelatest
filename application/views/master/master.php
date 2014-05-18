<?php
	$domain = $this->config->item('domain');
	//date_default_timezone_set($this->config->item('timezone'));
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Standard Meta -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

	<script type="text/javascript">
		var mainDomain = "<?=$domain?>";
		var serverTime = '<?=date('H:i:s');?>';
	</script>

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width">

	<title>BAZ</title>

	<!-- Included CSS Files -->
	<!-- Semantic CSS -->
	<link href='<?=$domain?>/packaged/css/font.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="<?=$domain?>/packaged/css/semantic.css">
	<link rel="stylesheet" href="<?=$domain?>/packaged/css/template.css">
	
	<!-- Load Required JS Files -->
	<script src="<?=$domain?>/packaged/javascript/jquery.js"></script>
	<script src="<?=$domain?>/packaged/javascript/homepage.js"></script>
	<script src="<?=$domain?>/packaged/javascript/semantic.js"></script>
  <script src="<?=$domain?>/packaged/javascript/jquery.address.js"></script>
  <script src="<?=$domain?>/packaged/javascript/core/ab-engine.js"></script>
  <script>
    $(document).ready(function() {
      $('.sidemenu.sidebar').first().sidebar('attach events', '.toggle.button');
      $('.toggle.button');

      $('.ui.accordion').accordion();

      $('.loginmodal.modal').modal('attach events', '.openmodal', 'show');


      var pathname = window.location.pathname;
      var page = pathname.split('/ujianonline/');
      if(page[1] == '' || page[1] == 'home') $(".fixedmenu").hide();
      else $(".fixedmenu").show();

      //hover most viewed test to see category and degree
       $('.item-popup').popup({
          on: 'hover',
          inline : true
        });

       $(".btnRegister").click(function(){
            window.location.href =  $('#domain').val()+"/register";
       });
    });
  </script>
  <style>
    .container{
      padding: 2% 4%;
      width: auto;
    }
    .menu{
      padding: 0 0%;
      width: auto;
    }
    .segment{
      margin: 0 0 3em;
      padding-bottom: 30px;
      padding-top: 70px;
    }
    .search{
      float: right;
      margin-left: 0.25em;
    }
    .content-space{
      margin: 0 0 3em;
      padding-bottom: 10px;
    }
  </style>
</head>

<body id="home">
  <input type="hidden" id="domain" value="<?=$domain?>"/>
  <!-- Start of Fixed Menu -->
  <div class="ui fixed transparent inverted main menu fixedmenu">
    <div class="menu">
      <a class="launch item toggle button">
          <i class="icon list layout"></i>
          Menu
      </a>
      <a class="right popup item" href="<?=$domain?>" data-content="Home">
        <i class="home icon"></i>
      </a>
      <a class="right launch item">
          What is BAZ?
      </a>
      <a class="right launch item openmodal">
          Login
      </a>
    </div>
  </div>
  <!-- End of Fixed Menu -->

  <!-- Start Of Content -->
    <div id="content">
      <!-- Put Page Content Here -->
      <?= (isset($pageContent))?$pageContent:''; ?>
    </div>
  <!-- End Of Content -->

  <!--Start Of Sidebar -->
  <div class="ui floating thin sidebar sidemenu">
    <div class="ui secondary vertical menu" style="padding-top:4px;">
      <a href="#" class="item">My Dashboard</a>
      <a href="#" class="item">Create Test</a>
      <a href="#" class="item">My Creation Test</a>
      <a href="#" class="item">My Passed Test</a>
    </div>
    <div class="ui icon input" style="margin:10px;">
      <input placeholder="Search Category..." type="text">
      <i class="inverted search icon"></i>
    </div>
    <div class="ui fluid accordion">
      <div class="title">
        <i class="dropdown icon"></i>
          High School
      </div>
      <div class="content">
        <a href="#">English For High School</a>
      </div>
      <div class="title">
        <i class="dropdown icon"></i>
        University
      </div>
      <div class="content">
        <a href="#">SNMPTN Test</a>
      </div>
    </div>
    <div class="ui secondary vertical menu">
      <a href="<?=$domain?>/listcategory" class="item">More Categories...</a>
    </div>
  </div>
  <!--End Of Sidebar -->

<div class="ui horizontal icon divider">
  <i class="circular heart icon"></i>
</div>
  <!-- Footer -->
  <div class="ui grid segment" style="padding:0px 0px 15px;">
      <h4 class="ui center aligned header">
        Copyright &copy Brian Alexandro - Angela Muliawan - Zola - 2014
      </h4>
  </div>
</body>

</html>


<!-- Start Of Modal Login Register -->
<div class="ui loginmodal modal">
  <i class="close icon"></i>
<div class="ui two column middle aligned relaxed grid basic segment">
  <div class="column">
    <div class="ui form segment">
      <div class="field">
        <label>Username</label>
        <div class="ui left labeled icon input">
          <input placeholder="Username" type="text">
          <i class="user icon"></i>
          <div class="ui corner label">
            <i class="asterisk icon"></i>
          </div>
        </div>
      </div>
      <div class="field">
        <label>Password</label>
        <div class="ui left labeled icon input">
          <input type="password" placeholder="Password">
          <i class="lock icon"></i>
          <div class="ui corner label">
            <i class="asterisk icon"></i>
          </div>
        </div>
      </div>
      <div class="ui blue submit button">Login</div>
    </div>
  </div>
  <div class="ui vertical divider">
    Or
  </div>
  <div class="center aligned column">
    <div class="huge green ui labeled icon button btnRegister">
      <i class="signup icon"></i>
      Register
    </div>
  </div>
</div>
</div>
<!-- End Of Modal Login Register -->