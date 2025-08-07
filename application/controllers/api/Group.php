<?php

class Group extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('whatsva');
        header("Content-Type: application/json");
        $this->load->model('messages_model');
        $this->load->model('setting_model');
    }
    // Group Messages
    public function sendMessageText()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->message) {
            $response = ["success" => false, "message" => "message empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);
        
            if($cekstatus->success){
                if($cekstatus->data->status==="authenticated"){
                    $response = $this->whatsva->sendMessageTextGroup($data->instance_key, $data->jid, $data->message,$datasetting->panel_key);
                    $response = json_decode($response);
                  
                    if($response){
                        if ($response->success) {
                            $type = "chat-text";
                            $status = "received";
                            $date_time = Date('Y-m-d h:m:s');
                            $this->messages_model->insert($data->instance_key, $data->message, $data->jid,$type, $status, $date_time, $response);
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
    public function sendImageUrl()
    {
        
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->imageUrl) {
            $response = ["success" => false, "message" => "imageUrl empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendImageUrlGroup($data->instance_key, $data->jid, $data->imageUrl, @$data->caption,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-image";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, $data->imageUrl, $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
            
        }
        echo json_encode($response);
    }
    public function sendDocumentUrl()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->documentUrl) {
            $response = ["success" => false, "message" => "documentUrl empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendDocumentUrlGroup($data->instance_key, $data->jid, $data->documentUrl,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-document";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key,  $data->documentUrl, $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
            
        }
        echo json_encode($response);
    }
    public function sendVideoUrl()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->videoUrl) {
            $response = ["success" => false, "message" => "videoUrl empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendVideoUrlGroup($data->instance_key, $data->jid, $data->videoUrl, @$data->caption,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-video";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key,  $data->videoUrl, $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
           
        }
        echo json_encode($response);
    }
    public function sendLocation()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->coordinates) {
            $response = ["success" => false, "message" => "coordinate empty"];
        } else {
            $coordinate = $data->coordinates;
            if (!@$coordinate->lat) {
                $response = ["success" => false, "message" => "lat empty"];
            } else if (!@$coordinate->long) {
                $response = ["success" => false, "message" => "long empty"];
            }
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendLocationGroup($data->instance_key, $data->jid, $coordinate->lat, $coordinate->long,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-location";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key,  json_encode($coordinate), $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
            
        }
        echo json_encode($response);
    }
    public function sendVCard()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->fullname) {
            $response = ["success" => false, "message" => "fullname empty"];
        } else if (!@$data->organization) {
            $response = ["success" => false, "message" => "organization empty"];
        } else if (!@$data->phoneNumber) {
            $response = ["success" => false, "message" => "phoneNumber empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendVCardGroup($data->instance_key, $data->jid, $data->fullname, $data->organization, $data->phoneNumber,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-vcard";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($data), $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
           
        }
        echo json_encode($response);
    }
    public function sendListMessage()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->title) {
            $response = ["success" => false, "message" => "title empty"];
        }  
        else if (!@$data->text) {
            $response = ["success" => false, "message" => "text empty"];
        }else if (!@$data->footer) {
            $response = ["success" => false, "message" => "footer empty"];
        } 
        else if (!@$data->buttonText) {
            $response = ["success" => false, "message" => "buttonText empty"];
        }
        
         else if (!@$data->sections) {
            $response = ["success" => false, "message" => "sections empty"];
        } else {
                //     echo json_encode($listMessage);
                //    die;
                $datasetting = $this->setting_model->getSetting();
                $response = $this->whatsva->sendListMessageGroup(
                    $data->instance_key, 
                    $data->jid, 
                    $data->title, 
                    $data->text, 
                    $data->footer, 
                    $data->buttonText, 
                    $data->sections,
                    $datasetting->panel_key);

                $response = json_decode($response);
                if($response){
                    if ($response->success) {
                        $type = "chat-list-message";
                        $status = "received";
                        $date_time = Date('Y-m-d h:m:s');
                        $this->messages_model->insert($data->instance_key,  json_encode($data->sections), $data->jid, $type, $status, $date_time, $response);
                    }
                }else{
                    $response = ["success"=>false,"message"=>"cant connect to server"];
                }
              
            

        }
        echo json_encode($response);
    }
    public function sendButtonMessage()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->contentText) {
            $response = ["success" => false, "message" => "contentText empty"];
        } else if (!@$data->footerText) {
            $response = ["success" => false, "message" => "footerText empty"];
        } else if (!@$data->buttons) {
            $response = ["success" => false, "message" => "buttons empty"];
        } else {
            $buttons = $data->buttons;
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendButtonMessageGroup($data->instance_key, $data->jid, $data->contentText, $data->footerText, $buttons,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-button-message";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key,json_encode($buttons), $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
         
        }
        echo json_encode($response);
    }
    public function sendTemplateMessages()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->text) {
            $response = ["success" => false, "message" => "text empty"];
        } else if (!@$data->footer) {
            $response = ["success" => false, "message" => "text empty"];
        }
         else if (!@$data->templateButtons) {
            $response = ["success" => false, "message" => "templateButtons empty"];
        } else {
            $buttons = $data->templateButtons;
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendTemplateMessagesGroup($data->instance_key, $data->jid, $data->text,$data->footer,$data->imageUrl, $buttons,$datasetting->panel_key);
            $response = json_decode($response);
            if($response){
                if ($response->success) {
                    $type = "chat-button-link-message";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($buttons), $data->jid, $type, $status, $date_time, $response);
                }
            }else{
                $response = ["success"=>false,"message"=>"cant connect to server"];
            }
         
        }
        echo json_encode($response);
    }
    // End Group Message

    // Group Event 

    public function createGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->groupName) {
            $response = ["success" => false, "message" => "groupName empty"];
        } else if (!@$data->participants) {
            $response = ["success" => false, "message" => "participants empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->createGroup($data->instance_key, $data->groupName, $data->participants);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function makeAdminGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->participants) {
            $response = ["success" => false, "message" => "participants empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->makeAdminGroup($data->instance_key, $data->jid, $data->participants);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function demoteAdminGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->participants) {
            $response = ["success" => false, "message" => "participants empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->demoteAdminGroup($data->instance_key, $data->jid, $data->participants);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function addParticipants()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->participants) {
            $response = ["success" => false, "message" => "participants empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->addParticipants($data->instance_key, $data->jid, $data->participants);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function removeParticipants()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->participants) {
            $response = ["success" => false, "message" => "participants empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->removeParticipants($data->instance_key, $data->jid, $data->participants);
                    $response = json_decode($response);
                    if($response){
                       
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

    public function updateSubjectGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->subject) {
            $response = ["success" => false, "message" => "subject empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->updateSubjectGroup($data->instance_key, $data->jid, $data->subject);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function updateDescriptionGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        } else if (!@$data->description) {
            $response = ["success" => false, "message" => "description empty"];
        } else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->updateDescriptionGroup($data->instance_key, $data->jid, $data->description);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function leaveGroup()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->leaveGroup($data->instance_key, $data->jid);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function inviteCode()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->inviteCode($data->instance_key, $data->jid);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function listParticipants()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->listParticipants($data->instance_key, $data->jid);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function groupInfo()
    {
       
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
    
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else if (!@$data->jid) {
            $response = ["success" => false, "message" => "jid empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->instancecData($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if($cekstatus->success){
                if($cekstatus->data->instance_status){
                    $response = $this->whatsva->groupInfo($data->instance_key, $data->jid);
                    $response = json_decode($response);
                    if($response){
                       
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
    public function listGroup()
    {
        // Takes raw data from the request
        $json = file_get_contents('php://input');
        $data = json_decode($json);
      
        if (!@$data->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        }else {
            $datasetting = $this->setting_model->getSetting();
            $cekstatus = $this->whatsva->statusInstance($data->instance_key,$datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);
           
            if($cekstatus->success){
                if($cekstatus->data->status==="authenticated"){
                    $response = $this->whatsva->listGroup($data->instance_key);
                    $response = json_decode($response);
                    if($response){
                       
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
    // End Group Event

}
