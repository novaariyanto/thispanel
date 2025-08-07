<?php

class Device_model extends CI_Model
{
    private $_table = "tb_device";
    const SESSION_KEY = 'id';

    public function rules()
    {
        return [
            [
                'field' => 'device_name',
                'label' => 'Device Name',
                'rules' => 'required',
            ],
        ];
    }
    public function authQr()
    {

        echo "auth";
    }
    public function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    public function add_guest($device_name, $panel_key, $code_guest)
    {
        # code...
        $this->load->library('whatsva');
        $this->load->model('userpackage_model');

        if ($this->getCount2($code_guest) >= 1) {
            $this->session->set_flashdata('message_add_device_error', "Device has reached the maximum package limit");
            return false;
        }

        $user_id = $this->session->userdata(self::SESSION_KEY);
        $data = [
            'device_name' => $device_name,
            'api_key' => $this->generateRandomString(12),
            'status' => "1",
            'id_user' => "",
            'reg_date' => date('Y-m-d'),
            'multidevice' => '1',
            'guest' => '1',
            'code_guest' => $code_guest,
        ];

        return $this->db->insert($this->_table, $data);
    }
    public function api_add($device_name,$user_id,$username, $panel_key)
    {
        $this->load->library('whatsva');
        $this->load->model('userpackage_model');
     
        $datapackage = $this->userpackage_model->getJoin( $user_id);
      
        if($this->getcount2($user_id) >= $datapackage->device_max){
            echo json_encode(["success"=>false,"message"=>"Device has reached the maximum package limit"]);
			return FALSE;
        }
        $cek = $this->db->get_where($this->_table, ["device_name"=>$device_name])->result();
    
        if(sizeof($cek) > 0){
            echo json_encode(["success"=>false,"message"=>"Device Name Already exists"]);
			return FALSE;
        }
        
	
				$data = [
					'device_name' => $device_name,
					'api_key' => $this->generateRandomString(12),
					'status' => "1",
					'id_user'=> $user_id,
					'reg_date'=>date('Y-m-d'),
                    'multidevice'=>'1'
				];
                $this->db->insert($this->_table, $data);
		
				return $data;
			
	
    }
    public function add($device_name, $panel_key)
    {
        $this->load->library('whatsva');
        $this->load->model('userpackage_model');
        $data_user = $this->auth_model->current_user();
        $username = str_replace(' ', '_', $data_user->username);
        $user_id = $this->session->userdata(self::SESSION_KEY);

        $datapackage = $this->userpackage_model->getJoin($user_id);

        if ($this->getCount() >= $datapackage->device_max) {
            $this->session->set_flashdata('message_add_device_error', "Device has reached the maximum package limit");
            return false;
        }

        $user_id = $this->session->userdata(self::SESSION_KEY);
        $data = [
            'device_name' => $username . "_" . $device_name,
            'api_key' => $this->generateRandomString(12),
            'status' => "1",
            'id_user' => $user_id,
            'reg_date' => date('Y-m-d'),
            'multidevice' => '1',
        ];

        return $this->db->insert($this->_table, $data);

    }

    public function getCount()
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where("id_user", $user_id);
        $this->db->order_by("id", "desc");
        $query = $this->db->get();

        return $query->num_rows();
    }
    public function getCount2($code_guest)
    {

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where("code_guest", $code_guest);
        $this->db->order_by("id", "desc");
        $query = $this->db->get();

        return $query->num_rows();
    }
    public function getAllsLevel($level)
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);
        if ($level === "1") {
            $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);

            return $query->result();
        } else {
            $query = $this->db->get($this->_table);
            return $query->result();
        }

    }
    public function getAll($limit, $start)
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where("id_user", $user_id);
        $this->db->order_by("id", "asc");
        $this->db->limit($start, $limit);
        $query = $this->db->get();
        return $query->result();
    }
    public function ngab()
    {
        return ["sds"=>"asdf"];
    }
    public function getAll2($limit, $start, $code_guest)
    {

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where("code_guest", $code_guest);
        $this->db->order_by("id", "desc");
        $this->db->limit($start, $limit);
        $query = $this->db->get();
        $d = $query->result_array();

        return $d;
    }
    public function getAlls()
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);

        return $query->result();
    }
    public function getbyId($id)
    {
        $query = $this->db->get_where($this->_table, ['id' => $id]);
        return $query->row();
    }
    public function getWhere($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->row();
    }
    public function getSetting()
    {
        $query = $this->db->get_where($this->_table, ['id' => "1"]);
        return $query->row();
    }
    public function update_where($data, $where)
    {
        return $this->db->update($this->_table, $data, $where);
    }
    public function update($data, $id)
    {
        return $this->db->update($this->_table, $data, ['id' => $id]);
    }
    public function update_($app_name, $domain, $panel_key)
    {
        $data = [
            'app_name' => $app_name,
            'domain' => $domain,
            'panel_key' => $panel_key,
        ];

        return $this->db->update($this->_table, $data, ['id' => $id]);
    }
    public function delete($id)
    {
        return $this->db->delete($this->_table,["id"=>$id]);
    }
}
