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
    public function adding(Type $var = null)
    {
       
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        $devicename = $data->device_name;
        $username = $data->username;
        $password = $data->password;

        $login = $this->auth_model->login2($username,$password);
     
        if($login){
          
           $user_id = $login->id;
            $datasetting = $this->setting_model->getSetting();
         
           $add = $this->device_model->api_add($devicename,$user_id,$username, $datasetting->panel_key);
            
           if ($add) {
                echo json_encode(["success"=>true,"message"=>"Device add success","data"=>$add]);
            }else{
                // echo json_encode(["success"=>false,"message"=>"Device add failed"]);
            }
    
        }else{
            echo json_encode(["success"=>false,"message"=>"Device add failed"]);
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
          
           print_r($qr);
        }

       
    }

    public function statusInstance()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
     
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            
            $qr = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
            echo $qr;
        }

       
    }
    public function resetInstance()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
     
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            
            $qr = $this->whatsva->resetInstance($data->instance_key,$datasetting->panel_key);
           echo $qr;
        }

       
    }
    public function logoutInstance()
    {
          // Takes raw data from the request
          $json = file_get_contents('php://input');
          $data = json_decode($json);

          
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $data_device = $this->device_model->getWhere(["api_key"=>$data->instance_key]);
            print_r($data_device);
         
            $qr = $this->whatsva->resetInstance($data_device->api_key,$datasetting->panel_key);
            $qr = json_decode($qr);
            if($qr){
                $updateStatus = $this->device_model->update(["status" => 1], $data_device->id);
                $response = ["success" => true, "message" => "device logout ","instance_key"=>$data->instance_key];
            }else{
                $response = ["success" => false, "message" => "cant connect server "];
            }

        }
        echo json_encode($response);
    }
    public function getStatus()
    {
        
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else {
            
            
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->statusInstance($data->instance_key, $datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if ($cekstatus->success) {
                $data_device = $this->device_model->getWhere(["api_key"=>$data->instance_key]);
                $data_d = [
                    "device_number"=>$data_device->device_number,
                    "device_name"=>$data_device->device_name,
                    "instance_key"=>$data_device->api_key,
                    "status"=>($data_device->status =="2")?"paired":"Not Connected",
                    "reg_date"=>$data_device->reg_date
                ];
                $response = ["success" => true, "message" => "checking device status","data"=>$cekstatus->data,"device"=>$data_d];
            } else {
                $response = ["success" => false, "message" => "cant connect server "];
            }

        }
        echo json_encode($response);
    }
    public function getQR($device)
    {
		$datasetting = $this->setting_model->getSetting();
        $data_device = $this->device_model->getbyId($device);

        if ($data_device) {
            $data = $this->whatsva->getQR($data_device->api_key,$datasetting->panel_key,1);
            $data = json_decode($data);
          
            if($data){
                if($data->success){
              
                    if ($data->message === "WhatsApp sudah terhubung") {
                        $updateStatus = $this->device_model->update(["status" => 2], $data_device->id);
                        }

                        echo json_encode(["success"=>"true","data"=>["qr"=>$data->qr]]);
                    }else{
                        echo json_encode(["success"=>false,"message"=>$data->message]);
             
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