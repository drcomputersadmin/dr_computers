<!DOCTYPE html>
<html>
<head>
<!-- TABLES CSS CODE -->
<?php include"comman/code_css_form.php"; ?>
<!-- </copy> -->  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include"sidebar.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= $this->lang->line('delivery'); ?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?php echo $base_url; ?>sales"><?= $this->lang->line('delivery_list'); ?></a></li>
        <li><a href="<?php echo $base_url; ?>sales/addDelivery"><?= $this->lang->line('new_delivery'); ?></a></li>
        <li class="active"><?= $this->lang->line('delivery_note'); ?></li>
      </ol>
    </section>
    <div class="row">
      <div class="col-md-12">
      <!-- ********** ALERT MESSAGE START******* -->
      <?php include"comman/code_flashdata.php"; ?>
      <!-- ********** ALERT MESSAGE END******* -->
      </div>
    </div>
    <?php
    $CI =& get_instance();
    
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
    $company_pan_no=$res1->pan_no;

    
    $sales_id = $this->db->escape($sales_id); // Sanitize the sales_id
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
    $customer_city=$res3->city;
    $customer_address=$res3->address;
    $customer_postcode=$res3->postcode;
    $customer_gst_no=$res3->gstin;
    $customer_tax_number=$res3->tax_number;
    $customer_opening_balance=$res3->opening_balance;
    $delivery_date=$res3->delivery_date;
    $created_time=$res3->created_time;
    $reference_no=$res3->reference_no;
    $delivery_code=$res3->delivery_code;
    $delivery_status=$res3->delivery_status;
    $delivery_note=$res3->delivery_note;

    
    
    
   
    
    if(!empty($customer_country)){
      $customer_country = $this->db->query("select country from db_country where id='$customer_country'")->row()->country;  
    }
    if(!empty($customer_state)){
      $customer_state = $this->db->query("select state from db_states where id='$customer_state'")->row()->state;  
    }
    
    ?>


    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="printableArea">
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> <?= $this->lang->line('delivery_note'); ?>
            <small class="pull-right">Date: <?php echo  show_date($delivery_date)." ".$created_time; ?></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          <i><?= $this->lang->line('from'); ?></i>
          <address>
            <strong><?php echo  $company_name; ?></strong><br>
            <?php echo  $company_address; ?>,
            <?= $this->lang->line('city'); ?>:<?php echo  $company_city; ?><br>
            <?= $this->lang->line('phone'); ?>: <?php echo  $company_phone; ?>,
            <?= $this->lang->line('mobile'); ?>: <?php echo  $company_mobile; ?><br>
            <?php echo (!empty(trim($company_email))) ? $this->lang->line('email').": ".$company_email."<br>" : '';?>
            <?php echo (!empty(trim($company_gst_no))) ? $this->lang->line('gst_number').": ".$company_gst_no."<br>" : '';?>
            <?php echo (!empty(trim($company_vat_no))) ? $this->lang->line('vat_number').": ".$company_vat_no."<br>" : '';?>
            <?php echo (!empty(trim($company_pan_no))) ? $this->lang->line('vat_number').": ".$company_pan_no."<br>" : '';?>
           
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <i><?= $this->lang->line('customer_details'); ?><br></i>
          <address>
            <strong><?php echo  $customer_name; ?></strong><br>
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
              if(!empty($customer_city)){
                echo ",".$customer_city;
              }
              if(!empty($customer_postcode)){
                echo "-".$customer_postcode;
              }
            ?>
            <br>
            <?php echo (!empty(trim($customer_mobile))) ? $this->lang->line('mobile').": ".$customer_mobile."<br>" : '';?>
            <?php echo (!empty(trim($customer_phone))) ? $this->lang->line('phone').": ".$customer_phone."<br>" : '';?>
            <?php echo (!empty(trim($customer_email))) ? $this->lang->line('email').": ".$customer_email."<br>" : '';?>
            <?php echo (!empty(trim($customer_gst_no))) ? $this->lang->line('gst_number').": ".$customer_gst_no."<br>" : '';?>
            <?php echo (!empty(trim($customer_tax_number))) ? $this->lang->line('vat_number').": ".$customer_tax_number."<br>" : '';?>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <b><?= $this->lang->line('delivery_note'); ?> #<?php echo  $delivery_code; ?></b><br>
          <b><?= $this->lang->line('delivery_status'); ?> :<?php echo  $delivery_status; ?></b><br>
          <b><?= $this->lang->line('reference_no'); ?> :<?php echo  $reference_no; ?></b><br>
         
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped records_table table-bordered">
            <thead class="bg-gray-active">
            <tr>
              <th>#</th>
              <th><?= $this->lang->line('item_code'); ?></th>
              <th><?= $this->lang->line('item_name'); ?></th>
              
              <th><?= $this->lang->line('quantity'); ?></th>
             
            </tr>
            </thead>
            <tbody>
            <?php
