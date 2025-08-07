<?php

class Package extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
        $this->load->library('whatsva');
        if (!$this->auth_model->current_user()) {
           
            redirect('auth/login');
        }
        $data_user =$this->auth_model->current_user(); 
        if($data_user->level !== "2"){
            redirect('/dashboard');
        }
      
        $this->load->model('setting_model');
        $this->load->model('user_model');
        $this->load->model('package_model');
		$this->load->model('messages_model');
        $this->load->library('whatsva');
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

        $data['devices'] = $this->package_model->getAll($start,$limit);
       
        $data['devices_count']= $this->package_model->getCount();

        $this->load->view('layouts/header', $data);
        $this->load->view('admin/package/list', $data);
        $this->load->view('layouts/footer');

    }
    public function add()
    {
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();


        $rules = $this->package_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('admin/package/add', $data);
            $this->load->view('layouts/footer');
            return;
        }
        $name = $this->input->post('name');
        $price = $this->input->post('price');
        $device_max = $this->input->post('device_max');
        $day_value = $this->input->post('day_value');
        if ($this->package_model->insert($name,$price,$device_max,$day_value)) {
            redirect('./packages');
        }
  
 
        $this->load->view('layouts/header', $data);
        $this->load->view('admin/package/add', $data);
        $this->load->view('layouts/footer');

    }
    public function edit($id)
    {   
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['package'] = $this->package_model->getbyId($id);
        $rules = $this->package_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('admin/package/edit', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $name = $this->input->post('name');
        $price = $this->input->post('price');
        $device_max = $this->input->post('device_max');
        $day_value = $this->input->post('day_value');
        $data = [
            "name"=>$name,
            "price"=>$price,
            "device_max"=>$device_max,
            "day_value"=>$day_value
        ];
		
        if ($this->package_model->update($data,$id)) {
            redirect('./packages');
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('admin/package/edit', $data);
        $this->load->view('layouts/footer');
    }
    public function delete($id)
    {
		if($this->package_model->delete($id)){
            redirect('/packages');
        }
    }
}
