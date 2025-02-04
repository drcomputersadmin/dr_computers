<?php
  function demo_app(){
    return false;
  }
  function app_version(){
    return '2.3';
  }
  
  function sql_mode(){
    $CI =& get_instance();
    $q1 = $CI->db->query("SELECT @@sql_mode AS sql_mode")->row();
    return $q1->sql_mode;
  }
  function is_sql_full_group_by_enabled(){
    $sql_mode = sql_mode();
    $sql_mode = strtoupper($sql_mode);

    $mode = 'ONLY_FULL_GROUP_BY';
    return (strpos($sql_mode, $mode) !== false) ? show_sql_mode_page() : false;
  }

  function show_sql_mode_page(){
    $CI =& get_instance();
    if(!$CI->db->query(" SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))")){
      show_error("Please make sure your database should not be enabled with SQL_FULL_GROUP_BY, For More information Click on Given link: <a href='".base_url()."/help/#full_group_by' target='_blank'>Click here to check!</a>(Full Group By Check)", 403, $heading = "SQL_FULL_GROUP_BY ENABLED!!");
    }else{
      return true;
    }
  }
  function system_fromatted_date($date=''){
  $CI =& get_instance();
    if ($CI->session->userdata('view_date')=='dd/mm/yyyy') {
      return date('Y-m-d',strtotime(str_replace('/', '-', $date)));
    }
    elseif($CI->session->userdata('view_date')=='mm/dd/yyyy'){
      return date("Y-m-d",strtotime($date));
    }
    else{
      return date("Y-m-d",strtotime($date));
    }
  }
	function show_date($date=''){
	$CI =& get_instance();
    if ($CI->session->userdata('view_date')=='dd/mm/yyyy') {
      return date('d/m/Y',strtotime(str_replace('/', '-', $date)));
    }
    elseif($CI->session->userdata('view_date')=='mm/dd/yyyy'){
      return date("m/d/Y",strtotime($date));
    }
    else{
      return date("d-m-Y",strtotime($date));
    }
  }
  function show_time($time=''){
    if(empty($time)){
      return $time;
    }
    $CI =& get_instance();
    if($CI->session->userdata('view_time')=='24') {
      return date('h:i',strtotime($time));
    }
    else{
      return date('h:i a',strtotime($time));
    }
  }

  function return_item_image_thumb($path=''){
    return str_replace(".", "_thumb.", $path);
  }

  /*Find the change return show in pos or not*/
  function change_return_status(){
    $CI =& get_instance();
    return $CI->db->select('change_return')->get('db_sitesettings')->row()->change_return;
  }

  function get_change_return_amount($sales_id){
    $CI =& get_instance();
    return $CI->db->select('coalesce(sum(change_return),0) as change_return_amount')->where('sales_id',$sales_id)->get('db_salespayments')->row()->change_return_amount;
  }

  function get_invoice_format_id(){
    $CI =& get_instance();
    return $CI->db->select('sales_invoice_format_id')->where('id',1)->get('db_sitesettings')->row()->sales_invoice_format_id;
  }
  function is_enabled_round_off(){
    $CI =& get_instance();
    $round_off=$CI->db->select('round_off')->where('id',1)->get('db_sitesettings')->row()->round_off;
    if($round_off==1){
      return true;
    }
    return false;
  }
  function get_profile_picture(){
    $CI =& get_instance();
    $profile_picture = $CI->db->select('profile_picture')->where("id",$CI->session->userdata('inv_userid'))->get('db_users')->row()->profile_picture;
    if(!empty($profile_picture)){
      $profile_picture = base_url($profile_picture);
    }
    else{
      $profile_picture = base_url("theme/dist/img/avatar5.png");
    }
    return $profile_picture;
  }
  function record_customer_payment($customer_id=null){
    $CI =& get_instance();
    $customer_id_str='';
    if(empty($customer_id)){
      $CI->db->query("delete from db_customer_payments"); 
    }
    else{
      $CI->db->query("delete from db_customer_payments where customer_id=$customer_id");
      $customer_id_str = " and b.customer_id=$customer_id ";
    }
    
    
    $q1 = $CI->db->query("INSERT INTO db_customer_payments (salespayment_id,customer_id,payment_date,payment_type, 
      payment,payment_note,
      system_ip,system_name,created_date,
      created_time,created_by, STATUS ) 
      SELECT a.id,b.customer_id,a.payment_date,a.payment_type, 
           COALESCE(SUM(a.payment)),a.payment_note,
           a.system_ip,a.system_name,a.created_date,a.created_time,a.created_by,1 FROM db_salespayments AS a, db_sales AS b WHERE b.id=a.sales_id $customer_id_str GROUP BY a.id,b.customer_id,a.payment_type,a.payment_date,a.created_time,a.created_date");
    if(!$q1){
      return false;
    }
    return true;
  }
 function record_supplier_payment($supplier_id=null){
    $CI =& get_instance();
    $supplier_id_str='';
    if(empty($supplier_id)){
      $CI->db->query("delete from db_supplier_payments"); 
    }
    else{
      $CI->db->query("delete from db_supplier_payments where supplier_id=$supplier_id");
      $supplier_id_str = " and b.supplier_id=$supplier_id ";
    }

    $q1 = $CI->db->query("INSERT INTO db_supplier_payments ( purchasepayment_id,supplier_id,payment_date,payment_type, payment,payment_note,system_ip,system_name,created_date,created_time,created_by, STATUS ) SELECT a.id,b.supplier_id,a.payment_date,a.payment_type, COALESCE(SUM(a.payment)),a.payment_note,a.system_ip,a.system_name,a.created_date,a.created_time,a.created_by,1 FROM db_purchasepayments AS a, db_purchase AS b 
      WHERE b.id=a.purchase_id $supplier_id_str GROUP BY a.id,b.supplier_id,a.payment_type,a.payment_date,a.created_time,a.created_date");
    if(!$q1){
      return false;
    }
    return true;
  }
  function calculate_inclusive($amount,$tax){
  $tot = ($amount/(($tax/100)+1)/10);
    return number_format($tot,2,".","");
  }
  function calculate_exclusive($amount,$tax){
    $tot = (($amount*$tax)/(100));
    return number_format($tot,2,".","");
  }
  function app_number_format($value=''){
    return (empty($value)) ? $value : number_format($value,2);
  }
  function show_upi_code(){
    $CI =& get_instance();
    return $CI->db->select('show_upi_code')->get('db_sitesettings')->row()->show_upi_code;
  }
  function get_customer_details($customer_id){
    $CI =& get_instance();
    return $CI->db->select('*')->from('db_customers')->where('id',$customer_id)->get()->row();
  }
  function get_supplier_details($supplier_id){
    $CI =& get_instance();
    return $CI->db->select('*')->from('db_suppliers')->where('id',$supplier_id)->get()->row();
  }
  function get_site_details(){
    $CI =& get_instance();
    return $CI->db->select('*')->from('db_sitesettings')->where('id',1)->get()->row();
  }
  function is_tax_disabled(){
    return (get_site_details()->disable_tax==1) ? true : false;
  }
  function tax_disable_class(){
    return (is_tax_disabled()) ? 'hide' : 'block';
  }
  function date_difference($start_date,$end_date){
    // Declare two dates 
    $start_date = strtotime(date("Y-m-d",strtotime($start_date))); 
    $end_date = strtotime(date("Y-m-d",strtotime($end_date)));   
    // Get the difference and divide into  
    // total no. seconds 60/60/24 to get  
    // number of days 
    return ($end_date - $start_date)/60/60/24; 
  }