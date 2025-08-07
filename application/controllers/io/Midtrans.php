<?php

class Midtrans extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('transaksi_model');
        $this->load->model('userpackage_model');
        header("Content-Type: application/json");
    }
   
    public function index()
    {  
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        
       if($data){
        $transactionStatus = $data->transaction_status;
        $fraudStatus = $data->fraud_status;
        $order_id = $data->order_id;
        $id_order_plode = explode("-",$order_id);

        if($transactionStatus == "capture"){
            if($fraudStatus == "challenge"){
                $message = "challenge";
            }else if($fraudStatus == "accept"){
                //lunas
                $message = "accept";
                $this->transaksi_model->update(['status_paid'=>'3'],$id_order_plode[1]);
                $data_transaksi = $this->transaksi_model->getbyId($id_order_plode[1]);
                  
                $this->userpackage_model->update_($data_transaksi->id_user,$data_transaksi->id_package);
            }
        }else if($transactionStatus == "settlement"){
                //lunas
                $message = "setttlement";
                $this->transaksi_model->update(['status_paid'=>'3'],$id_order_plode[1]);
                $data_transaksi = $this->transaksi_model->getbyId($id_order_plode[1]);
                  
                $this->userpackage_model->update_($data_transaksi->id_user,$data_transaksi->id_package);
        }else if($transactionStatus == "pending"){
                //pending
                $message = "pending";
                $this->transaksi_model->update(['status_paid'=>'2'],$id_order_plode[1]);
        }else{
            $message = "not found";
        }
        $response = [
            "success"=>true,
            "message"=>$message
        ];
        echo json_encode($response);
       }else{
           echo "can't get data";
       }
    //    {
    //     "transaction_time": "2022-01-08 11:49:51",
    //     "transaction_status": "pending",
    //     "transaction_id": "86bca11e-23cf-4d9e-8d1f-437e899b6a2f",
    //     "status_message": "midtrans payment notification",
    //     "status_code": "201",
    //     "signature_key": "cfff6a90d0a52b7328110cd2f7b050685b641ffc5ba1d7b11ed8c5638d06035dbdf1c7671e1deaf631f616a223ed79be625545e6b09f1d32503262a6886d8ada",
    //     "payment_type": "gopay",
    //     "order_id": "1807522024",
    //     "merchant_id": "G023841301",
    //     "gross_amount": "100000.00",
    //     "fraud_status": "accept",
    //     "currency": "IDR"
    //   }
    }
  
}