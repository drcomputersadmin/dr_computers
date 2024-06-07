<!DOCTYPE html>
<html>
<head>
<!-- TABLES CSS CODE -->
<?php include"comman/code_css_datatable.php"; ?>
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="<?php echo $theme_link; ?>plugins/datepicker/datepicker3.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Left side column. contains the logo and sidebar -->
  
  <?php include"sidebar.php"; ?>

  <?php 
      /*Total Invoices*/
   
 
  

  // Count the number of rows that satisfy the condition
  
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?=$page_title;?>
        <small>View/Search Sold Items</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo $base_url; ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><?=$page_title;?></li>
      </ol>
    </section>

    <div class="pay_now_modal">
    </div>
    <div class="view_payments_modal">
    </div>
    <div class="add_note_modal">
    </div>

    <!-- Main content -->
    <?= form_open('#', array('class' => '', 'id' => 'table_form')); ?>
    <input type="hidden" id='base_url' value="<?=$base_url;?>">
    <section class="content">
      <!-- Small boxes (Stat box) -->
      
      <!-- /.row -->
      <div class="row">
        <!-- ********** ALERT MESSAGE START******* -->
        <?php include"comman/code_flashdata.php"; ?>
        <!-- ********** ALERT MESSAGE END******* -->
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">

              <div class="row">
                <div class="col-md-12">
                <div class="col-md-2 pull-right">
                  <?php if ($CI->permissions('sales_add')) {?>
                  <div class="box-tools">
                <a class="btn btn-block btn-info" href="<?php echo $base_url; ?>sales/addQuotation">
                <i class="fa fa-plus"></i> <?=$this->lang->line('new_sales');?></a>
              </div>
                 <?php }?>
                </div>
                </div>
              </div>

              <div class="row">

                <div class="col-md-12">

                <div class="col-md-3">
                    <div class="form-group">
                       <label for="search_customer_id"><?=$this->lang->line('customers');?> </label></label>
                       <select class="form-control select2" id="search_customer_id" name="search_customer_id"  style="width: 100%;">
                        <option value="">-All Customers-</option>
                        <?php
                                             
                           $query1="select * from db_customers where status=1";
                           $q1=$this->db->query($query1);
                           if($q1->num_rows($q1)>0)
                              { 
                               // echo "<option value=''>-Select-</option>";
                                foreach($q1->result() as $res1)
                              {
                                echo "<option value='".$res1->id."'>".$res1->customer_name ."</option>";
                              }
                            }
                           
                               ?>
                      
                     </select>
                       <span id="search_customer_id_msg" style="display:none" class="text-danger"></span>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="form-group">
                       <label for="user_created_by"><?=$this->lang->line('created_by');?> </label></label>
                       <select class="form-control select2" id="user_created_by" name="user_created_by"  style="width: 100%;">
                        <option value="">-All Users-</option>
                        <?php
                                             
                           $query1="select * from db_users where status=1";
                           $q1=$this->db->query($query1);
                           if($q1->num_rows($q1)>0)
                              { 
                               // echo "<option value=''>-Select-</option>";
                                foreach($q1->result() as $res1)
                              {
                                echo "<option value='".$res1->username."'>".$res1->username ."</option>";
                              }
                            }
                           
                               ?>
                     </select>
                       <span id="user_created_by_msg" style="display:none" class="text-danger"></span>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="form-group">
                       <label for="sales_from_date"><?=$this->lang->line('from_date');?> </label></label>
                       <div class="input-group date">
                         <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                         </div>
                         <input type="text" class="form-control pull-right datepicker"  id="sales_from_date" name="sales_from_date">
                      </div>
                       <span id="sales_from_date_msg" style="display:none" class="text-danger"></span>
                    </div>
                  </div>

                  <div class="col-md-3">
                    <div class="form-group">
                       <label for="sales_to_date"><?=$this->lang->line('to_date');?> </label></label>
                       <div class="input-group date">
                         <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                         </div>
                         <input type="text" class="form-control pull-right datepicker"  id="sales_to_date" name="sales_to_date">
                      </div>
                       <span id="sales_to_date_msg" style="display:none" class="text-danger"></span>
                    </div>
                  </div>

                  

                </div>
              </div>

              
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-striped" width="100%">
                <thead class="bg-primary ">
                <tr>
                  <th class="text-center">
                    <input type="checkbox" class="group_check checkbox" >
                  </th>
                  <th><?= $this->lang->line('delivery_date'); ?></th>
                  <th><?= $this->lang->line('delivery_code'); ?></th>
                  <th><?= $this->lang->line('delivery_status'); ?></th>
                  <th><?= $this->lang->line('reference_no'); ?></th>
                  <th><?= $this->lang->line('customer_name'); ?></th>
                  <!-- <th>Warehouse</th> -->
                  <th><?= $this->lang->line('customer_phone'); ?></th>
                  <th><?= $this->lang->line('delivery_address'); ?></th>
                 
                

                
             
                
                  <th><?= $this->lang->line('created_by'); ?></th>
                  <th><?= $this->lang->line('action'); ?></th>
                </tr>
                </thead>
                <tbody>
				
                </tbody>
             
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    <?= form_close();?>
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
<?php include"comman/code_js_datatable.php"; ?>
<!-- bootstrap datepicker -->
<script src="<?php echo $theme_link; ?>plugins/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
  //Date picker
    $('.datepicker').datepicker({
      autoclose: true,
    format: 'dd-mm-yyyy',
     todayHighlight: true
    });
