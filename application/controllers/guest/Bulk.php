<?php

class Bulk extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('auth_model');   
       
		$this->load->model('messages_model');
		$this->load->model('setting_model');
		$this->load->model('device_model');
        $this->load->model('broadcast_model');
        $this->load->model('bcd_model');
        
        $this->load->model('group_model');
        $this->load->model('contact_model');
	}
    public function detail($id_group)
    {
          
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
       
        $page = @$_GET['page'];
		$limit = 10;
      
		if(!@$page){
			$start = 0;
		}else{
			$start = $page * $limit;
		}
        
         
        if($id_group){
           
            $data['devices'] = $this->bcd_model->getWhere5($start,$limit,$id_group);
            $data['devices_count']= $this->bcd_model->getCount5($id_group);
        }else{
            $data['devices'] = [];
            $data['devices_count']= 0;
        }

        $this->load->view('layouts/header', $data);
        $this->load->view('guest/bulk/detail', $data);
        $this->load->view('layouts/footer');

    
    }
    public function index()
    {
		$data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();

		$page = @$_GET['page'];
		$limit = 10;
		if(!@$page){
			$start = 0;
		}else{
			$start = $page * $limit;
			
		}
		$data['messages'] = $this->broadcast_model->getAll($start,$limit);
		$data['messages_count']= $this->broadcast_model->getCount();

        $this->load->view('layouts/header', $data);
        $this->load->view('guest/bulk/list', $data);
        $this->load->view('layouts/footer');
    }
	public function add()
    {
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] =     $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();
        $data['groups'] = $this->group_model->getAlls();
        

        $rules = $this->broadcast_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('guest/bulk/add', $data);
            $this->load->view('layouts/footer');
            return;
        }
        $code_guest = $this->input->post('api_key');
        $broadcast_name = $this->input->post('broadcast_name');
        $device = $this->input->post('device');
        $list = $this->input->post('list');
        $message = $this->input->post('message');
        $date = $this->input->post('date');
        $time = $this->input->post('time');
        $datetime = $date." ".$time;


		$datasetting = $this->setting_model->getSetting();
        if ($this->broadcast_model->add2($broadcast_name,$device,$list,$message,$datetime,$code_guest)) {
            redirect('./guest_bulks');
        } else {
            $this->session->set_flashdata('message_add_device_error', 'Add Broadcast Failure');
        }
     
        $this->load->view('layouts/header', $data);
        $this->load->view('guest/bulk/add', $data);
        $this->load->view('layouts/footer');

    }
    public function edit($id)
    {   
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();
        $data['webhook'] = $this->broadcast_model->getbyId($id);
        $data['groups'] = $this->group_model->getAlls();

        $rules = $this->broadcast_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('guest/bulk/edit', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $broadcast_name = $this->input->post('broadcast_name');
        $device = $this->input->post('device');
        $list = $this->input->post('list');
        $message = $this->input->post('message');
        $date = $this->input->post('date');
        $time = $this->input->post('time');
        $datetime = $date." ".$time;
 
   
        $data = [
            'broadcast_name' => $broadcast_name,
            'instance_id' => $device,
            'id_list' => $list,
            'message'=>$message,
            'date_time'=>$datetime
        ];
    
		
        if ($this->broadcast_model->update($data,$id)) {
            redirect('./bulk');
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('guest/bulk/edit', $data);
        $this->load->view('layouts/footer');
    }
	// ... ada kode lain di sini ...
    public function delete($id)
    {
        if ($this->broadcast_model->delete($id)) {
            redirect('./guest_bulks');
        }
      
    }
}