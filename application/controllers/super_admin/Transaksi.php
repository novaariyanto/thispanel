<?php

class Transaksi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
        if (!$this->auth_model->current_user()) {
           
            redirect('auth/login');
        }
        $data_user =$this->auth_model->current_user(); 
        if($data_user->level !== "3"){
            redirect('/dashboard');
        }
        $this->load->model('setting_model');
        $this->load->model('user_model');
		$this->load->model('messages_model');
        $this->load->library('whatsva');
    }

    public function index()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();

        // $page = @$_GET['page'];
		// $limit = 10;
		// if(!@$page){
		// 	$start = 0;
		// }else{
		// 	$start = $page * $limit;
			
		// }
        $data_list = $this->whatsva->listTransactions();
        if(@$data_list){
            @$data['devices'] = json_decode($data_list)->data;
        }else{
            @$data['devices'] = [];
        }

      
        $data['ws_url'] = $this->whatsva->ws_url();
      
        @$data['devices_count']= sizeof(@$data['devices']);

        $this->load->view('layouts/header', $data);
        $this->load->view('super_admin/transaksi/list', $data);
        $this->load->view('layouts/footer');

    }
    public function add()
    {
      
        $this->load->library('form_validation');
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data_list = $this->whatsva->listPackages();
     
        if($data_list){
            $data['packages'] = json_decode($data_list)->data;
        }
        $package = $this->input->post('package');
        if($package){
            if ($this->whatsva->createTransactions($package)) {
                redirect('./billing_panel');
            }
        }

        $this->load->view('layouts/header', $data);
        $this->load->view('super_admin/transaksi/add', $data);
        $this->load->view('layouts/footer');

    }
    public function delete($id)
    {
		if($this->user_model->delete($id)){
            redirect('/user');
        }
    }
    public function logoutInstance($device)
    {
		$datasetting = $this->setting_model->getSetting();
        $data_device = $this->user_model->getbyId($device);
        if (count((array) $data_device)) {
            $qr = $this->whatsva->resetInstance($data_device->api_key,$datasetting->panel_key);
            $qr = json_decode($qr);
            if ($qr->success) {
				$updateStatus = $this->user_model->update(["status" => 1], $data_device->id);
                redirect('./device');
            }
        }
    }
    public function authQr($device)
    {
		$datasetting = $this->setting_model->getSetting();
        $data_device = $this->user_model->getbyId($device);
        if (count((array) $data_device)) {
            $qr = $this->whatsva->generatedQr($data_device->api_key,$datasetting->panel_key);
            $qr = json_decode($qr);
            if ($qr->success) {
                $qrCode = $qr->data->qr;

            } else {
                if ($qr->message === "Paired device") {
                    redirect('./device');
                } else if ($qr->message === "The qr code has been generated, please scan it with your whatsapp account") {
                    // print_r($qr);
                    // die;
                } else {
                    // print_r($qr);
                    // die;
                }

            }
        } else {
            redirect('./device');
        }
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['device'] = $data_device;

        $this->load->view('layouts/header', $data);
        $this->load->view('admin/user/authqr', $data);
        $this->load->view('layouts/footer');
    }
    // ... ada kode lain di sini ...
}