// Debug: Print the original $sales_id


// Trim and sanitize $sales_id
$sales_id = trim($sales_id);
$sales_id = preg_replace('/[^0-9]/', '', $sales_id); // Remove non-numeric characters

// Debug: Print the sanitized $sales_id


// Ensure $sales_id is set and is numeric

$i = 0;
$tot_qty = 0;
$tot_sales_price = 0;
$tot_tax_amt = 0;
$tot_discount_amt = 0;
$tot_total_cost = 0;

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

// Print the SQL query for debugging


// Check for query errors

// Print the result set for debugging
$result = $q2->result();


if ($q2->num_rows() == 0) {
    echo "No items found for delivery note ID: '$sales_id'";
} else {
    foreach ($result as $res2) {
        echo "<tr>";
        echo "<td>" . ++$i . "</td>";
        echo "<td>";
        echo $res2->item_code;
     
        echo "</td>";
        echo "<td>";
        echo $res2->item_name;
        echo (!empty($res2->description)) ? "<br><i>[" . nl2br($res2->description) . "]</i>" : '';
        echo "</td>";
        echo "<td>" . $res2->delivery_qty . "</td>";
        echo "</tr>";
    }
}
?>

            </tbody>
           
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    
      <div class="row">
       <div class="col-md-6">
          
          <div class="row">
              <div class="col-md-12">
                 <div class="form-group">
                    <label for="sales_note" class="col-sm-4 control-label" style="font-size: 17px;"><?= $this->lang->line('note'); ?></label>    
                    <div class="col-sm-8">
                       <label class="control-label  " style="font-size: 17px;">: <?=$delivery_note;?></label>
                    </div>
                 </div>
              </div>
           </div> 
                     
        </div>

        
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </div><!-- printableArea -->
      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
         


          <a href="<?php echo $base_url; ?>sales/print_quotation/<?php echo  $sales_id ?>" target="_blank" class="btn btn-warning">
            <i class="fa fa-print"></i> 
          Print
        </a>

      <!--  <a target="_blank" class="btn btn-info pointer" onclick="print_invoice(<?=$sales_id?>)">
            <i class="fa fa-file-text"></i> 
          POS Invoice
        </a> -->


        <a href="<?php echo $base_url; ?>sales/pdf_quote/<?php echo  $sales_id ?>" target="_blank" class="btn btn-primary">
            <i class="fa fa-file-pdf-o"></i> 
          PDF
        </a>
        
      
       
          
          
        </div>
      </div>

    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
  <!-- /.content-wrapper -->
  <?php include"footer.php"; ?>

 
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- SOUND CODE -->
<?php include"comman/code_js_sound.php"; ?>
<!-- TABLES CODE -->
<?php include"comman/code_js_form.php"; ?>
<script type="text/javascript">
  function print_invoice(id){
  window.open("<?= base_url();?>pos/print_invoice_pos/"+id, "_blank", "scrollbars=1,resizable=1,height=500,width=500");
}
</script>
<!-- Make sidebar menu hughlighter/selector -->
<script>$(".sales-quote-list-active-li").addClass("active");</script>
</body>
</html>
