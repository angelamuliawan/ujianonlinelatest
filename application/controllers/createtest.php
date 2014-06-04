<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CreateTest extends AB_Controller {

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
		if($this->session->userdata('loggedin')==NULL) redirect('home');
		$pageContent = $this->load->view('content/createtest', '',  TRUE);

		//Load Master View
		$this->load->view('master/master',
				array('pageContent'=>$pageContent));
	}
	public function insertTest()
	{
		$post = $this->rest->post();
		// print_r($post);
		// die();
		$res = $this->sp('InsertTest',
			array(
				'TestName'=> $post->TestName, 
				'TestDescription' => $post->TestDescription,
				'CategoryID' => $post->CategoryID,
				'LevelID'=> $post->LevelID,
				'AccessType'=> $post->AccessType, 
				'UserID' => $this->session->userdata('userid'),
				'PublishStartDate'=> $post->PublishStartDate,
				'PublishEndDate'=> $post->PublishEndDate, 
				'UploadTutorial'=> $post->UploadTutorial,
				'AuditedUser' => $this->session->userdata('username')
		));
		//$this->do_alert($res);
		$TestID = $res->result()[0]->ID;
		$this->load->view('json_view', array('json' => $TestID));
	}
	
	public function insertTestDetail(){
		$post = $this->rest->post();
		
		$TestID = $post->TestID;
		$listTestDetail = $post->listTestDetail;
		$listTestDetailAnswer = $post->listTestDetailAnswer;
		
		for($i = 0; $i < count($listTestDetail); $i++){
			
			$TestDetailID = $this->sp('InsertTestDetail',
				array(
					'TestQuestion'=> $listTestDetail[$i]->TestQuestion, 
					'TestURL' => $listTestDetail[$i]->TestURL,
					'TestID' => $TestID,
					'AuditedUser' => $this->session->userdata('username')
			))->result()[0]->ID;
			
			//$this->do_alert(count($listTestDetailAnswer[$i]));
			for($j = 0; $j < count($listTestDetailAnswer[$i]); $j++){
				$this->sp('InsertTestDetailAnswer',
					array(
						'TestDetailAnswerName'=> $listTestDetailAnswer[$i][$j]->TestDetailAnswerName, 
						'TestDetailURL' => $listTestDetailAnswer[$i][$j]->TestDetailURL,
						'isAnswer' => $listTestDetailAnswer[$i][$j]->isAnswer,
						'TestDetailID' => $TestDetailID,
						'AuditedUser' => $this->session->userdata('username')
				))->result();
			}
		}
		$this->load->view('json_view', array('json' => 1));
	}
	
	public function uploadfile()
	{
		//Load Uploader Library
		$config['upload_path'] = 'packaged';
		$config['allowed_types'] = 'doc|docx|zip|rar|pdf|xls';
	
		$this->load->library('upload', $config);
	
		if (!$this->upload->do_upload('qqfile'))
		{
			$error = array('error' => $this->upload->display_errors());
			echo json_encode(array('status' => "-1", 'msg' => $error));
	
		}
		else
		{
			$data = array('upload_data' => $this->upload->data());
			$ext = $data['upload_data']['file_ext'];
			$name = $data['upload_data']['file_name'];		
			echo json_encode(array('status' => "1", 'name' => $name,'ext' => $ext));
		}
	}
	
	public function do_alert($message){
		echo '<script type="text/javascript">alert('+$message+')</script>';
	}
	
	public function getDegree(){
		if($this->session->userdata('loggedin')==NULL)
			redirect('home');
		$res = $this->sp('GetDegree');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
	public function getCategory(){
		if($this->session->userdata('loggedin')==NULL)
			redirect('home');
		$res = $this->sp('GetCategory');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
	public function getCategoryByDegreeID(){
		if($this->session->userdata('loggedin')==NULL)
			redirect('home');
		$post = $this->rest->post();
		$res = $this->sp('GetCategoryByDegreeID', array(
			'DegreeID' => $post->DegreeID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	public function getLevel(){
		if($this->session->userdata('loggedin')==NULL)
			redirect('home');
		$res = $this->sp('GetLevel');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */