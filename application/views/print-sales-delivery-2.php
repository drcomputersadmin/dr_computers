<!DOCTYPE html>
<html>
<title><?= $page_title;?>- Format 2</title>
<head>
  <?php include"comman/code_css_form.php"; ?>
<link rel='shortcut icon' href='<?php echo $theme_link; ?>images/fav.ico' />

<style>
table, th, td {
    /*border: 1px solid black;*/
    border-collapse: collapse;
   /* font-family: 'Open Sans', 'Martel Sans', sans-serif;*/
}
th, td {
    padding: 5px;
    text-align: left;   
    vertical-align:top 
}
.dashed_top{
  border-top-style: dashed;
  border-width: 0.1px;
}
.dashed_bottom{
  border-bottom-style: dashed;
  border-width: 0.1px;
}
.dashed_left{
  border-left-style: dashed;
  border-width: 0.1px;
}
.dashed_right{
  border-right-style: dashed;
  border-width: 0.1px;
}
body{
  word-wrap: break-word;
}
</style>
</head>
<body onload="window.print()"><!--  -->
<?php

    $q1=$this->db->query("select * from db_company where id=1 and status=1");
    $res1=$q1->row();
    $company_name=$res1->company_name;
    $company_mobile=$res1->mobile;
    $company_phone=$res1->phone;
    $company_email=$res1->email;
    $company_country=$res1->country;
    $company_state=$res1->state;
    $company_city=$res1->city;
    $company_address=$res1->address;
    $company_gst_no=$res1->gst_no;
    $company_vat_no=$res1->vat_no;
    $company_logo=$res1->company_logo;

    $q4=$this->db->query("select sales_invoice_footer_text from db_sitesettings where id=1");
    $q5=$this->db->query("select sales_terms_and_conditions from db_company where id=1");
    $res5=$q5->row();
    $res4=$q4->row();
    $sales_invoice_footer_text=$res4->sales_invoice_footer_text;
    $sales_terms_and_conditions=$res5->sales_terms_and_conditions;
    

    $q3 = $this->db->query("SELECT a.customer_name, a.mobile, a.phone, a.gstin, a.tax_number, a.email,
    a.opening_balance, a.country_id, a.state_id, a.city,
    a.postcode, a.address, b.delivery_date, b.created_time, b.reference_no,
    b.delivery_code, b.delivery_status, b.delivery_note
FROM db_customers a,
  db_delivery_notes b 
WHERE a.id = b.customer_id AND 
   b.id = $sales_id");
                          
    
    $res3=$q3->row();
    
    $customer_name=$res3->customer_name;
  
    $customer_mobile=$res3->mobile;
    $customer_phone=$res3->phone;
    $customer_email=$res3->email;
    $customer_country=$res3->country_id;
    $customer_state=$res3->state_id;
    $customer_address=$res3->address;
    $customer_postcode=$res3->postcode;
    $customer_gst_no=$res3->gstin;
    $customer_tax_number=$res3->tax_number;
    $customer_opening_balance=$res3->opening_balance;
    $sales_date=$res3->sales_date;
    $created_time=$res3->created_time;
    $reference_no=$res3->reference_no;
    $sales_code=$res3->sales_code;
    $sales_note=$res3->sales_note;
    $sales_status=$res3->sales_status;
    $created_by=$res3->created_by;

    
    $subtotal=$res3->subtotal;
    $grand_total=$res3->grand_total;
    $other_charges_input=$res3->other_charges_input;
    $other_charges_tax_id=$res3->other_charges_tax_id;
    $other_charges_amt=$res3->other_charges_amt;
    $paid_amount=$res3->paid_amount;
    $discount_to_all_input=$res3->discount_to_all_input;
    $discount_to_all_type=$res3->discount_to_all_type;
    $discount_to_all_type = ($discount_to_all_type=='in_percentage') ? '%' : 'Fixed';
    $tot_discount_to_all_amt=$res3->tot_discount_to_all_amt;
    $round_off=$res3->round_off;
    $payment_status=$res3->payment_status;
    
    if(!empty($customer_country)){
      $customer_country = $this->db->query("select country from db_country where id='$customer_country'")->row()->country;  
    }
    if(!empty($customer_state)){
      $customer_state = $this->db->query("select state from db_states where id='$customer_state'")->row()->state;  
    }
    

    ?>

<table align="center" width="100%" height='100%' style="border:1px solid;">
    <thead>
      <tr>
        <th colspan="10">
          <table width="100%">
            <tr>
              <th colspan="12" style="text-transform: uppercase;text-align: center;">
              <?=  $this->lang->line('sales_delivery');?>
              </th>
            </tr>
            <tr>
              <th colspan="6" style="">
                  <b><?php echo $company_name; ?></b><br/>
                  <?php echo $this->lang->line('address')." : ".$company_address; ?><br/>
                  <?php echo $company_country; ?><br/>
                  <?php echo $this->lang->line('mobile').":".$company_mobile; ?><br/>
                  <?php echo (!empty(trim($company_email))) ? $this->lang->line('email').": ".$company_email."<br>" : '';?>
                  <?php echo (!empty(trim($company_gst_no))) ? $this->lang->line('gst_number').": ".$company_gst_no."<br>" : '';?>
                  <?php echo (!empty(trim($company_vat_no))) ? $this->lang->line('vat_number').": ".$company_vat_no."<br>" : '';?>
                </th>
              <th colspan="6" style="text-align: right;">
                <img src="<?= base_url('uploads/company/'.$company_logo);?>" width='auto' height='150px'>
              </th>
              
            </tr>
            <tr class=" ">
              <td colspan="6" style="border: 1px solid;" >
              <center><?= $this->lang->line('customer_details'); ?></center><br/>
              <?php echo $this->lang->line('name').": ".$customer_name; ?><br/>
                <?php echo $this->lang->line('mobile').": ".$customer_mobile; ?>
                <?php 
                        if(!empty($customer_address)){
                          echo $customer_address;
                        }
                        if(!empty($customer_country)){
                          echo $customer_country;
                        }
                        if(!empty($customer_state)){
                          echo ",".$customer_state;
                        }
                        if(!empty($customer_postcode)){
                          echo "-".$customer_postcode;
                        }
                      ?>
                      <br>
                <?php echo (!empty(trim($customer_email))) ? $this->lang->line('email').": ".$customer_email."<br>" : '';?>
                <?php echo (!empty(trim($customer_gst_no))) ? $this->lang->line('gst_number').": ".$customer_gst_no."<br>" : '';?>
                <?php echo (!empty(trim($customer_tax_number))) ? $this->lang->line('tax_number').": ".$customer_tax_number."<br>" : '';?>
            </td>
              
              <td colspan="6" style="border: 1px solid;" >
                      <?= $this->lang->line('Delivery'); ?> : <?php echo "$sales_code"; ?><br>
                      <?= $this->lang->line('reference_no'); ?> : <?php echo "$reference_no"; ?><br>
                      <?= $this->lang->line('date'); ?> : <?php echo show_date($sales_date)." ".$created_time; ?><br>
                      <?= $this->lang->line('sales_man'); ?> : <?php echo ucfirst($created_by); ?><br>
              </td>
            </tr>
          </table>
        </th>
    </tr>
     
  


      
  
    
  <tr style=''>
    
    <th  style='border-right: 1px solid;border-top: 1px solid;' >#</th>

  
    <th  style='border-right: 1px solid;border-top: 1px solid;'  colspan='<?=$colspan_2?>'><?= $this->lang->line('item_code'); ?></th>
    <th style='border-right: 1px solid;border-top: 1px solid;'  colspan='<?=$colspan_2?>'><?= $this->lang->line('item_name'); ?></th>
    <th style='border-right: 1px solid;border-top: 1px solid;' ><?= $this->lang->line('quantity'); ?></th>
  
 
  </tr>
  </thead>
<tbody style="border: 1px solid;">
  
 <?php
              $i=0;
             
              $this->db->select("a.delivery_qty,
                   a.tax_type,
                   a.price_per_unit,
                   a.tax_amt,
                   c.item_name,
                   c.item_code,
                   a.description");
$this->db->from("db_delivery_note_items a");
$this->db->where("a.delivery_note_id", $sales_id);
$this->db->join("db_items c", "c.id = a.item_id", "left");
$q2 = $this->db->get();

              foreach ($q2->result() as $res2) {
              
                  echo "<tr>";
                  echo "<td  style='border-right: 1px solid;border-top: 1px solid;'>".++$i."</td>";
                  echo "<td style='border-right: 1px solid;border-top: 1px solid;' colspan='".$colspan_1."'>".$res2->item_code."</td>";
                  echo "<td style='border-right: 1px solid;border-top: 1px solid;' colspan='".$colspan_1."'>".$res2->item_name."</td>";
                  echo "<td style='border-right: 1px solid;border-top: 1px solid;'>".$res2->delivery_qty."</td>";
               
                  echo "</tr>";  
               
              }
              ?>

  </tbody>
<tfoot>
 

  <?php if(!empty($sales_terms_and_conditions)) {?>
  <tr style="border-top: 1px;">
    <td colspan="10" style="text-align: left;">
      <b><?= $sales_terms_and_conditions; ?></b>
    </td>
  </tr>
  <?php } ?>

  <tr>
    <td colspan="5" style="padding-top: 100px">
      <b><?= $this->lang->line('customer_signature'); ?></b>
    </td>
    <td colspan="5" style="text-align: right;padding-top: 100px">
      <b><?= $this->lang->line('authorised_signature'); ?>
    </td>
  </tr>

  <?php if(!empty($sales_invoice_footer_text)) {?>
  <tr style="border-top: 1px solid;">
    <td colspan="10" style="text-align: center;">
      <b><?= $sales_invoice_footer_text; ?></b>
    </td>
  </tr>
  <?php } ?>
</tfoot>
</table>



</body>
</html>
