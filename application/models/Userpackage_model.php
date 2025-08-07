<?php

class Userpackage_model extends CI_Model
{
    private $_table = "tb_user_package";
    const SESSION_KEY = 'id';

    public function rules()
    {
        return [
            [
                'field' => 'name',
                'label' => 'Name',
                'rules' => 'required',
            ],
            [
                'field' => 'price',
                'label' => 'Price',
                'rules' => 'required',
            ], [
                'field' => 'device_max',
                'label' => 'Device_max',
                'rules' => 'required',
            ], [
                'field' => 'day_value',
                'label' => 'Day Value',
                'rules' => 'required',
            ]
        ];
    }


    public function insert($id_user,$id_package)
    {
        $data = [
            'id_user' => $id_user,
            'id_package' => $id_package,
            'status'=> "1",
            'date_time'=>Date('Y-m-d h:m:s')
        ];
        return $this->db->insert($this->_table, $data);
       
    }
    public function update_($id_user,$id_package)
    {
        $data = [
            'id_user' => $id_user,
            'id_package' => $id_package,
            'status'=> "1",
            'date_time'=>Date('Y-m-d h:m:s')
        ];

        return $this->db->update($this->_table, $data, ['id_user' => $id_user]);
    }
    public function getJoin($id_user)
    {
      
        $this->db->select("tb_package.*,tb_user_package.date_time");
		$this->db->from($this->_table);
        $this->db->where($this->_table.".status","1");
        $this->db->join("tb_package",$this->_table.".id_package = tb_package.id");
        $this->db->join("tb_user",$this->_table.".id_user = ".$id_user);
		$this->db->order_by("tb_user_package.id","desc");
        $query = $this->db->get();
    
		return $query->row();
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
        $this->db->where('status','1');
		$this->db->order_by("id","desc");
        $query = $this->db->get();

        
	
        return 	$query->num_rows();
	}
    public function getAll()
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
		$this->db->from($this->_table);
        $this->db->where("status","1");
		$this->db->order_by("id","desc");
        $query = $this->db->get();
		return $query->result();
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
	public function update($data,$id)
	{
		return $this->db->update($this->_table, $data, ['id' => $id]);
	}
  
    public function delete($id)
	{
		return $this->db->update($this->_table, ['status'=>'0'], ['id' => $id]);
	}

}
