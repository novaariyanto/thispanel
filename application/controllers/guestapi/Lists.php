<?php

class Lists extends CI_Controller
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
        $this->load->model('group_model');
    }
    public function save()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if($data->name == ""){
            $response = ["success" => false, "message" => "name empty "];
        }else if($data->deskripsi == ""){
            $response = ["success" => false, "message" => "deskripsi empty "];
        }else{
    // print_r($data);
            $save = $this->group_model->add2($data->name,$data->deskripsi,$data->api_key);
                
            if($save){
                $response = ["success" => true, "message" => "success "];
            }
        }
    
        echo json_encode($response);
    }
    public function list()
    {
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
    
            $data =$this->group_model->getAll2($start,$limit,$code_guest);
            // print_r($data);
            // $data['devices_count']= $this->device_model->getCount2($code_guest);
         
    
            $response = ["success" => true, "message" => "device data","data"=> $data];
           
        }
        echo json_encode($response);
       
    }
}