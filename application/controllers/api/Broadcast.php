<?php

class Broadcast extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        header("Content-Type: application/json");
        $this->load->library('whatsva');
        $this->load->model('messages_model');
        $this->load->model('setting_model');
        $this->load->model('broadcast_model');
        $this->load->model('contact_model');
        $this->load->model('bcd_model');
        $this->load->model('device_model');
        $this->load->model('broadcast_model');
    }
     function sendMessageText($instance_key,$jid,$message)
    {
       
     
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if(!strpos($jid,"@s.whatsapp.net")){
            $jid = $jid."@s.whatsapp.net";
        }
        
        if (!@$instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$message) {
            $response = ["success" => false, "message" => "message empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->statusInstance($instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);
         
            if($cekstatus->success){
               
                if($cekstatus->data->status==="authenticated"){
                  
                    $response = $this->whatsva->sendMessageText($instance_key, $jid, $message,$datasetting->panel_key);
                    $response = json_decode($response);
                    if($response){
                        if ($response->success) {
                            $type = "chat-text";
                            $status = "received";
                            $date_time = Date('Y-m-d h:m:s');
                            $this->messages_model->insert($instance_key, $message, $jid,$type, $status, $date_time, $response);
                        }
                        $response = ["success"=>true,"message"=>"sending message"];
                    }else{
                        $response = ["success"=>false,"message"=>"cant connect to server"];
                    }
                    
                }else{
                    $response =["success" => false, "message" => "your instance/ device is disconnect"];
                }
            }else{
                $response = ["success" => false, "message" => "cant connect server "];
            }
           
        }
        return $response;
    }
    public function runningJob()
    {
          // Takes raw data from the request
          $json = file_get_contents('php://input');
          $data = json_decode($json);
  
          if (!@$data->apikey == "token123") {
              $response = ["success" => false, "message" => "apikey empty"];
          } else {
              $where = [
                  "status"=>'0',
              ];
  
              $response = $this->bcd_model->getWhere3($where);
              if(sizeof($response)>0){
                  // running job
                 
                  foreach($response as $value){
                    
                    // $this->bcd_model->update(["status"=>"2"],$value->id);
                    $id_broadcast = $value->id_broadcast;

                    $data = $this->bcd_model->getWhere2(["id_broadcast"=>$id_broadcast,"status"=>"0"]);
                   
                    // update broadcast & send
                    $data_instance = $this->device_model->getWhere(["id"=>$data->sender]);
                    $data_message = $this->broadcast_model->getWhere3(["id"=>$data->id_broadcast]);
                    $data_contact = $this->contact_model->getWhere2(['id'=>$data->receiver]);
                    $instance_key = $data_instance->api_key;
                    $jid = $data_contact->number;
                     $message = $data_message->message;
                  
                    // update bcd_status
                   $sending = $this->sendMessageText($instance_key,$jid,$message);
                    

                   if($sending['success']){
                    $update = $this->bcd_model->update(["status"=>"1"],$value->id);
                       $bc_data = $this->bcd_model->getWhere4(["status"=>"0","id_broadcast"=>$value->id_broadcast]);
                        if(sizeof($bc_data)==0){
                            $update_bc = $this->broadcast_model->update(["status"=>"3"],$value->id_broadcast);
                        }
                   }else{
                    //    print_r($jid);
                    // $update = $this->bcd_model->update(["status"=>'3'],$value->id);
                   }
                //    cek broadcast status
                

                }
                $response = ["success" => true, "message" => "running job "];
              }else{
                 
                $response = ["success" => false, "message" => "job empty"];
              }

        }
        echo json_encode($response);
    }
    public function createJob()
    {

        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if (!@$data->apikey == "token123") {
            $response = ["success" => false, "message" => "apikey empty"];
        } else {
            $where = [
                "status"=>1
            ];

            $response = $this->broadcast_model->getWhere2($where);
            // print_r($data);
            date_default_timezone_set("Asia/Jakarta");
            $now = date("Y-m-d H:i:s");
            if(sizeof($response)> 0){
            foreach($response as $value){
                $fd = $value->date_time;
               
                
                if($value->status == "1"){
                  
                    
                    if($fd <= $now){
                     
                         $data = [
                             "status"=>2
                         ];
                         $data_receiver = $this->contact_model->getWhere3(["id_group"=>$value->id_list,"block"=>"0"]);
                         foreach($data_receiver as $vl){
                             
                            $save =  $this->bcd_model->add($value->id,$value->instance_id,$vl->id,0,'');
                            
                         }
                         $udpate_status_bc = $this->broadcast_model->update($data,$value->id);
                    }
                }  
            }    
            $response = ["success" => true, "message" => "running broadcast"];
        }else{
            $response = ["success" => false, "message" => "data broadcast empty"];
        }
           
        }
        echo json_encode($response);
    }

}
