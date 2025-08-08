<?php

class Messages extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('whatsva');
        header("Content-Type: application/json");
        $this->load->model('messages_model');
        $this->load->model('setting_model');

        $this->load->model('transaksi_model');
        $this->load->model('device_model');
        $this->load->model('auth_model');

        $json = file_get_contents('php://input');
        $dataa = json_decode($json);
        if (!@$dataa->instance_key) {
            $response = ["success" => false, "message" => "instance_key empty"];
        } else {
            $data_device = $this->device_model->getWhere(["api_key" => $dataa->instance_key]);
            if ($data_device) {
                if ($data_device->guest) {
                    $messages = $this->messages_model->getCount2($dataa->instance_key);
                    if($messages >= 100){
                        die('kuota anda sudah habis, gunakan versi berbayar untuk mengirim ke lebih banyak pengguna');
                    }
                } else {
                    $data['transaksi'] = $this->transaksi_model->getWhere2(["id_user" => $data_device->id_user, "status_paid" => "3"]);
                    $active_day = 0;

                    foreach ($data['transaksi'] as $a => $value) {
                        # code...
                        $active_day += $value->day_value;

                    }
                    $start_date = substr(@$data['current_user']->start_date, 0, 10);

                    $data['active_day'] = $active_day;

                    $date = date_create($start_date);
                    $d = date_add($date, date_interval_create_from_date_string($active_day . " days"));
                    $end_date = date_format($date, "d-M-Y");
                    $data['end_date'] = $end_date;
                    $data['start_date'] = date_format(date_create($start_date), "d-M-Y");
                    $a = new DateTime(date(''));
                    $b = new DateTime($end_date);

                    $remaining = $b->diff($a)->days;
                    if ($remaining < 1) {
                        die('masa aktif habis');
                    }
                }

            } else {
                die('masa aktif habis');
            }

        }

    }

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
            $cekstatus = $this->whatsva->statusInstance($data->instance_key, $datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);
           
            if ($cekstatus->connected) {
                $response = $this->whatsva->sendMessageText($data->instance_key, $data->jid, $data->message, $datasetting->panel_key);
                    $response = json_decode($response);
                    if ($response) {
                        if ($response->success) {
                            $type = "chat-text";
                            $status = "send";
                            $date_time = Date('Y-m-d h:m:s');
                            $this->messages_model->insert($data->instance_key, $data->message, $data->jid, $type, $status, $date_time, $response);
                        }
                    } else {
                        $response = ["success" => false, "message" => "cant connect to server"];
                    }
            } else {
                $response = ["success" => false, "message" => "cant connect server "];
            }

        }
        echo json_encode($response);
    }
    function convert_wa($str){
  
        $pattern = "/microsoft/i";
        
        $w_format = [
            
            ["symbol"=>"/<p>/","tag"=>""],
            ["symbol"=>"/&nbsp;/","tag"=>" "],
            ["symbol"=>"/<b>/","tag"=>"*"],
            ["symbol"=>"/<strong>/","tag"=>"*"],
            ["symbol"=>"/<em>/","tag"=>"_"],
            ["symbol"=>"/<del>/","tag"=>"~"],
            
            ["symbol"=>"|</p>|","tag"=>""],
            ["symbol"=>"|</b>|","tag"=>"|* |"],
            ["symbol"=>"|</strong>|","tag"=>"*"],
            ["symbol"=>"|</em>|","tag"=>"_"],
            ["symbol"=>"|</del>|","tag"=>"~"],

            ["symbol"=>"/%20/","tag"=>" "],
            ["symbol"=>"/%0A/","tag"=>"\n"],
            ["symbol"=>"/%3A/","tag"=>":"],
            ["symbol"=>"/%3D/","tag"=>"="],
            ["symbol"=>"/%2C/","tag"=>","]
        ];
        $result = "";
        // $str = "";
        foreach ($w_format as $key => $value) {
            // print_r($value["symbol"]."-".$value["tag"]);
        // echo "<br>";
        
            $match =  preg_match($value['symbol']."", $str);
            for($i = 0; $i < $match; ++$i) {
                $pattern = $value['symbol'];
                $tag = $value["tag"];
                $str =  preg_replace($pattern, $tag, $str);
                
    
            }
        }
        return $str;
    }
    public function sendMessageTextbc()
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
            $cekstatus = $this->whatsva->statusInstance($data->instance_key, $datasetting->panel_key);
            $cekstatus = json_decode($cekstatus);

            if ($cekstatus->connected) {
 $response = $this->whatsva->sendMessageText($data->instance_key, $data->jid, $this->convert_wa($data->message), $datasetting->panel_key);
                    $response = json_decode($response);
                    if ($response) {
                        if ($response->success) {
                            $type = "chat-text";
                            $status = "send";
                            $date_time = Date('Y-m-d h:m:s');
                            $this->messages_model->insert($data->instance_key, $data->message, $data->jid, $type, $status, $date_time, $response);
                        }
                    } else {
                        $response = ["success" => false, "message" => "cant connect to server"];
                    }            } else {
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
            $response = $this->whatsva->sendImageUrl($data->instance_key, $data->jid, $data->imageUrl, @$data->caption, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-image";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, $data->imageUrl, $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
            $response = $this->whatsva->sendDocumentUrl($data->instance_key, $data->jid, $data->documentUrl, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-document";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, $data->documentUrl, $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
            $response = $this->whatsva->sendVideoUrl($data->instance_key, $data->jid, $data->videoUrl, @$data->caption, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-video";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, $data->videoUrl, $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
            $response = $this->whatsva->sendLocation($data->instance_key, $data->jid, $coordinate->lat, $coordinate->long, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-location";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode(@$data->coordinates), $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
            $response = $this->whatsva->sendVCard($data->instance_key, $data->jid, $data->fullname, $data->organization, $data->phoneNumber, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-vcard";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($data), $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
        } else if (!@$data->text) {
            $response = ["success" => false, "message" => "text empty"];
        } else if (!@$data->footer) {
            $response = ["success" => false, "message" => "footer empty"];
        } else if (!@$data->buttonText) {
            $response = ["success" => false, "message" => "buttonText empty"];
        } else if (!@$data->sections) {
            $response = ["success" => false, "message" => "sections empty"];
        } else {
            //     echo json_encode($listMessage);
            //    die;
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendListMessage(
                $data->instance_key,
                $data->jid,
                $data->title,
                $data->text,
                $data->footer,
                $data->buttonText,
                $data->sections,
                $datasetting->panel_key);

            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-list-message";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($data->sections), $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
            $response = $this->whatsva->sendButtonMessage($data->instance_key, $data->jid, $data->contentText, $data->footerText, @$data->imageUrl, $buttons, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-button-message";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($buttons), $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
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
        } else if (!@$data->templateButtons) {
            $response = ["success" => false, "message" => "templateButtons empty"];
        } else {
            $buttons = $data->templateButtons;
            $datasetting = $this->setting_model->getSetting();
            $response = $this->whatsva->sendTemplateMessages($data->instance_key, $data->jid, $data->text, $data->footer, $data->imageUrl, $buttons, $datasetting->panel_key);
            $response = json_decode($response);
            if ($response) {
                if ($response->success) {
                    $type = "chat-button-link-message";
                    $status = "received";
                    $date_time = Date('Y-m-d h:m:s');
                    $this->messages_model->insert($data->instance_key, json_encode($buttons), $data->jid, $type, $status, $date_time, $response);
                }
            } else {
                $response = ["success" => false, "message" => "cant connect to server"];
            }

        }
        echo json_encode($response);
    }

}
