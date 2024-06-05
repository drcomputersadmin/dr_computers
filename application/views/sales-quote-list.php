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
      $total_quotations=$this->db->query("SELECT COUNT(*) as total FROM db_sales_quote")->row()->total;
      /*Total Invoices Total*/
  $quote_to_sale=  $this->db->where('transferred_to_invoice', 1);
 
  

  // Count the number of rows that satisfy the condition
  $quote_to_sale_count = $this->db->count_all_results('db_sales_quote');
      /*PAID AMOUNT*/
      $this->db->select_sum('grand_total'); // Replace 'amount_column' with the actual column name containing the amount
      $this->db->where('transferred_to_invoice', 1);
      $query = $this->db->get('db_sales_quote');
      $result = $query->row();
      $total_amount_transferred = $result->grand_total;
      //$sales_due_total = $sal_total - $sal_return_total;
     
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

    <!-- Main content -->
    <?= form_open('#', array('class' => '', 'id' => 'table_form')); ?>
    <input type="hidden" id='base_url' value="<?=$base_url;?>">
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?= $total_quotations;?></h3>

              <p><?= $this->lang->line('total_quotations'); ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="<?= base_url('reports/sales') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?= $quote_to_sale_count;?></h3>
              <p><?= 'Quotation To Invoice' ?></p>
            </div>
            <div class="icon">
              <i class="fa fa-plus-square-o"></i>
            </div>
            <a href="<?= base_url('reports/sales') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?= $CI->currency($total_amount_transferred,$with_comma=true);?></h3>
             <p><?= 'Total Amount Transferred to Invoice' ?></p>
            </div>
            <div class="icon">
              <i class="fa fa-undo"></i>
            </div>
            <a href="<?= base_url('reports/sales_return') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
       
        <!-- ./col -->
      </div>
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
                  <th><?= $this->lang->line('sales_date'); ?></th>
                  <th><?= $this->lang->line('sales_code'); ?></th>
                  <th><?= $this->lang->line('sales_status'); ?></th>
                  <th><?= $this->lang->line('reference_no'); ?></th>
                  <th><?= $this->lang->line('customer_name'); ?></th>
                  <!-- <th>Warehouse</th> -->
                  <th><?= $this->lang->line('total'); ?></th>
                 
                
                  

              
                  <th><?= $this->lang->line('status'); ?></th>
                  <th><?= $this->lang->line('created_by'); ?></th>
                  <th><?= $this->lang->line('action'); ?></th>
                </tr>
                </thead>
                <tbody>
				
                </tbody>
               <tfoot>
                  <tr class="bg-gray">
                      <th colspan="6" style="text-align:right">Total</th><!-- 6 -->
                      <th colspan="4" style="text-align:left"></th><!-- 7 -->
                      
                   
                   
                  </tr>
              </tfoot>
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
                  multi_delete_quote();
                }
            },
            { extend: 'copy', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9]} },
            { extend: 'excel', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9]} },
            { extend: 'pdf', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9]} },
            { extend: 'print', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9]} },
            { extend: 'csv', className: 'btn bg-teal color-palette btn-flat',exportOptions: { columns: [1,2,3,4,5,6,7,8,9]} },
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
            "url": "<?php echo site_url('sales/ajax_list_quote')?>",
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
        "footerCallback": function ( row, data, start, end, display ) {
    var api = this.api(), data;
    // Remove the formatting to get integer data for summation
    var intVal = function ( i ) {
        return typeof i === 'string' ?
            i.replace(/[\$,]/g, '')*1 :
            typeof i === 'number' ?
                i : 0;
    };
    var total = api
        .column( 6, { page: 'none'} )
        .data()
        .reduce( function (a, b) {
            return intVal(a) + intVal(b);
        }, 0 );
  
   
    // Update the footer cells with the calculated sums
    $( api.column( 6 ).footer() ).html(app_number_format(total));
   
},

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
</script>
<script src="<?php echo $theme_link; ?>js/sales_quote.js"></script>
<script type="text/javascript">
  function print_invoice(id){
  window.open("<?= base_url();?>pos/print_invoice_pos/"+id, "_blank", "scrollbars=1,resizable=1,height=500,width=500");
}
</script>
<!-- Make sidebar menu hughlighter/selector -->
<script>$(".<?php echo basename(__FILE__,'.php');?>-active-li").addClass("active");</script>
		
</body>
</html>
