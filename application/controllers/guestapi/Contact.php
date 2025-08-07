<?php

class Contact extends CI_Controller
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
        $this->load->model('contact_model');
        $this->load->model('group_model');
    }
    public function save()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if($data->name == ""){
            $response = ["success" => false, "message" => "name empty "];
        }else if($data->number == ""){
            $response = ["success" => false, "message" => "number empty "];
        }else{
    // print_r($data);
            $save = $this->contact_model->add2($data->name,$data->number,$data->id_group,$data->api_key);
                
            if($save){
                $cek = $this->whatsva->checkNumber_server($data->number);
              
                    if($cek){
                        $dcek = json_decode($cek);
                       if($dcek->success){
                        //    add 1 active number
                        $dgroup = $this->group_model->getWhere2(["id"=>$data->id_group]);
                        $active_contact = $dgroup->contact_active;
                        $update = $this->group_model->update(["contact_active"=>$active_contact+1],$data->id_group);
                       }else{
                        $this->contact_model->update_where(["block"=>"1"],["number"=>$data->number]);
                       }
                    }
                

                $response = ["success" => true, "message" => "success "];
            }
        }
    
        echo json_encode($response);
    }
}