  <style>
  span{
  	color: #009FDA;
  }
  </style>
  <!--Header Of Home -->
  <div class="ui inverted page grid masthead segment">
    <div class="column">
      <img src="packaged/images/test.png" class="ui medium image">
      <div class="ui hidden transition information">
        <h1 class="ui inverted header">
          BAZ Online Exam
        </h1>
        <p>You're best partner to customize and manage online test</p>
        <?php if($this->session->userdata('loggedin')!=NULL) { ?>
        <div class="large basic inverted animated fade ui button btnLogout">
          <div class="visible content"><?=$this->session->userdata('username')?>, Logout</div>
          <div class="hidden content">Logout</div>
        </div>
        <?php }  else{ ?>
        <div class="large basic inverted animated fade ui openmodal button">
     		<div class="visible content">Login</div>
          	<div class="hidden content">Register</div>
        </div>
        <?php } ?>
        <div class="large basic inverted animated fade ui button">
          <div class="visible content">What is BAZ</div>
          <div class="hidden content">?</div>
        </div>
      </div>
    
    </div>
  </div>
  <!--End Header Of Home -->
  	<div class="container">
	  		<h3 class="ui left floated header">Most viewed materials</h3>
				<div class="ui toggle button right floated teal small">
				    <i class="reorder icon"></i>
				    View All Categories
			 	</div>
			<div class="ui clearing divider"></div>
			<div class="ui animated selection list">
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="green checkmark icon"></i>
					<a href="#">Cara mencari followpos dan lastpos</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Angela Muliawan" data-variation="inverted small">
					<i class="blue checkmark icon"></i>
					<a href="#">Medium level bro</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Brian Alexandro" data-variation="inverted small">
					<i class="red checkmark icon"></i>
					<a href="#">Kisi2 UTS 2014</a> on
					Others - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="green checkmark icon"></i>
					<a href="#">Cara mencari followpos dan lastpos</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item z" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="blue checkmark icon"></i>
					<a href="#">Medium level bro</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="red checkmark icon"></i>
					<a href="#">Kisi2 UTS 2014</a> on
					Others - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="green checkmark icon"></i>
					<a href="#">Cara mencari followpos dan lastpos</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="blue checkmark icon"></i>
					<a href="#">Medium level bro</a> on 
					Teknik Kompilasi - University
					<div class="right floated">1000 people did</div>
				</div>
				<div class="item item-popup" data-content="created by Bina Nusantara Group" data-variation="inverted small">
					<i class="red checkmark icon"></i>
					<a href="#">Kisi2 UTS 2014</a> on
					Others - University
					<div class="right floated">1000 people did</div>
				</div>
			</div>
	</div>

