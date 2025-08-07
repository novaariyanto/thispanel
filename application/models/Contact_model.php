<?php

class Contact_model extends CI_Model
{
    private $_table = "tb_contact";
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
                'field' => 'number',
                'label' => 'Number',
                'rules' => 'required'   ,
            ]
        ];
    }
    public function rules2()
    {
        return [
            [
                'field' => 'id_group',
                'label' => 'Group',
                'rules' => 'required',
            ]
        ];
    }


    public function add($name,$number,$id_group)
    {
	    if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);
      
        $data = [
            'name' => $name,
            'number' => $number,
            'id_group' => $id_group,
            'block'=>'0',
            'id_user'=>$user_id
        ];

        return $this->db->insert($this->_table, $data);
 
    }
    public function add2($name,$number,$id_group,$code_guest)
    {
	 
        $data = [
            'name' => $name,
            'number' => $number,
            'id_group' => $id_group,
            'block'=>'0',
            'id_user'=>"",
            'code_guest'=>$code_guest
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
        $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
		$this->db->where($this->_table.".id_user",$user_id);
		$this->db->order_by($this->_table.".id","desc");

        $query = $this->db->get();
	
        return 	$query->num_rows();
	}
    public function getAll($limit,$start)
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_group.name as group_name");
		$this->db->from($this->_table);
        $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
		$this->db->where($this->_table.".id_user",$user_id);
		$this->db->order_by($this->_table.".id","desc");
		$this->db->limit($start,$limit);
        $query = $this->db->get();
		return $query->result();
	}
    public function getAll2($limit,$start,$code_guest)
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_group.name as group_name");
		$this->db->from($this->_table);
        $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
		$this->db->where($this->_table.".code_guest",$code_guest);
		$this->db->order_by($this->_table.".id","desc");
		$this->db->limit($start,$limit);
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
    public function getWheres($limit,$start,$id_group)
    { 
        
      
        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_group.name as group_name");
        $this->db->from($this->_table);
        $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
        $this->db->where($this->_table.".id_group",$id_group);
        $this->db->order_by($this->_table.".id","desc");
        $this->db->limit($start,$limit);
        $query = $this->db->get();
        return $query->result();
    }
    public function getWhere($limit,$start,$id_group)
    { 
        
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
         }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_group.name as group_name");
        $this->db->from($this->_table);
        $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
        $this->db->where($this->_table.".id_user",$user_id);
        $this->db->where($this->_table.".id_group",$id_group);
        $this->db->order_by($this->_table.".id","desc");
        $this->db->limit($start,$limit);
        $query = $this->db->get();
        return $query->result();
    }
    public function getWhere2($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->row();
    }
    public function getWhere3($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->result();
    }
	public function getbyId($id)
	{
		$query = $this->db->get_where($this->_table, ['id' => $id]);
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
    public function update_where($data,$where)
	{
		return $this->db->update($this->_table, $data, $where);
	}
    public function delete($id)
    {
        return $this->db->delete($this->_table,["id"=>$id]);
    }

}
