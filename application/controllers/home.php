<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends AB_Controller {

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
		//$this->load->view('master/master');
		$pageContent = $this->load->view('content/home', '',  TRUE);

		//Load Master View
		$this->load->view('master/master',
				array('pageContent'=>$pageContent));
	}
	public function doLogin()
	{
		$post = $this->rest->post();
		$res = $this->sp('CheckLogin', 
			array('UserName'=> $post->username, 
				'Password' => sha1($post->password)
		));
		$data = $res->result();
		if($data[0]->UserID != -1)
		{
			$this->session->set_userdata('loggedin',true);
			$this->session->set_userdata('userid',$data[0]->UserID);
			$this->session->set_userdata('username',$data[0]->UserName);
			$this->session->set_userdata('usertype',$data[0]->UserType);
			$this->session->set_userdata('userrole',$data[0]->Role);
		}
		return $this->load->view('json_view', array('json' => $data));
	}
	public function doLogout(){
		$this->load->helper('url');
		$this->session->sess_destroy();
		redirect('home');
	}
	public function loadTopTest(){
   		// if($this->session->userdata('loggedin')==NULL || $this->session->userdata('userrole')!=1)
			// redirect('home');
		$res = $this->sp('GetTopTest');
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */