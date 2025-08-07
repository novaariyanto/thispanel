<?php

class Contact extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('auth_model');
      
        $this->load->model('setting_model');
        $this->load->model('device_model');
		$this->load->model('messages_model');
        $this->load->library('whatsva');
        $this->load->model('contact_model');
        $this->load->model('group_model');
    
    }

    public function index()
    {
        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $id_group = @$_GET['id_group'];
        $page = @$_GET['page'];
		$limit = 10;
      
		if(!@$page){
			$start = 0;
		}else{
			$start = $page * $limit;
		}
        
         
        if($id_group){
           
            $data['devices'] = $this->contact_model->getWheres($start,$limit,$id_group);
            $data['devices_count']= $this->contact_model->getCount();
        }else{
            $data['devices'] = [];
            $data['devices_count']= 0;
        }
        

        $this->load->view('layouts/header', $data);
        $this->load->view('guest/contact/list', $data);
        $this->load->view('layouts/footer');

    }
    public function add()
    {
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['group'] = $this->group_model->getAlls();

        $rules = $this->contact_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {
            
            $this->load->view('layouts/header', $data);
            $this->load->view('guest/contact/add', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $name = $this->input->post('name');
        $number = $this->input->post('number');
        $id_group = $this->input->post('id_group');
    

		$datasetting = $this->setting_model->getSetting();
        if ($this->contact_model->add($name,$number,$id_group)) {
        
            $params = '?id_group='.$id_group;

            $cek = $this->whatsva->checkNumber_server($number);
           
                if($cek){
                    $dcek = json_decode($cek);
                   if($dcek->success){
                    //    add 1 active number
                    $dgroup = $this->group_model->getWhere2(["id"=>$id_group]);
                    $active_contact = $dgroup->contact_active;
                    $update = $this->group_model->update(["contact_active"=>$active_contact+1],$id_group);
                   }else{
                    $this->contact_model->update_where(["block"=>"1"],["number"=>$number]);
                   }
                }
            
            // redirect('./guest_contact'.$params);
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('guest/contact/add', $data);
        $this->load->view('layouts/footer');

    }
    public function import()
    {
            
        $this->load->library('excel');
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['group'] = $this->group_model->getAlls();
        
        $api_key = $this->input->post('api_key');

        $rules = $this->contact_model->rules2();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {  
            $this->load->view('layouts/header', $data);
            $this->load->view('guest/contact/import', $data);
            $this->load->view('layouts/footer');
            return;
        }
        if (isset($_FILES["file"]["name"])) {
			$path = $_FILES["file"]["tmp_name"];
			$object = PHPExcel_IOFactory::load($path);
            foreach($object->getWorksheetIterator() as $worksheet)
			{
				$highestRow = $worksheet->getHighestRow();
				$highestColumn = $worksheet->getHighestColumn();	
				for($row=2; $row<=$highestRow; $row++)
				{
					$name = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
					$number = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
                    
					$temp_data[] = array(
						'name'	=> $name,
                        'number'	=> $number,
					);
                    if($name != "" && $number != ""){
                        $id_group = $this->input->post('id_group');
                        if($this->contact_model->add2($name,$number,$id_group,$api_key )){
                            $cek = $this->whatsva->checkNumber_server($number);
                            if($cek){
                                $dcek = json_decode($cek);
                            if($dcek->success){
                                //    add 1 active number
                                $dgroup = $this->group_model->getWhere2(["id"=>$id_group]);
                                $active_contact = $dgroup->contact_active;
                                $update = $this->group_model->update(["contact_active"=>$active_contact+1],$id_group);
                            }else{
                                $this->contact_model->update_where(["block"=>"1"],["number"=>$number]);
                            }
                            }
                        }
                    }
				}
			}
        }

		redirect('./guest_contact?id_group='. $id_group);
      
        $this->load->view('layouts/header', $data);
        $this->load->view('guest/contact/import', $data);
        $this->load->view('layouts/footer');

    }
    public function edit($id,$id_group)
    {   
    
        $this->load->library('form_validation');

        $data['setting'] = $this->setting_model->getSetting();
        $data['current_user'] = $this->auth_model->current_user();
        $data['devices'] = $this->device_model->getAlls();
        $data['webhook'] = $this->contact_model->getbyId($id);
        $data['group'] = $this->group_model->getAlls();

        $rules = $this->contact_model->rules();
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run() == false) {

            $this->load->view('layouts/header', $data);
            $this->load->view('guest/contact/edit', $data);
            $this->load->view('layouts/footer');
            return;
        }

        $name = $this->input->post('name');
        $number = $this->input->post('number');
        
   
        $instance = $this->input->post('instance_key');
        $data = [
            "name"=>$name,
            "number"=>$number
        ];
    
		
        if ($this->contact_model->update($data,$id)) {
            redirect('./contact'.'?id_group='.$id_group);
        }
      
        $this->load->view('layouts/header', $data);
        $this->load->view('guest/contact/edit', $data);
        $this->load->view('layouts/footer');
    }
    public function delete($id,$id_group)
    {
        $dgroup = $this->group_model->getWhere2(["id"=>$id_group]);
        $active_contact = $dgroup->contact_active;
        $dcontact = $this->contact_model->getWhere2(["id"=>$id]);
        
        if($dcontact->block != "1"){
          
            $update = $this->group_model->update(["contact_active"=>$active_contact-1],$id_group);
        }

        if ($this->contact_model->delete($id)) {
            redirect('./guest_contact'.'?id_group='.$id_group);
        }
      
    }
  
  
    // ... ada kode lain di sini ...
}
