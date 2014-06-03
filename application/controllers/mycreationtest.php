<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MyCreationTest extends AB_Controller {

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
		$pageContent = $this->load->view('content/mycreationtest', '',  TRUE);

		//Load Master View
		$this->load->view('master/master',
				array('pageContent'=>$pageContent));
	}
	public function getCreationTest(){
    	if($this->session->userdata('loggedin')==NULL) redirect('home');
		$res = $this->sp('GetCreationTest', 
					array('userid' => $this->session->userdata('userid')
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
   public function getNumberOfPeople(){
    	if($this->session->userdata('loggedin')==NULL) redirect('home');
    	$post = $this->rest->post();
		$res = $this->sp('GetNumberOfPeople', 
					array('testid' => $post->testid
			));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */