<?php

class Group_model extends CI_Model
{
    private $_table = "tb_group";
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
                'field' => 'deskripsi',
                'label' => 'Deskripsi',
                'rules' => 'required'   ,
            ]
        ];
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
    public function add($name,$deskripsi)
    {
	    if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
      
        $user_id = $this->session->userdata(self::SESSION_KEY);
      
        $data = [
            'name' => $name,
            'deskripsi' => $deskripsi,
            'status' => "1",
            'id_user'=>$user_id
        ];

        return $this->db->insert($this->_table, $data);
 
    }
    public function add2($name,$deskripsi,$code_guest)
    {
	
      
        $data = [
            'name' => $name,
            'deskripsi' => $deskripsi,
            'status' => "1",
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
        $this->db->where("id_user",$user_id);
		$this->db->order_by("id","desc");
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
        $this->db->select("*");
		$this->db->from($this->_table);
		$this->db->where("id_user",$user_id);
		$this->db->order_by("id","desc");
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
    public function getWhere($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->result();
    }
    public function getWhere2($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->row();
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
   
    public function delete($id)
    {
        return $this->db->delete($this->_table,["id"=>$id]);
    }

}
