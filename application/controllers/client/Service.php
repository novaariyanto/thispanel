<?php

class Service extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
        if (!$this->auth_model->current_user()) {
           
            redirect('auth/login');
        }
        $data_user =$this->auth_model->current_user(); 
        if($data_user->level !== "1"){
            redirect('/dashboard');
        }
        $this->load->model('setting_model');
        $this->load->model('user_model');
		$this->load->model('messages_model');
        $this->load->model('transaksi_model');
        $this->load->model('package_model');
        $this->load->model('userpackage_model');
        $this->load->library('whatsva');
    }

    public function index()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['package'] = $this->userpackage_model->getJoin($data['current_user']->id);

        $page = @$_GET['page'];
		$limit = 10;
		if(!@$page){
			$start = 0;
		}else{
			$start = $page * $limit;
			
		}
        $data['devices'] = $this->transaksi_model->getAll($limit,$start);

      
        $data['ws_url'] = $this->whatsva->ws_url();
      
        $data['devices_count']= sizeof($data['devices']);

        $this->load->view('layouts/header', $data);
        $this->load->view('client/service/information', $data);
        $this->load->view('layouts/footer');

    }
    public function change_package()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->package_model->getAll();
        $data['ws_url'] = $this->whatsva->ws_url();
        $data['devices_count']= sizeof($data['devices']);
        

        $this->load->view('layouts/header', $data);
        $this->load->view('client/service/change_package', $data);
        $this->load->view('layouts/footer');

    }
    public function addUptime()
    {
        $this->load->library('form_validation');
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();

        $id_user = $data['current_user']->id;
        $dataw = $this->userpackage_model->getWhere(["id_user"=>$data['current_user']->id]);
        $data_package = $this->package_model->getbyId($dataw->id_package);
            if($data_package){
           
                if($data_package->price > 0){
                
                    $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';
                    $kode_transaksi =  substr(str_shuffle($permitted_chars), 0, 10);
                    $total_price = $data_package->price;
                    $discount = 0;
                    $day_value = $data_package->day_value;
                    $price_package = $data_package->price;
                    $id_package = $data_package->id;
                    // $cek = $this->transaksi_model->getWhere(["id_user"=>$id_user,"MONTH(date_time)"=>Date('m')]);
                    $add_transaksi = $this->transaksi_model->insert($kode_transaksi,$id_user,$id_package,$total_price, $discount,$day_value,$price_package);       
                }
               
                $this->userpackage_model->update_($id_user,$id_package);
               
        }
        redirect('./billings');
      
    }
    public function save_change_package($id)
    {
      
        $this->load->library('form_validation');
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['package'] = $this->package_model->getbyId($id);
        $id_user = $data['current_user']->id;
        $id_package = $id;

        if($id_package){
            $dataw = $this->userpackage_model->getWhere(["id_user"=>$data['current_user']->id]);
            if($dataw->id_package != $id){
                $current_idpackage = $dataw->id_package;
                $c_package = $this->package_model->getbyId($current_idpackage);
                // print_r($c_package);
                // print_r("<br>");
                // print_r( $data['package']);
                if($c_package->price <= $data['package']->price){
                    if($data['package']->price > 0){
                
                        $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';
                        $kode_transaksi =  substr(str_shuffle($permitted_chars), 0, 10);
                        $total_price = $data['package']->price;
                        $discount = 0;
                        $day_value = $data['package']->day_value;
                        $price_package = $data['package']->price;
                        // $cek = $this->transaksi_model->getWhere(["id_user"=>$id_user,"MONTH(date_time)"=>Date('m')]);
                        $add_transaksi = $this->transaksi_model->insert($kode_transaksi,$id_user,$id_package,$total_price, $discount,$day_value,$price_package);       
                    }
                    
                }else {
                    echo "can't downgrade package";
                }
             
               
        }
        redirect('./billings');
        }else{
            echo "error package not found";
        }

        // $this->load->view('layouts/header', $data);
        // $this->load->view('client/transaksi/add', $data);
        // $this->load->view('layouts/footer');

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
        $this->load->view('client/transaksi/add', $data);
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
        $this->load->view('client/user/authqr', $data);
        $this->load->view('layouts/footer');
    }
    // ... ada kode lain di sini ...
}
