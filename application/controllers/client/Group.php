<?php

class Group extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
        if (!$this->auth_model->current_user()) {
            redirect('auth/login');
        }
        $data_user =$this->auth_model->current_user(); 
        if($data_user->level !== "1"){
            redirect('/dashboard');
        }
        $this->load->model('setting_model');
        $this->load->model('device_model');
		$this->load->model('messages_model');
        $this->load->library('whatsva');
        $this->load->model('group_model');
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

        $data['devices'] = $this->group_model->getAll($start,$limit);
        $data['devices_count']= $this->group_model->getCount();

        $this->load->view('layouts/header', $data);
        $this->load->view('client/group/list', $data);
        $this->load->view('layouts/footer');

    }
    public function add()
    {
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();

        $rules = $this->group_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('client/group/add', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $name = $this->input->post('name');
        $deskripsi = $this->input->post('deskripsi');
    

		$datasetting = $this->setting_model->getSetting();
        if ($this->group_model->add($name,$deskripsi)) {
            redirect('./group');
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('client/group/add', $data);
        $this->load->view('layouts/footer');

    }
    public function edit($id)
    {   
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();
        $data['webhook'] = $this->group_model->getbyId($id);
        
        $rules = $this->group_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('client/group/edit', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $name = $this->input->post('name');
        $deskripsi = $this->input->post('deskripsi');
        
   
        $instance = $this->input->post('instance_key');
        $data = [
            "name"=>$name,
            "deskripsi"=>$deskripsi
        ];
    
		
        if ($this->group_model->update($data,$id)) {
            redirect('./group');
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('client/group/edit', $data);
        $this->load->view('layouts/footer');
    }
    public function delete($id)
    {
        if ($this->group_model->delete($id)) {
            redirect('./group');
        }
      
    }
  
  
    // ... ada kode lain di sini ...
}
