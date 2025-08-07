<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Paypal extends CI_Controller
{
    function  __construct() {
        parent::__construct();
        $this->load->library('paypal_lib');
        $this->load->model('paypal_model');
        $this->load->model('package_model');
        $this->load->model('transaksi_model');
        $this->load->model('setting_model');
        $this->load->model('userpackage_model');
        $this->load->database();
    }
     
    function index(){
        $data = array();
        //get products inforamtion from database table
        $data['products'] = $this->paypal_model->getProducts();
        //loav view and pass the products information to view
        $this->load->view('client/paypal/index', $data);
    }
     
    function buyProduct($id){
        //Set variables for paypal form
        $returnURL = base_url().'index.php/payment/success'; //payment success url
        $failURL = base_url().'index.php/payment/fail'; //payment fail url
        $notifyURL = base_url().'index.php/payment/ipn'; //ipn url
        // $notifyURL = "https://webhook.site/dcc723ec-3867-4324-bf05-84008bc6cd71";
        //get particular product data
        $product = $this->paypal_model->getProducts($id);
        $userID = 1; //current user id
        $logo = base_url()."assets/img/brand/whatsva_brand.png";
        
        $setting = $this->setting_model->getSetting();

               
        $transaksi = $this->transaksi_model->getWhere(["kode_transaksi"=>$id]);
       
        $id_package = $transaksi->id_package;

        $id_user = $transaksi->id_user;

        $package = $this->package_model->getbyId($id_package);
        $amount = ceil($transaksi->total_price / 14350);

      
        $this->paypal_lib->add_field('return', $returnURL);
        $this->paypal_lib->add_field('fail_return', $failURL);
        $this->paypal_lib->add_field('notify_url', $notifyURL);
        $this->paypal_lib->add_field('item_name', $package->name);
        $this->paypal_lib->add_field('custom', $id);
        $this->paypal_lib->add_field('item_number',  $id_package);
        $this->paypal_lib->add_field('amount', $amount );        
        $this->paypal_lib->image($logo);
     
        $this->paypal_lib->paypal_auto_form();
    }
 
     function paymentSuccess(){
 
        //get the transaction data
        $paypalInfo = $this->input->get();
        $payerid = $paypalInfo['PayerID'];
        $datapayment = $this->paypal_model->getpayment(["payer_id"=>$payerid]);
        
        $data['item_number'] = $datapayment->product_id; 
        $data['txn_id'] = $datapayment->txn_id;
        $data['payment_amt'] = $datapayment->payment_gross;
        $data['currency_code'] = $datapayment->currency_code;
        $data['status'] = $datapayment->payment_status;
         
        //pass the transaction data to view
        $this->load->view('client/paypal/payment_success', $data);
     }
      
     function paymentFail(){
        //if transaction cancelled
        $this->load->view('paypal/paymentFail');
     }
      
     function ipn(){
        //paypal return transaction details array
        $paypalInfo    = $this->input->post();
     
        $data['user_id'] = $paypalInfo['custom'];
        $data['product_id']    = $paypalInfo["item_number"];
        $data['txn_id']    = $paypalInfo["txn_id"];
        $data['payment_gross'] = $paypalInfo["mc_gross"];
        $data['currency_code'] = $paypalInfo["mc_currency"];
        $data['payer_email'] = $paypalInfo["payer_email"];
        $data['payment_status']    = $paypalInfo["payment_status"];
        $data['payer_id'] = $paypalInfo['payer_id'];
 
        $paypalURL = $this->paypal_lib->paypal_url;        
        $result    = $this->paypal_lib->curlPost($paypalURL,$paypalInfo);
         
        //check whether the payment is verified
        if(preg_match("/VERIFIED/i",$result)){
            //insert the transaction data into the database
            $this->transaksi_model->update(['status_paid'=>'3'],$paypalInfo['custom']);
            $d_transaksi = $this->transaksi_model->getbyId($paypalInfo['custom']);
            
            $id_user = $d_transaksi->id_user;
            $id_package = $d_transaksi->id_package;

            $this->userpackage_model->update_($id_user,$id_package);
            $this->paypal_model->storeTransaction($data);
        }
    }
}