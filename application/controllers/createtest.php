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
		$res = $this->sp('InsertTest',
			array(
				'TestName'=> $post->TestName, 
				'TestDescription' => $post->TestDescription,
				'CategoryID' => $post->CategoryID,
				'LevelID'=> $post->LevelID,
				'DegreeID'=> $post->DegreeID, 
				'UserID' => $this->session->userdata('userid'),
				'AccessType'=> $post->AccessType, 
				'PublishStartDate'=> PublishStartDate,
				'PublishEndDate'=> $post->PublishEndDate, 
				'UploadTutorial'=> $post->UploadTutorial,
				'AuditedUser' => $this->session->userdata('username')
		));
		$this->do_alert($res);
		//$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function uploadfile()
	{
		//Load Uploader Library
		$config['upload_path'] = 'packaged/sharedmaterial';
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
		echo '<scricpt type="text/javascript">alert('+$message+')</script>';
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */