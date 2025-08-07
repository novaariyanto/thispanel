<?php

class Dashboard extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('auth_model');
		if(!$this->auth_model->current_user()){
			redirect('/login');
		}
        $this->load->model('setting_model');
        $this->load->model('messages_model');
        $this->load->model('device_model');
		$this->load->model('userpackage_model');
		$this->load->model('transaksi_model');
	}
    public function index()
    {
        
		$data['messages_count']= $this->messages_model->getCount();
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();
		$data['package'] = $this->userpackage_model->getJoin($data['current_user']->id);
		// header("Content-Type: application/json");
		// print_r(json_encode($data['package']));
		// die;
		$data['transaksi']= $this->transaksi_model->getWhere2(["id_user" => $data['current_user']->id,"status_paid"=>"3"]);
		$active_day = 0;
		
		foreach ($data['transaksi'] as $a => $value) {
			# code...
			$active_day += $value->day_value;
			
		}
		 $start_date = substr(@$data['current_user']->start_date,0,10);
		
		 $data['active_day'] = $active_day;
		
		$date	= date_create( $start_date);
		$d 		= date_add($date,date_interval_create_from_date_string($active_day." days"));
		$end_date = date_format($date,"d-M-Y");
		$data['end_date'] = $end_date;
		$data['start_date'] = date_format(date_create($start_date),"d-M-Y");
		 $a = new DateTime(date(''));
		 $b = new DateTime($end_date);
		
		 $data['remaining'] = $a->diff($b)->days; 
	
    	$this->load->view('layouts/header',$data);
		if($data['current_user']->level === "2"){
			$data['messages_count']= $this->messages_model->getCount($data['current_user']->level);
			$data['message_in_count']= $this->messages_model->getCountIn($data['current_user']->level);
			$data['devices'] = $this->device_model->getAllsLevel($data['current_user']->level);
			$this->load->view('admin/dashboard/index',$data);
		}else if($data['current_user']->level === "3"){
			$data['messages_count']= $this->messages_model->getCount($data['current_user']->level);
			$data['message_in_count']= $this->messages_model->getCountIn($data['current_user']->level);
			$data['devices'] = $this->device_model->getAllsLevel($data['current_user']->level);
			$this->load->view('super_admin/dashboard/index',$data);
		}else{
			
			$this->load->view('client/dashboard/index',$data);
		}
    	$this->load->view('layouts/footer');
    }
	// ... ada kode lain di sini ...
}