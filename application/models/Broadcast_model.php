<?php

class Broadcast_model extends CI_Model
{
    private $_table = "tb_broadcast";
    const SESSION_KEY = 'id';

    public function rules()
    {
        return [
            [
                'field' => 'broadcast_name',
                'label' => 'BroadCast Name',
                'rules' => 'required',
            ]
        ];
    }

    public function add2($name,$device,$id_group,$message,$datetime,$code_guest)
    {
	  
        $data = [
            'broadcast_name' => $name,
            'instance_id' => $device,
            'id_list' => $id_group,
            'message'=>$message,
            'id_user'=>"",
            'status'=>'1',
            'date_time'=>$datetime,
            'code_guest'=>$code_guest
        ];

        return $this->db->insert($this->_table, $data);
 
    }

    public function add($name,$device,$id_group,$message,$datetime)
    {
	    if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);
      
        $data = [
            'broadcast_name' => $name,
            'instance_id' => $device,
            'id_list' => $id_group,
            'message'=>$message,
            'id_user'=>$user_id,
            'status'=>'1',
            'date_time'=>$datetime
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
        $this->db->select($this->_table.".*,tb_group.name as name_list,device_name");
		$this->db->from($this->_table);
        
        $this->db->join("tb_group",$this->_table.".id_list = tb_group.id");
        $this->db->join("tb_device",$this->_table.".instance_id = tb_device.id");
		$this->db->where($this->_table.".id_user",$user_id);
		$this->db->order_by($this->_table.".id","desc");
		$this->db->limit($start,$limit);
        $query = $this->db->get();
		return $query->result();

        
	}
    public function getAll2($limit,$start,$code_guest)
    {
        
        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_group.name as name_list,device_name");
		$this->db->from($this->_table);
        
        $this->db->join("tb_group",$this->_table.".id_list = tb_group.id");
        $this->db->join("tb_device",$this->_table.".instance_id = tb_device.id");
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
        return $query->result();
    }
    public function getWhere3($where)
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
        $this->db->delete('tb_broadcast_detail',['id_broadcast'=>$id]);
        return $this->db->delete($this->_table,["id"=>$id]);
    }

}
