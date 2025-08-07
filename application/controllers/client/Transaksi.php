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
        if($data_user->level !== "1"){
            redirect('/dashboard');
        }
        $this->load->model('setting_model');
        $this->load->model('user_model');
		$this->load->model('messages_model');
        $this->load->model('transaksi_model');
        $this->load->model('package_model');
        $this->load->library('whatsva');
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
        $data['devices'] = $this->transaksi_model->getAll($limit,$start);      
        $data['ws_url'] = $this->whatsva->ws_url();
      
        $data['devices_count']= sizeof($data['devices']);

        $this->load->view('layouts/header', $data);
        $this->load->view('client/transaksi/list', $data);
        $this->load->view('layouts/footer');

    }
    public function proses($id_transaksi)
    {
        $data['setting'] = $this->setting_model->getSetting();
        $server_key = $data['setting']->server_key;
        $transaksi = $this->transaksi_model->getbyId($id_transaksi);
     
        print_r($transaksi);
        $order_id = rand()."-".$transaksi->id;
        $grouss_amount = $transaksi->total_price;
        $id_package = $transaksi->id_package;
        $id_user = $transaksi->id_user;
        
        $package = $this->package_model->getbyId($id_package);
        $user = $this->user_model->getbyId($id_user);

        $transaction_details = array(
            'order_id' => $order_id,
            'gross_amount' => $grouss_amount, // no decimal allowed for creditcard
        );
          // Optional
          $items = array(
            'id' => "PKG00".$package->id,
            'price' => $transaksi->price_package,
            'quantity' => 1,
            'name' => $package->name
        );

        // Optional
        $item_details = array ($items);
                
                
        // Optional
        $customer_details = array(
            'first_name'    => $user->username,
            'email'         => $user->email,
            'phone'         => $user->phone_number
        );
        
        
       
        $data = [
            'transaction_details'=>$transaction_details,
            'item_details'=>$item_details,
            'customer_details'=>$customer_details,
            'server_key'=>$server_key
        ];       
        $this->load->view('client/transaksi/proses.php',$data);
    }
    public function invoice($id_transaksi)
    {
       
        
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
       
        $transaksi = $this->transaksi_model->getbyId($id_transaksi);
     
        // print_r($transaksi);
        $order_id = rand()."-".$transaksi->id;
        $grouss_amount = $transaksi->total_price;
        $id_package = $transaksi->id_package;
        $id_user = $transaksi->id_user;
        
        $package = $this->package_model->getbyId($id_package);
        $user = $this->user_model->getbyId($id_user);

        $transaction_details = array(
            'order_id' => $order_id,
            'gross_amount' => $grouss_amount, // no decimal allowed for creditcard
        );
          // Optional
          $items = array(
            'id' => "PKG00".$package->id,
            'price' => $transaksi->price_package,
            'quantity' => 1,
            'name' => $package->name
        );

        // Optional
        $item_details = array ($items);
                
                
        // Optional
        $customer_details = array(
            'first_name'    => $user->username,
            'email'         => $user->email,
            'phone'         => $user->phone_number
        );
        
        
        $data['devices'] = $this->transaksi_model->getbyId2($id_transaksi);    
        $data['transaction_details'] =$transaction_details;
      
        $data['item_details'] = $item_details;
        $data['customer_details'] =$customer_details ;
        $data['server_key'] =  $data['setting']->server_key;
        $data['client_key'] =  $data['setting']->client_key;
        $data['url_handle_notification'] = base_url( $data['setting']->url_handle_notification);
           
        $this->load->view('layouts/header', $data);
        $this->load->view('client/transaksi/invoice', $data);
        $this->load->view('layouts/footer',$data);
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