</script>
<script type="text/javascript">

  function load_datatable(argument) {
    //datatables
   var table = $('#example2').DataTable({ 

      /* FOR EXPORT BUTTONS START*/
  dom:'<"row margin-bottom-12"<"col-sm-12"<"pull-left"l><"pull-right"fr><"pull-right margin-left-10 "B>>>tip',
 /* dom:'<"row"<"col-sm-12"<"pull-left"B><"pull-right">>> <"row margin-bottom-12"<"col-sm-12"<"pull-left"l><"pull-right"fr>>>tip',*/
      buttons: {
        buttons: [
            {
                className: 'btn bg-red color-palette btn-flat hidden delete_btn pull-left',
                text: 'Delete',
                action: function ( e, dt, node, config ) {
                    multi_delete();
                }
            },
            { extend: 'copy', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10]} },
            { extend: 'excel', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10]} },
            { extend: 'pdf', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10]} },
            { extend: 'print', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10]} },
            { extend: 'csv', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10]} },
            { extend: 'colvis', className: 'btn bg-teal color-palette btn-flat',text:'Columns' },  

            ]
        },
        /* FOR EXPORT BUTTONS END */

        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
        "responsive": true,
        language: {
            processing: '<div class="text-primary bg-primary" style="position: relative;z-index:100;overflow: visible;">Processing...</div>'
        },
        

        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": "<?php echo site_url('sales/ajax_list_delivery')?>",
            "type": "POST",
            "data": {
                      sales_from_date: $("#sales_from_date").val(),
                      sales_to_date: $("#sales_to_date").val(),
                      user_created_by: $("#user_created_by").val(),
                      customer_id: $("#search_customer_id").val(),
                    },
            complete: function (data) {
             $('.column_checkbox').iCheck({
                checkboxClass: 'icheckbox_square-orange',
                /*uncheckedClass: 'bg-white',*/
                radioClass: 'iradio_square-orange',
                increaseArea: '10%' // optional
              });
             call_code();
              //$(".delete_btn").hide();
             },

        },

        //Set column definition initialisation properties.
        "columnDefs": [
        { 
            "targets": [ 0,9], //first column / numbering column
            "orderable": false, //set not orderable
        },
        {
            "targets" :[0],
            "className": "text-center",
        },
        
        ],
        /*Start Footer Total*/
       
        /*End Footer Total*/
    });
    new $.fn.dataTable.FixedHeader( table );
  }
$(document).ready(function() {
    load_datatable();
});

$("#sales_from_date,#sales_to_date,#user_created_by,#search_customer_id").on("change",function(){
          $('#example2').DataTable().destroy();
          load_datatable();
      });
   $(document).on('change', '.delivery-status', function() {
      console.log("Dropdown changed");
      var deliveryId = $(this).data('id');
      var newStatus = $(this).val();
      var base_url = document.getElementById('base_url').value;
      var url = base_url + '/sales/update_delivery_status';
      $.ajax({
          url: url,
          type: 'POST',
          dataType: 'json', // Add this line
          data: {
              id: deliveryId,
              status: newStatus
          },
          success: function(response) {
              if(response.result == "success") {
                  toastr["success"]("Delivery status updated successfully!");
              } else {
                  toastr["error"]("Failed to update delivery status. Try again!");
              }
          },
          error: function() {
              toastr["error"]("An error occurred. Please try again!");
          }
      });
  });
  function add_note(sales_id){
  var base_url = document.getElementById('base_url').value;
  $.post(base_url + 'sales/show_add_note_modal', {sales_id: sales_id}, function(result) {
    $(".add_note_modal").html('').html(result);
    //Date picker
    $('.datepicker').datepicker({
      autoclose: true,
    format: 'dd-mm-yyyy',
     todayHighlight: true
    });
    $('#add_note_model').modal('toggle');

  });
}
</script>
<script src="<?php echo $theme_link; ?>js/sales_delivery.js"></script>
<script type="text/javascript">
  function print_invoice(id){
  window.open("<?= base_url();?>pos/print_invoice_pos/"+id, "_blank", "scrollbars=1,resizable=1,height=500,width=500");
}
</script>
<!-- Make sidebar menu hughlighter/selector -->
<script>$(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");</script>
		
</body>
</html>
