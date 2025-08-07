<?php

class Tools extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('whatsva');
        header("Content-Type: application/json");
        $this->load->model('messages_model');
        $this->load->model('setting_model');
        $this->load->model('chat_model');
    }
    public function getImages()
    {

        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
     
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else {
            $cekwhere = $this->chat_model->getWhere(["jid"=>$data->jid."@s.whatsapp.net"]);
            if(sizeof($cekwhere) > 0){
                $datasetting = $this->setting_model->getSetting();
                $cekstatus = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
                $cekstatus = json_decode($cekstatus);
    
                if ($cekstatus) {
                    if($cekstatus->success){
                        if($cekstatus->data->status==="authenticated"){
                            $response = $this->whatsva->getImageProfil($data->instance_key, $data->jid);
                            $response = json_decode($response);
                            if ($response) {
                                if ($response->success) {
                                    $update = $this->chat_model->update(["foto_profil"=>"   "],$data->jid);
                                           
                                    $response = ["success" => true, "message" => $response->message];
                                    // print_r($response);
                                    // die;
                                }else{
                                    $update = $this->chat_model->update(["foto_profil"=>" "],$data->jid);
                                           
                                    $response = ["success" => true, "message" => $response->message];
                                    // print_r($response);
                                    // die;
                                }
                            } else {
                                $response = ["success" => false, "message" => "cant connect to server"];
                            }
    
                        } else {
                            $response = ["success" => false, "message" => "your instance/ device is disconnect"];
                        }
                    } else {
                        $response = ["success" => false, "message" => $cekstatus->message];
                    }
                } else {
                    $response = ["success" => false, "message" => "cant connect server "];
                }
            }else{
                $response = ["success" => false, "message" => "images found"];
            }
         

        }
        echo json_encode($response);
    }

    public function checkNumber()
    {

        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);
        
            if($cekstatus->success){
                if($cekstatus->data->status==="authenticated"){

                        $response = $this->whatsva->checkNumber($data->instance_key, $data->jid);
                        $response = json_decode($response);
                      
                        if ($response) {
                            if ($response->success) {
                                $response = ["success" => true, "message" => $response->message];
                            }
                        } else {
                            $response = ["success" => false, "message" => "cant connect to server"];
                        }

                  
                } else {
                    $response = ["success" => false, "message" => $cekstatus->message];
                }
            } else {
                $response = ["success" => false, "message" => "device not connect to server"];
            }

        }
        echo json_encode($response);
    }

}
