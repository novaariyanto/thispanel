<?php

class Chat_model extends CI_Model
{
    private $_table = "tb_history_chat";
    const SESSION_KEY = 'id';

    public function rules()
    {
        return [
            [
                'field' => 'jid',
                'label' => 'Jid',
                'rules' => 'required',
            ]
        ];
    }
  


    public function add($jid,$instance_key,$unreadCount,$conversationTimestamp,$name='')
    {
	    
        $data = [
            'jid' => $jid,
            'instance_key' => $instance_key,
            'unreadCount' => $unreadCount,
            'conversationTimestamp'=>date('Y-m-d h:m:s',$conversationTimestamp),
            'pushName'=>$name
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
      

        $query = $this->db->get();
	
        return 	$query->num_rows();
	}
    public function getAll($limit,$start)
    {
       
        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);
        $this->db->select("*");
		$this->db->from($this->_table);
        // $this->db->join("tb_group",$this->_table.".id_group = tb_group.id");
        
		// $this->db->where($this->_table.".id_user",$user_id);
		// $this->db->order_by($this->_table.".id","desc");
		$this->db->limit($start,$limit);
        $query = $this->db->get();
		return $query->result();
	}
    public function getAlls($instance_key)
    {
        $this->db->select("*");
        $this->db->from($this->_table);
        $this->db->where(['instance_key' => $instance_key]);
        $this->db->order_by("conversationTimestamp","DESC");
        $query = $this->db->get();
		return $query->result();
	}
   
    public function getWhere($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->result();
    }
    public function getWhereCount($where)
    {
        $query = $this->db->get_where($this->_table, $where);
        return $query->num_rows();
    }
	public function getbyId($id)
	{
		$query = $this->db->get_where($this->_table, ['id' => $id]);
        return $query->row();
	}
  
	public function update($data,$jid)
	{
		return $this->db->update($this->_table, $data, ['jid' => $jid]);
	}
   
    public function delete($id)
    {
        return $this->db->delete($this->_table,["id"=>$id]);
    }

}
