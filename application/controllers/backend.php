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
		$res = $this->sp('GetCategory');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
   	public function getLevel(){
		$res = $this->sp('GetLevel');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }

   	public function changeDegree(){
   		$post = $this->rest->post();
   		if($post->DegreeID == -1)
			$res = $this->sp('insertDegree', 
				array('DegreeName' => $post->DegreeName,
					'AuditedUser' => 'Angela'
			));
		else 
			$res = $this->sp('EditDegree', 
				array('DegreeID' => $post->DegreeID,
					'DegreeName' => $post->DegreeName,
					'AuditedUser' => 'Angela'
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function changeLevel(){
   		$post = $this->rest->post();
   		if($post->LevelID == -1)
			$res = $this->sp('InsertLevel', 
				array('LevelName' => $post->LevelName,
					'AuditedUser' => 'Angela'
			));
		else 
			$res = $this->sp('EditLevel', 
				array('LevelID' => $post->LevelID,
					'LevelName' => $post->LevelName,
					'AuditedUser' => 'Angela'
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function deleteDegree(){
   		$post = $this->rest->post();
		$res = $this->sp('DeleteDegree', 
				array('DegreeID' => $post->DegreeID,
					'AuditedUser' => 'Angela'
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }

    public function deleteLevel(){
   		$post = $this->rest->post();
		$res = $this->sp('DeleteLevel', 
				array('LevelID' => $post->LevelID,
					'AuditedUser' => 'Angela'
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */