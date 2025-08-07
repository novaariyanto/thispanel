<?php

class Bcd_model extends CI_Model
{
    private $_table = "tb_broadcast_detail";

  const SESSION_KEY = 'id';



    public function add($id_broadcast,$sender,$receiver,$status,$response)
    {
	
         $data = [
             'id_broadcast'=>$id_broadcast,
            'sender' => $sender,
            'receiver' => $receiver,
            'status' => $status,
            'response'=>$response
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
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where($where);
        $this->db->order_by('id','asc');
        $query = $this->db->get();
        return $query->row();
    }
    public function getWhere3($where)
    {
       
        $query = $this->db->query('select * from '.$this->_table.' where status = 0  group by id_broadcast');
        // $query = $this->db->get_where($this->_table, $where)->group_by('id_broadcast');
        return $query->result();
    }
    public function getWhere4($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->result();
    }
    public function getWhere5($limit,$start,$id_group)
    { 
        
    
        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select($this->_table.".*,tb_contact.name contact_name");
        $this->db->from($this->_table);
        $this->db->join("tb_contact",$this->_table.".receiver = tb_contact.id");
        
        // $this->db->where($this->_table.".id_user",$user_id);
        $this->db->where($this->_table.".id_broadcast",$id_group);
        $this->db->order_by($this->_table.".id","desc");
        $this->db->limit($start,$limit);
        $query = $this->db->get();
        return $query->result();
    }
    public function getCount5($id_group)
	{
      
        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
		$this->db->from($this->_table);
        
		$this->db->where($this->_table.".id_broadcast",$id_group);
		$this->db->order_by($this->_table.".id","desc");

        $query = $this->db->get();
	
        return 	$query->num_rows();
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
