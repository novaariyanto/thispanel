<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Paypal_model extends CI_Model{
    public function __construct()
    {
        $this->load->database();
    }
    //get and return product rows
    public function getProducts($id = ''){
        $this->db->select('id,name,image,price');
        $this->db->from('products');
        if($id){
            $this->db->where('id',$id);
            $query = $this->db->get();
            $result = $query->row_array();
        }else{
            $this->db->order_by('name','asc');
            $query = $this->db->get();
            $result = $query->result_array();
        }
        return !empty($result)?$result:false;
    }
       //get and return product rows
       public function getpayment($where){
        $this->db->select('*');
        $this->db->from("payments");
        $this->db->where($where);
        $results = $this->db->get()->row();
        return $results;
    }
 
    //insert transaction data
    public function storeTransaction($data = array()){
        $insert = $this->db->insert('payments',$data);
        return $insert?true:false;
    }
}