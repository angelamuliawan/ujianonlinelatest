<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ListItemPerCategory extends AB_Controller {

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
	public function index($param = 0)
	{
		$data = array('CategoryID' => $param);
		$pageContent = $this->load->view('content/listitempercategory', $data,  TRUE);

		//Load Master View
		$this->load->view('master/master',array('pageContent'=>$pageContent));
	}
	
	public function getDegreeWithCategory(){
		$post = $this->rest->post();
		$res = $this->sp('GetDegreeWithCategory', array(
			'CategoryID' => $post->categoryID
		));
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function getListItemPerCategory(){
		$post = $this->rest->post();
		$res = $this->sp('GetListItemPerCategory', array(
			'CategoryID' => $post->categoryID
		));
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */