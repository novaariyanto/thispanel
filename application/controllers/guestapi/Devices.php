<?php

class Devices extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('whatsva');
        header("Content-Type: application/json");
        $this->load->model('messages_model');
        $this->load->model('setting_model');
        $this->load->model('device_model');
        $this->load->model('auth_model');
        $this->load->model('transaksi_model');
    }
    public function list()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
       
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->api_key) {
            $response = ["success" => false, "message" => "api_key empty"];
        }else{
            $code_guest = $data->api_key;
            $page = @$_GET['page'];
            $limit = 10;
            if(!@$page){
                $start = 0;
            }else{
                $start = $page * $limit;
                
            }
    
            $data =$this->device_model->getAll2($start,$limit,$code_guest);
            // print_r($data);
            // $data['devices_count']= $this->device_model->getCount2($code_guest);
         
    
            $response = ["success" => true, "message" => "device data","data"=> $data];
           
        }
        echo json_encode($response);
       
    }
    public function add()
    {
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();

        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if (!@$data->device_name) {
            $response = ["success" => false, "message" => "device name empty"];
        }else  if (!@$data->api_key) {
            $response = ["success" => false, "message" => "api_key empty"];
        } else{
            
        $devicename = $this->input->post('device_name');
		$datasetting = $this->setting_model->getSetting();
        if ($this->device_model->add_guest($data->device_name, $datasetting->panel_key,$data->api_key)) {
            $response = ["success" => true, "message" => "successfully add device"];

        }else{
            $response = ["success" => false, "message" => "failed add device"];
        }
        echo json_encode($response);
       
      
    }


    }
  
    public function generateQr()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            
            $qr = $this->whatsva->generatedQr($data->instance_key,$datasetting->panel_key,"1");
            echo $qr;
        }

       
    }
    public function getQR($device)
    {
		$datasetting = $this->setting_model->getSetting();
        $data_device = $this->device_model->getbyId($device);
        if ($data_device) {
            $data = $this->whatsva->statusInstance($data_device->api_key,$datasetting->panel_key);
            $data = json_decode($data);
       
            if($data){
                if ($data->success) {
                    if ($data->data->status === "authenticated") {
                        $updateStatus = $this->device_model->update(["status" => 2], $data_device->id);
                    }
                    
                    echo json_encode(["success"=>"true","data"=>["qr"=>$data_device->qr_code]]);
    
                }
            }else{
                echo json_encode(["success"=>false,"message"=>"cant connect to server"]);
            }
        }

     
    }
    public function updateMultidevice()
    {
         // Takes raw data from the request
       
         $instance_key = $this->input->post('instance_key');
          $multidevice = $this->input->post('multidevice');
         
    
            if ($instance_key == "") {
                $response = ["success" => false, "message" => "instance_key empty"];
            } else if($multidevice == ""){
                $response = ["success" => false, "message" => "multidevice empty"];
            }else{
               
                $datasetting = $this->setting_model->getSetting();
            
                $data_device = $this->device_model->getWhere(["api_key"=>$instance_key]);
              
                if ($data_device) {
                    $update = $this->whatsva->updateMultideviceInstance($instance_key,$datasetting->panel_key,$multidevice);
                    $update = json_decode($update);
                    if($update){
                     
                        if($update->success){
                            $updateStatus = $this->device_model->update(["multidevice" => $multidevice], $data_device->id);
                           
                        }
                        echo json_encode($update);
                    }else{
                        echo json_encode(["success"=>false,"message"=>"cant connect to server"]);
                    }
                }
               
            }
       
        # code...
       
      
    }
}