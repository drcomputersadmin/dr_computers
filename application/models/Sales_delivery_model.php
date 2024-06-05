<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sales_delivery_model extends CI_Model {

	//Datatable start
	var $table = 'db_delivery_notes as a';
	var $column_order = array( 'a.return_bit','a.id','a.delivery_date','a.delivery_code','a.reference_no','a.created_by','b.customer_name'); //set column field database for datatable orderable
	var $column_search = array('a.return_bit','a.id','a.delivery_date','a.delivery_code','a.reference_no','a.created_by','b.customer_name','a.delivery_status'); //set column field database for datatable searchable 
	var $order = array('a.id' => 'desc'); // default order  

	public function __construct()
	{
		parent::__construct();
		$CI =& get_instance();
	}

	private function _get_datatables_query()
	{
		
		$this->db->select($this->column_order);
		$this->db->from($this->table);
		$this->db->select("coalesce(a.grand_total,0)-coalesce(a.paid_amount,0) as sales_due");
		$this->db->from('db_customers as b');
		//$this->db->from('db_warehouse as c');
		$this->db->where('b.id=a.customer_id');
		//$this->db->where('c.id=a.warehouse_id');


		$customer_id = $this->input->post('customer_id');
		if(!empty($customer_id)){
			$this->db->where('a.customer_id',$customer_id);
		}


		 $sales_from_date = $this->input->post('sales_from_date');
	     $sales_from_date = system_fromatted_date($sales_from_date);
	     $sales_to_date = $this->input->post('sales_to_date');
	     $sales_to_date = system_fromatted_date($sales_to_date);
	     $users = $this->input->post('user_created_by');
	     if($users && !empty($users)){
	     	$this->db->where("upper(a.created_by)",strtoupper($users));
	     }
	     if($sales_from_date!='1970-01-01'){
	     	$this->db->where("a.delivery_date>=",$sales_from_date);
	     }
	     if($sales_to_date!='1970-01-01'){
	     	$this->db->where("a.delivery_date<=",$sales_to_date);
	     }

		$i = 0;
	
		foreach ($this->column_search as $item) // loop column 
		{
			if($_POST['search']['value']) // if datatable send POST for search
			{
				
				

				if($i===0) // first loop
				{
					$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.

					$this->db->like($item, $_POST['search']['value']);

				}
				else
				{
					$this->db->or_like($item, $_POST['search']['value']);
				}

				


				if(count($this->column_search) - 1 == $i) //last loop
					$this->db->group_end(); //close bracket
			}
			$i++;
		}
		
		if(isset($_POST['order'])) // here order processing
		{
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} 
		else if(isset($this->order))
		{
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
		$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}
	//Datatable end

	public function xss_html_filter($input){
		return $this->security->xss_clean(html_escape($input));
	}

	


	


	//Get sales_details
	public function get_details($id,$data){
		//Validate This sales already exist or not
		$query=$this->db->query("select * from db_delivery_notes where upper(id)=upper('$id')");
		if($query->num_rows()==0){
			show_404();exit;
		}
		else{
			$query=$query->row();
			$data['q_id']=$query->id;
			$data['item_code']=$query->item_code;
			$data['item_name']=$query->item_name;
			$data['category_name']=$query->category_name;
			$data['hsn']=$query->hsn;
			$data['unit_name']=$query->unit_name;
			$data['available_qty']=$query->available_qty;
			$data['alert_qty']=$query->alert_qty;
			$data['sales_price']=$query->sales_price;
			$data['gst_percentage']=$query->gst_percentage;
			
			return $data;
		}
	}
	/*public function update_sales($data){
		//Validate This sales already exist or not
		$this->db->trans_begin();
		extract($this->xss_html_filter($data));
		$query=$this->db->query("select * from db_sales where upper(item_name)=upper('$item_name') and id<>$q_id");
		if($query->num_rows()>0){
			return "This sales Name already Exist.";
		}
		else{
			///Find category_id
			$query2="select id from db_category where category_name='$category_name'";
			$category_id=$this->db->query($query2)->row()->id;
			$query1="update db_sales set 
						sales_price='$sales_price',
						sales_price='$sales_price',
						item_name='$item_name',
						category_name='$category_name',
						category_id='$category_id',
						hsn='$hsn',
						alert_qty='$alert_qty',
						unit_name='$unit_name',
						gst_percentage='$gst_percentage' where id=$q_id";
						
			if ($this->db->simple_query($query1)){
				   $this->db->trans_commit();
			        return "success";
			}
			else{
					$this->db->trans_rollback();
			        return "failed";
			}
		}
	}*/
	public function update_status($id,$status){
		
        $query1="update db_delivery_notes set delivery_status='$status' where id=$id";
        if ($this->db->simple_query($query1)){
            echo "success";
        }
        else{
            echo "failed";
        }
	}
	public function delete_sales_delivery($ids){
      	$this->db->trans_begin();
      	//Find the customer id in one aray
      	$q11 = $this->db->select("customer_id,id")->where("id in ($ids)")->get("db_delivery_notes");
      	$q6 = $this->db->select("item_id")->from("db_delivery_note_items")->where("delivery_note_id in ($ids)")->get();


      
      
		$q7=$this->db->query("delete from db_delivery_note_items where delivery_note_id in($ids)");
	

		//$q6=$this->db->query("select id from db_items");
		
		

		

		
		$this->db->trans_commit();
		return "success";
	}
	public function search_item($q){
		$json_array=array();
        $query1="select id,item_name from db_items where (upper(item_name) like upper('%$q%') or upper(item_code) like upper('%$q%'))";

        $q1=$this->db->query($query1);
        if($q1->num_rows()>0){
            foreach ($q1->result() as $value) {
            	$json_array[]=['id'=>(int)$value->id, 'text'=>$value->item_name];
            }
        }
        return json_encode($json_array);
	}
	
	public function find_item_details($id){
		$json_array=array();
        $query1="select id,hsn,alert_qty,unit_name,sales_price,sales_price,gst_percentage,available_qty from db_items where id=$id";

        $q1=$this->db->query($query1);
        if($q1->num_rows()>0){
            foreach ($q1->result() as $value) {
            	$json_array=['id'=>$value->id, 
        			 'hsn'=>$value->hsn,
        			 'alert_qty'=>$value->alert_qty,
        			 'unit_name'=>$value->unit_name,
        			 'sales_price'=>$value->sales_price,
        			 'sales_price'=>$value->sales_price,
        			 'gst_percentage'=>$value->gst_percentage,
        			 'available_qty'=>$value->available_qty,
        			];
            }
        }
        return json_encode($json_array);
	}

	



	
	/*v1.1*/
	/*public function inclusive($price='',$tax_per){
		return ($tax_per!=0) ? $price/(($tax_per/100)+1)/10 : $tax_per;
	}*/
	public function get_items_info($rowcount,$item_id){
		$q1=$this->db->select('*')->from('db_items')->where("id=$item_id")->get();
		$q3=$this->db->query("select * from db_tax where id=".$q1->row()->tax_id)->row();

		$stock	=	$q1->row()->stock;

		$qty = ($stock>1) ? 1 : $stock;
	      
		$info['item_id'] = $q1->row()->id;
		$info['item_name'] = $q1->row()->item_name;
		$info['description'] = '';//$q1->row()->description;
		$info['item_sales_qty'] = $qty;
		$info['item_available_qty'] = $stock;
		$info['item_sales_price'] = $q1->row()->sales_price;
		//$info['item_tax_id'] = $q1->row()->tax_id;
		$info['item_tax_name'] = $q3->tax_name;
		$info['item_price'] = $q1->row()->price;
		$info['item_tax_id'] = $q3->id;
		$info['item_tax'] = $q3->tax;
		$info['item_tax_type'] = $q1->row()->tax_type;
		$info['item_discount'] = 0;
		$info['item_discount_type'] = $q1->row()->discount_type;
		$info['item_discount_input'] = $q1->row()->discount;
		$info['purchase_price'] = $q1->row()->purchase_price;

		$info['item_tax_amt'] = ($q1->row()->tax_type=='Inclusive') ? calculate_inclusive($q1->row()->sales_price,$q3->tax) :calculate_exclusive($q1->row()->sales_price,$q3->tax);

		$this->return_row_with_data($rowcount,$info);
	}
	/* For Purchase Items List Retrieve*/
	public function return_sales_list($sales_id){
		$q1=$this->db->select('*')->from('db_delivery_note_items')->where("sales_id=$sales_id")->get();
		$rowcount =1;
		foreach ($q1->result() as $res1) {
			$q2=$this->db->query("select * from db_items where id=".$res1->item_id);
			$q3=$this->db->query("select * from db_tax where id=".$res1->tax_id)->row();
			
			$info['item_id'] = $res1->item_id;
			$info['description'] = $res1->description;
			$info['item_name'] = $q2->row()->item_name;
			//$info['description'] = $res1->description;
			$info['item_sales_qty'] = $res1->sales_qty;
			$info['item_available_qty'] = $q2->row()->stock+$info['item_sales_qty'];
			$info['item_price'] = $q2->row()->price;
			//$info['item_sales_price'] = $q2->row()->sales_price;
			$info['item_sales_price'] = $res1->price_per_unit;
			//$info['item_tax_id'] = $res1->tax_id;
			$info['item_tax_name'] = $q3->tax_name;
			$info['item_tax_id'] = $q3->id;
			$info['item_tax'] = $q3->tax;
			$info['item_tax_type'] = $res1->tax_type;
			$info['item_tax_amt'] = $res1->tax_amt;
			$info['item_discount'] = $res1->discount_input;

			$info['item_discount_type'] = $res1->discount_type;
			$info['item_discount_input'] = $res1->discount_input;
			$info['purchase_price'] = $res1->purchase_price;
			
			$result = $this->return_row_with_data($rowcount++,$info);
		}
		return $result;
	}

	public function return_row_with_data($rowcount,$info){
		extract($info);
		$item_amount = ($item_sales_price * $item_sales_qty) + $item_tax_amt;
		?>
            <tr id="row_<?=$rowcount;?>" data-row='<?=$rowcount;?>'>
               <td id="td_<?=$rowcount;?>_1">
                  <label class='form-control' style='height:auto;' data-toggle="tooltip" title='Edit ?' >
                  <a id="td_data_<?=$rowcount;?>_1" href="javascript:void(0)" onclick="show_sales_item_modal(<?=$rowcount;?>)" title=""><?=$item_name;?></a> 
                  		<i onclick="show_sales_item_modal(<?=$rowcount;?>)" class="fa fa-edit pointer"></i>
                  	</label>
               </td>

               <!-- description  -->
               <!-- <td id="td_<?=$rowcount;?>_17">
                  
                  <textarea rows="1" type="text" style="font-weight: bold; height=34px;" id="td_data_<?=$rowcount;?>_17" name="td_data_<?=$rowcount;?>_17" class="form-control no-padding"><?=$description;?></textarea>
               </td> -->

               <!-- Qty -->
               <td id="td_<?=$rowcount;?>_3">
                  <div class="input-group ">
                     <span class="input-group-btn">
                     <button onclick="decrement_qty(<?=$rowcount;?>)" type="button" class="btn btn-default btn-flat"><i class="fa fa-minus text-danger"></i></button></span>
                     <input typ="text" value="<?=($item_sales_qty > 0) ? $item_sales_qty : 0.0;?>" class="form-control no-padding text-center" onchange="item_qty_input(<?=$rowcount;?>)" id="td_data_<?=$rowcount;?>_3" name="td_data_<?=$rowcount;?>_3">
                     <span class="input-group-btn">
                     <button onclick="increment_qty(<?=$rowcount;?>)" type="button" class="btn btn-default btn-flat"><i class="fa fa-plus text-success"></i></button></span>
                  </div>
               </td>
               
               <!-- Unit Cost Without Tax-->
               <td id="td_<?=$rowcount;?>_10"><input type="text" name="td_data_<?=$rowcount;?>_10" id="td_data_<?=$rowcount;?>_10" class="form-control text-right no-padding only_currency text-center" onkeyup="calculate_tax(<?=$rowcount;?>)" value="<?=$item_sales_price;?>"></td>

               <!-- Discount -->
               <td id="td_<?=$rowcount;?>_8">
                  <input type="text" data-toggle="tooltip" title="Click to Change" onclick="show_sales_item_modal(<?=$rowcount;?>)" name="td_data_<?=$rowcount;?>_8" id="td_data_<?=$rowcount;?>_8" class="pointer form-control text-right no-padding only_currency text-center item_discount" value="<?=$item_discount;?>" onkeyup="calculate_tax(<?=$rowcount;?>)" readonly>
               </td>

               <!-- Tax Amount -->
               <td id="td_<?=$rowcount;?>_11" class="<?=tax_disable_class()?>">
                  <input type="text" name="td_data_<?=$rowcount;?>_11" id="td_data_<?=$rowcount;?>_11" class="form-control text-right no-padding only_currency text-center" value="<?=$item_tax_amt;?>" readonly>
               </td>

               <!-- Tax Details -->
               <td id="td_<?=$rowcount;?>_12" class="<?=tax_disable_class()?>">
                  <label class='form-control ' style='width:100%;padding-left:0px;padding-right:0px;'>
                  <a id="td_data_<?=$rowcount;?>_12" href="javascript:void(0)" data-toggle="tooltip" title='Click to Change' onclick="show_sales_item_modal(<?=$rowcount;?>)" title=""><?=$item_tax_name ;?></a>
                  	</label>
               </td>

               <!-- Amount -->
               <td id="td_<?=$rowcount;?>_9"><input type="text" name="td_data_<?=$rowcount;?>_9" id="td_data_<?=$rowcount;?>_9" class="form-control text-right no-padding only_currency text-center" style="border-color: #f39c12;" readonly value="<?=$item_amount;?>"></td>
               
               <!-- ADD button -->
               <td id="td_<?=$rowcount;?>_16" style="text-align: center;">
                  <a class=" fa fa-fw fa-minus-square text-red" style="cursor: pointer;font-size: 34px;" onclick="removerow(<?=$rowcount;?>)" title="Delete ?" name="td_data_<?=$rowcount;?>_16" id="td_data_<?=$rowcount;?>_16"></a>
               </td>
               <input type="hidden" id="td_data_<?=$rowcount;?>_4" name="td_data_<?=$rowcount;?>_4" value="<?=$item_sales_price;?>">
               <input type="hidden" id="td_data_<?=$rowcount;?>_15" name="td_data_<?=$rowcount;?>_15" value="<?=$item_tax_id;?>">
               <input type="hidden" id="td_data_<?=$rowcount;?>_5" name="td_data_<?=$rowcount;?>_5" value="<?=$item_tax_amt;?>">
               <input type="hidden" id="tr_available_qty_<?=$rowcount;?>_13" value="<?=$item_available_qty;?>">
               <input type="hidden" id="tr_item_id_<?=$rowcount;?>" name="tr_item_id_<?=$rowcount;?>" value="<?=$item_id;?>">
               <input type="hidden" id="tr_tax_type_<?=$rowcount;?>" name="tr_tax_type_<?=$rowcount;?>" value="<?=$item_tax_type;?>">
               <input type="hidden" id="tr_tax_id_<?=$rowcount;?>" name="tr_tax_id_<?=$rowcount;?>" value="<?=$item_tax_id;?>">
               <input type="hidden" id="tr_tax_value_<?=$rowcount;?>" name="tr_tax_value_<?=$rowcount;?>" value="<?=$item_tax;?>">
               <input type="hidden" id="description_<?=$rowcount;?>" name="description_<?=$rowcount;?>" value="<?=$description;?>">

               <input type="hidden" id="item_discount_type_<?=$rowcount;?>" name="item_discount_type_<?=$rowcount;?>" value="<?=$item_discount_type;?>">
               <input type="hidden" id="item_discount_input_<?=$rowcount;?>" name="item_discount_input_<?=$rowcount;?>" value="<?=$item_discount_input;?>">
               <input type="hidden" id="pur_price_<?=$rowcount;?>" name="pur_price_<?=$rowcount;?>" value="<?=$purchase_price;?>">
            </tr>
		<?php

	}
	
	
	
	
	

	
}
