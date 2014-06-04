<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class TakeTest extends AB_Controller {

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
		$data = array('TestID' => $param);
		$pageContent = $this->load->view('content/taketest', $data,  TRUE);

		//Load Master View
		$this->load->view('master/master',array('pageContent'=>$pageContent));
	}
	
	public function getQuestionList(){
		$post = $this->rest->post();
		$res = $this->sp('GetQuestionList', array(
			'TestID' => $post->TestID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function getOptionList(){
		$post = $this->rest->post();
		$res = $this->sp('GetTestDetailByTestID', array(
			'TestID' => $post->TestID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function insertUserAnswer(){
		$post = $this->rest->post();
		$listUserAnswerDetail = $post->listUserAnswerDetail;
		$UserAnswerID = $this->sp('InsertUserAnswer',
				array(
					'TestID'=> $post->TestID, 
					'isInvited' => $post->isInvited,
					'UserID' => $this->session->userdata('userid'),
					'UserEmail' => $post->email,
					'AuditedUser' => $this->session->userdata('username')
		))->result()[0]->ID;
		
		for($i = 0; $i < count($listUserAnswerDetail); $i++){
			$this->sp('InsertUserAnswerDetail',
				array(
					'UserAnswerID'=> $UserAnswerID,
					'TestDetailID' => $listUserAnswerDetail[$i]->TestDetailID,
					'TestDetailAnswerID' => $listUserAnswerDetail[$i]->TestDetailAnswerID,
					'AuditedUser' => $this->session->userdata('username')
			))->result();
		}
		$this->load->view('json_view', array('json' => 1));
	}
	
	public function checkUserAnswer(){
		$post = $this->rest->post();
		$res = $this->sp('CheckUserAnswer', array(
			'TestID' => $post->TestID,
			'UserID' => $this->session->userdata('userid'),
			'Email' => $post->email
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */