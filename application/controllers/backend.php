<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BackEnd extends AB_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$pageContent = $this->load->view('content/backend', '',  TRUE);

		//Load Master View
		$this->load->view('master/master',
				array('pageContent'=>$pageContent));
	}
	public function getDegree(){
		$res = $this->sp('GetDegree');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function getCategory(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$res = $this->sp('GetCategory');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function getCategoryByDegreeID(){
		// asdf
		$post = $this->rest->post();
		$res = $this->sp('GetCategoryByDegreeID', array(
			'DegreeID' => $post->DegreeID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
   	public function getLevel(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$res = $this->sp('GetLevel');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
      public function GetUserAndTest(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$res = $this->sp('GetUserAndTest');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function GetUserAndAnswer(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$res = $this->sp('GetUserAndAnswer');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function GetAllTest(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
		$res = $this->sp('GetAllTest');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }

   	public function changeDegree(){
   		if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
   		if($post->DegreeID == -1)
			$res = $this->sp('insertDegree', 
				array('DegreeName' => $post->DegreeName,
					'AuditedUser' => $this->session->userdata('username')
			));
		else 
			$res = $this->sp('EditDegree', 
				array('DegreeID' => $post->DegreeID,
					'DegreeName' => $post->DegreeName,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function changeLevel(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
   		if($post->LevelID == -1)
			$res = $this->sp('InsertLevel', 
				array('LevelName' => $post->LevelName,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		else 
			$res = $this->sp('EditLevel', 
				array('LevelID' => $post->LevelID,
					'LevelName' => $post->LevelName,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function changeCategory(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
   		if($post->CategoryID == -1)
			$res = $this->sp('InsertCategory', 
				array('CategoryName' => $post->CategoryName,
					'DegreeID' => $post->DegreeID,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		else 
			$res = $this->sp('EditCategory', 
				array('CategoryID' => $post->CategoryID,
					'CategoryName' => $post->CategoryName,
					'DegreeID' => $post->DegreeID,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function deleteDegree(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
		$res = $this->sp('DeleteDegree', 
				array('DegreeID' => $post->DegreeID,
					'AuditedUser' =>  $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function deleteLevel(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
		$res = $this->sp('DeleteLevel', 
				array('LevelID' => $post->LevelID,
					'AuditedUser' => $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function deleteCategory(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
		$res = $this->sp('DeleteCategory', 
				array('CategoryID' => $post->CategoryID,
					'AuditedUser' => $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
    public function deleteUser(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
		$res = $this->sp('DeleteUser', 
				array('UserID' => $post->UserID,
					'AuditedUser' => $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
    public function deleteTest(){
    	if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			redirect('home');
   		$post = $this->rest->post();
		$res = $this->sp('DeleteTest', 
				array('TestID' => $post->TestID,
					'AuditedUser' => $this->session->userdata('username')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */