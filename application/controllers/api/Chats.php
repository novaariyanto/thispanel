<?php

class Chats extends CI_Controller
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
    public function listChats()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else {
            $data = $this->chat_model->getAlls($data->instance_key);
            $response = ["success" => true, "message" => "instance data","data"=>$data];
        }
        echo json_encode($response);
    }
    public function listMessages()
    {
          // Takes raw data from the request
          $json = file_get_contents('php://input');
          $data = json_decode($json);
      
          if (!@$data->instance_key) {
              $response = ["success" => false, "message" => "instance_key empty"];
          } else {
              $datasetting = $this->setting_model->getSetting();
              $cekstatus = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
              $cekstatus = json_decode($cekstatus);
  
              if($cekstatus->success){
                  if($cekstatus->data->status==="authenticated"){
                      $response = $this->whatsva->listMessages($data->instance_key);
                      $response = json_decode($response);
                      if($response){
                          if ($response->success) {
                              $data_chats = $response->data;
                            
                              foreach($data_chats as $key =>$value){
                                if(@$value->conversationTimestamp > 0){
                                    // save history chat
                                    $cek = $this->chat_model->getWhereCount(["jid"=>$value->id]);
                                    // update pp
                                    
                                    if($cek > 0){
                                       
                                        $update = $this->chat_model->update(["unreadCount"=>$value->unreadCount,"conversationTimestamp"=>date('Y-m-d h:m:s',$value->conversationTimestamp)],$value->id
                                        );
                                    }else{
                                        $save = $this->chat_model->add($value->id,$data->instance_key,$value->unreadCount,$value->conversationTimestamp);
                            
                                    }
                                      }
                              }
                             
                            $response = ["success"=>true,"message"=>"refresh success"];
                        }
                      }else{
                          $response = ["success"=>false,"message"=>"cant connect to server"];
                      }

                       $responseGroup = $this->whatsva->listMessagesGroup($data->instance_key);
                       $responseGroup = json_decode($responseGroup);
                  
                      if($responseGroup){
                          if ($responseGroup->success) {
                              $data_chats = $responseGroup->data;
                            
                              foreach($data_chats as $key =>$value){
                                if(@$value->conversationTimestamp > 0){
                                    // save history chat
                                    $cek = $this->chat_model->getWhereCount(["jid"=>$value->id]);
                                    // update pp
                                    
                                    if($cek > 0){
                                       
                                        $update = $this->chat_model->update(["unreadCount"=>$value->unreadCount,"conversationTimestamp"=>date('Y-m-d h:m:s',$value->conversationTimestamp),"pushName"=>$value->name],$value->id
                                        );
                                    }else{
                                        $save = $this->chat_model->add($value->id,$data->instance_key,$value->unreadCount,$value->conversationTimestamp,$value->name);
                            
                                    }
                                      }
                              }
                             
                            $response = ["success"=>true,"message"=>"refresh success"];
                        }
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
          echo json_encode($response);
    }
}
