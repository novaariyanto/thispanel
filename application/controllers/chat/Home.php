<?php
class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
        if (!$this->auth_model->current_user()) {
            redirect('auth/login');
        }
        $this->load->model('setting_model');
        $this->load->model('device_model');
		$this->load->model('messages_model');
        $this->load->library('whatsva');
        $this->load->model('autoreply_model');
    }
    public function index()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();

        $page = @$_GET['page'];
		$limit = 10;
		if(!@$page){
			$start = 0;
		}else{
			$start = $page * $limit;
			
		}
        $data['device'] = $this->device_model->getAlls();

        $data['devices'] = $this->autoreply_model->getAll($start,$limit);
        $data['devices_count']= $this->autoreply_model->getCount();

        $this->load->view('chat/layouts/header');
        $this->load->view('chat/home/index', $data);
        $this->load->view('chat/layouts/footer');
    }
}