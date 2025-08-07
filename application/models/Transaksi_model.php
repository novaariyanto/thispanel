<?php

class Transaksi_model extends CI_Model
{
    private $_table = "tb_transaksi";
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
	

    public function insert($kode_transaksi,$id_user,$id_package,$total_price, $discount,$day_value,$price_package)
    {   
        if($total_price < 1){
            $status = "3";
        }else{
            $status = "1";
        }
        $data = [
            'kode_transaksi' => $kode_transaksi,
            'id_user' => $id_user,
            'id_package' => $id_package,
            'total_price'=> $total_price,
            'discount'=> $discount,
            'status_paid'=>$status,
            'day_value'=>$day_value,
            'price_package'=>$price_package,
            'status'=>"1",
            'date_time'=> Date('Y-m-d h:m:s')
        ];
       
        return $this->db->insert($this->_table, $data);
       
    }
    public function _update($id,$id_user,$id_package,$total_price, $discount,$day_value,$price_package)
    {
        $data = [
            'id_user' => $id_user,
            'id_package' => $id_package,
            'total_price'=> $total_price,
            'discount'=> $discount,
            'status_paid'=>"1",
            'day_value'=>$day_value,
            'price_package'=>$price_package,
            'status'=>'1',
            'date_time'=> Date('Y-m-d h:m:s')
        ];
        return $this->db->update($this->_table, $data,["id"=>$id]);
       
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
    public function getAll($limit,$start)
    {
        if (!$this->session->has_userdata(self::SESSION_KEY)) {
            return null;
        }
        $user_id = $this->session->userdata(self::SESSION_KEY);

        // $query = $this->db->get_where($this->_table, ['id_user' => $user_id]);

        $this->db->select("tb_transaksi.*,tb_package.name package_name,tb_user.username");
		$this->db->from($this->_table);
        $this->db->where("tb_transaksi.status","1");
        $this->db->where("tb_transaksi.id_user",$user_id);
        $this->db->join("tb_package",$this->_table.".id_package = tb_package.id");
        $this->db->join("tb_user",$this->_table.".id_user = tb_user.id");
		$this->db->order_by("tb_transaksi.id","desc");
		$this->db->limit($limit,$start);
        $query = $this->db->get();
		return $query->result();
	}
    public function getAlls($limit,$start)
    {
        if(!@$limit){
            $limit = 10;
        }
        if(!@$start){
            $start = 0;
        }
        $this->db->select("tb_transaksi.*,tb_package.name package_name,tb_user.username");
		$this->db->from($this->_table);
     
        $this->db->join("tb_package",$this->_table.".id_package = tb_package.id");
        $this->db->join("tb_user",$this->_table.".id_user = tb_user.id");
		$this->db->order_by("id","desc");
		$this->db->limit($limit,$start);
        $query = $this->db->get();
    
		return $query->result();
	}
    public function getbyId2($id)
    {
        $this->db->select("tb_transaksi.*,tb_package.name package_name,tb_user.*");
		$this->db->from($this->_table);
        $this->db->where($this->_table.".id",$id);
        $this->db->join("tb_package",$this->_table.".id_package = tb_package.id");
        $this->db->join("tb_user",$this->_table.".id_user = tb_user.id");
        $query = $this->db->get();
    
		return $query->row();
	}
	public function getbyId($id)
	{
		$query = $this->db->get_where($this->_table, ['id' => $id]);
        return $query->row();
	}
    public function getWhere2($where)
	{
		$query = $this->db->get_where($this->_table, $where);
        return $query->result();
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
		return $this->db->update($this->_table, ['status'=>'0'], ['id' => $id]);
	}

}
