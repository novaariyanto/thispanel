<?php

class Service extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('whatsva');
        header("Content-Type: application/json");
        $this->load->model('messages_model');
        $this->load->model('messageIn_model');
        $this->load->model('setting_model');
        $this->load->model('webhook_model');
        $this->load->model('autoreply_model');
        $this->load->model('device_model');
    }
   
    public function index()
    {   
            $json = file_get_contents('php://input');
             $data = json_decode($json);
         
            if($data){
                // event
                 $event = $data->event;
                $instance = $data->instance_key;
              
                 if($event === "message"){
                   
                    $webhooks = $this->webhook_model->getWhere(["instance_key"=>$instance]);
                    foreach ($webhooks as $value) {
                     
                      if($value->status){
                      
                        $webhooks =   $this->curlData($value->url,$data->data);
                        $reply_webhook = json_decode($webhooks);
                        if($reply_webhook->success){
                            $dreply = $reply_webhook->data;
                            if($dreply->type == "chat"){
                                $sender = $data->data->key->remoteJid;
                                $response = $this->whatsva->sendMessageText($instance, $sender, $dreply->body,"");
                                $response = json_decode($response);
                                if($response){
                                    if ($response->success) {
                                        $type = "chat-text";
                                        $status = "send";
                                        $date_time = Date('Y-m-d h:m:s');
                                        $this->messages_model->insert($data->instance_key, $dreply->body, $sender,$type, $status, $date_time, $response);
                                    }
                                }else{
                                    $response = ["success"=>false,"message"=>"cant connect to server"];
                                }
                                echo json_encode($response);
                            }
                        }
                      }
                    }
                    if(@$data->data->message->message->conversation){
                        // format lama
                        $message = $data->data->message->message->conversation;
                        $sender = $data->data->message->key->remoteJid;
                        $replys = $this->autoreply_model->getWhere2(["receive"=>$message,"instance_key"=>$instance]);
                        if($replys){
                            $response = $this->whatsva->sendMessageText($instance, $sender, $replys->reply,"");
                        }
                        // insert type message text
                        $data_message = $data->data->message;
                        $type = "chat-text";
                        $status = "received";
                        $timestamp = $data_message->messageTimestamp;
                        $datetimeFormat = 'Y-m-d h:m:s';

                        $date_time = Date($datetimeFormat);
                        // If you must have use time zones
                        // $date = new \DateTime('now', new \DateTimeZone('Europe/Helsinki'));
                     
                        $save_message_in = $this->messageIn_model->insert($data_message->key->id,$instance,$date_time,$data_message->key->id,$sender,$type,$status,$message,$data_message);   
                    }else{
                       
                        if(@$data->data->conversation){
                            // format lama
                            $message = $data->data->conversation;
                            $chat = $data->data->chat;
                            if(@$chat->type =="wapJid"){
                              $sender = $chat->jid->user;
                            }
                          
                          
                            $replys = $this->autoreply_model->getWhere2(["receive"=>$message,"instance_key"=>$instance]);
                            if($replys){
                                $response = $this->whatsva->sendMessageText($instance, $sender, $replys->reply,"");
                            }
                            // insert type message text
                            $data_message = $data->data;
                            $type = "chat-text";
                            $status = "received";
                            // $timestamp = $data_message->messageTimestamp;
                            $datetimeFormat = 'Y-m-d h:m:s';
    
                            $date_time = Date($datetimeFormat);
                            // If you must have use time zones
                            // $date = new \DateTime('now', new \DateTimeZone('Europe/Helsinki'));
                        
                            $save_message_in = $this->messageIn_model->insert($data_message->externalId,$instance,$date_time,$data_message->externalId,$sender,$type,$status,$message,$data_message);   
                        }else{
                         
                            if(@$data->data->message->conversation){
                                $message = $data->data->message->conversation;
                                $sender = $data->data->key->remoteJid;
                                $replys = $this->autoreply_model->getWhere2(["receive"=>$message,"instance_key"=>$instance]);
                                if($replys){
                                    $response = $this->whatsva->sendMessageText($instance, $sender, $replys->reply,"");
                                    $response = json_decode($response);
                                    if($response){
                                        if ($response->success) {
                                            $type = "chat-text";
                                            $status = "send";
                                            $date_time = Date('Y-m-d h:m:s');
                                            $this->messages_model->insert($data->instance_key, $replys->reply, $sender,$type, $status, $date_time, $response);
                                        }
                                    }else{
                                        $response = ["success"=>false,"message"=>"cant connect to server"];
                                    }
                                }
                                // insert type message text
                                $data_message = $data->data;
                                $type = "chat-text";
                                $status = "received";
                                $timestamp = $data_message->messageTimestamp;
                                $datetimeFormat = 'Y-m-d h:m:s';
        
                                $date_time = Date($datetimeFormat);
                                // If you must have use time zones
                                // $date = new \DateTime('now', new \DateTimeZone('Europe/Helsinki'));
                             
                                $save_message_in = $this->messageIn_model->insert($data_message->key->id,$instance,$date_time,$data_message->key->id,$sender,$type,$status,$message,$data_message);   
                        
                            }
                        }
                    }
                 
                }else if($event === "open"){
                    $updateStatus = $this->device_model->update_where(["status" => 2], ["api_key"=>$instance]);
                    $webhooks = $this->webhook_model->getWhere(["instance_key"=>$instance]);
                    foreach ($webhooks as $value) {
                     
                      if($value->status){
                        $curl =   $this->curlData($value->url,$data);
                      }
                    }
                }else if($event === "logout"){
                    $updateStatus = $this->device_model->update_where(["status" => 1], ["api_key"=>$instance]);
                    $webhooks = $this->webhook_model->getWhere(["instance_key"=>$instance]);
                    foreach ($webhooks as $value) {
                     
                      if($value->status){
                        $curl =   $this->curlData($value->url,$data);
                      }
                    }
                }else if($event === "update_me"){
                    $device_number = @$data->data->username;
                    $updateStatus = $this->device_model->update_where(["device_number" => $device_number], ["api_key"=>$instance]);
                }
                else{
                    $webhooks = $this->webhook_model->getWhere(["instance_key"=>$instance]);
                    foreach ($webhooks as $value) {
                     
                      if($value->status){
                        $curl =   $this->curlData($value->url,$data);
                      }
                    }
                }
                // end event
               
            }else{
                echo json_encode([
                    "success"=>false,
                    "message"=>"Request data not found"
                ]);
            }
        

    }
    public function curlData($url, $data)
    {
      
        $curl = curl_init();

         $payload = json_encode($data);

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;

    }
}