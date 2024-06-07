
//On Enter Move the cursor to desigtation Id
function shift_cursor(kevent,target){

    if(kevent.keyCode==13){
		$("#"+target).focus();
    }
	
}





$('#item_search').keypress(function (e) {
 var key = e.which;
 // the enter key code
 if(key == 13){
    $("#item_search").autocomplete('search');
  }
});  

$("#item_search").bind("paste", function(e){
    $("#item_search").autocomplete('search');
} );
$("#item_search").autocomplete({
    source: function(data, cb){
        $.ajax({
          autoFocus:true,
            url: $("#base_url").val()+'items/get_json_items_details',
            method: 'GET',
            dataType: 'json',
            /*showHintOnFocus: true,
      autoSelect: true, 
      
      selectInitial :true,*/
      
            data: {
                name: data.term,
                /*warehouse_id:$("#warehouse_id").val().trim(),*/
            },
            success: function(res){
              //console.log(res);
                var result;
                result = [
                    {
                        //label: 'No Records Found '+data.term,
                        label: 'No Records Found ',
                        value: ''
                    }
                ];

                if (res.length) {
                    result = $.map(res, function(el){
                        return {
                            label: el.item_code +'--[Qty:'+el.stock+'] --'+ el.label,
                            value: '',
                            id: el.id,
                            item_name: el.value,
                            stock: el.stock,
                           // mobile: el.mobile,
                            //customer_dob: el.customer_dob,
                            //address: el.address,
                        };
                    });
                }

                cb(result);
            }
        });
    },
        response:function(e,ui){
          if(ui.content.length==1){
            $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', ui);
            $(this).autocomplete("close");
          }
          //console.log(ui.content[0].id);
        },
        //loader start
        search: function (e, ui) {
        },
        select: function (e, ui) { 
          
            //$("#mobile").val(ui.item.mobile)
            //$("#item_search").val(ui.item.value);
            //$("#customer_dob").val(ui.item.customer_dob)
            //$("#address").val(ui.item.address)
            //alert("id="+ui.item.id);

            if(typeof ui.content!='undefined'){
              console.log("Autoselected first");
              if(isNaN(ui.content[0].id)){
                return;
              }
              var stock=ui.content[0].stock;
              var item_id=ui.content[0].id;
            }
            else{
              console.log("manual Selected");
              var stock=ui.item.stock;
              var item_id=ui.item.id;
            }
            /*if(parseFloat(stock)<=-1){
              toastr["warning"](stock+" Items in Stock!!");
              failed.currentTime = 0; 
              failed.play();
              return false;
            }*/
            if(restrict_quantity(item_id)){
              return_row_with_data(item_id);  
            }
            $("#item_search").val('');
            
        },   
        //loader end
});
$(document).ready(function() {
  console.log("Dropdown changed");
  $(document).on('change', '.delivery-status', function() {
      console.log("Dropdown changed");
      var deliveryId = $(this).data('id');
      var newStatus = $(this).val();
      var base_url = document.getElementById('base_url').value;
      var url = base_url + '/sales/update_delivery_status';
      $.ajax({
          url: url,
          type: 'POST',
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
});
function add_note(sales_id) {
  var base_url = document.getElementById('base_url').value;
  $.post(base_url + 'sales/show_add_note_modal', {sales_id: sales_id}, function(result) {
    $(".add_note_modal").html('').html(result);
    // Initialize modal
    $('#add_note_model').modal('toggle');
  });
}

function return_row_with_data(item_id){
  $("#item_search").addClass('ui-autocomplete-loader-center');
	var base_url=$("#base_url").val().trim();
	var rowcount=$("#hidden_rowcount").val();
	$.post(base_url+"sales/return_row_with_data/"+rowcount+"/"+item_id,{},function(result){
        //alert(result);
        $('#sales_table tbody').append(result);
       	$("#hidden_rowcount").val(parseFloat(rowcount)+1);
        success.currentTime = 0;
        success.play();
        enable_or_disable_item_discount();
        $("#item_search").removeClass('ui-autocomplete-loader-center');
    }); 
}
//INCREMENT ITEM
function increment_qty(rowcount){
  
  var flag = restrict_quantity($("#tr_item_id_"+rowcount).val().trim());
  if(!flag){ return false;}

  var item_qty=$("#td_data_"+rowcount+"_3").val();
  var available_qty=$("#tr_available_qty_"+rowcount+"_13").val();
    new_item_qty=parseFloat(item_qty)+1;
    $("#td_data_"+rowcount+"_3").val(new_item_qty);
  calculate_tax(rowcount);
}
//DECREMENT ITEM
function decrement_qty(rowcount){
  var item_qty=$("#td_data_"+rowcount+"_3").val();

  /*if(item_qty<1){
     $("#td_data_"+rowcount+"_3").val((item_qty).toFixed(2));
     toastr["warning"]("Minimum Stock!");
     return;
  }

  if(item_qty<=1){
    $("#td_data_"+rowcount+"_3").val(1);
      toastr["warning"]("Minimum Stock!");
    return;
  }*/
  $("#td_data_"+rowcount+"_3").val((parseFloat(item_qty)-1).toFixed(2));
  calculate_tax(rowcount);
}



  //Delete Record start
function delete_delivery_notes(q_id)
{
  
   if(confirm("Do You Wants to Delete Record ?")){
    $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
    $.post("delete_delivery_notes",{q_id:q_id},function(result){
   //alert(result);return;
     if(result=="success")
        {
          toastr["success"]("Record Deleted Successfully!");
          $('#example2').DataTable().ajax.reload();
        }
        else if(result=="failed"){
          toastr["error"]("Failed to Delete .Try again!");
        }
        else{
           toastr["error"](result);
        }
        $(".overlay").remove();
        return false;
   });
   }//end confirmation
}
//Delete Record end
function multi_delete_delivery(){
  //var base_url=$("#base_url").val().trim();
    var this_id=this.id;
    var base_url = document.getElementById('base_url').value; // Assuming 'base_url' is the ID of an input element
var url = base_url + '/sales/multi_delete_delivery';
    if(confirm("Are you sure ?")){
      data = new FormData($('#table_form')[0]);//form name
      /*Check XSS Code*/
      if(!xss_validation(data)){ return false; }
      
      $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
      $("#"+this_id).attr('disabled',true);  //Enable Save or Update button
      $.ajax({
      type: 'POST',
      url: url,
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      success: function(result){
        result=result.trim();
  //alert(result);return;
        if(result=="success")
        {
          toastr["success"]("Record Deleted Successfully!");
          success.currentTime = 0; 
            success.play();
          $('#example2').DataTable().ajax.reload();
          $(".delete_btn").hide();
          $(".group_check").prop("checked",false).iCheck('update');
        }
        else if(result=="failed")
        {
           toastr["error"]("Sorry! Failed to save Record.Try again!");
           failed.currentTime = 0; 
           failed.play();
        }
        else
        {
          toastr["error"](result);
          failed.currentTime = 0; 
            failed.play();
        }
        $("#"+this_id).attr('disabled',false);  //Enable Save or Update button
        $(".overlay").remove();
       }
       });
  }
  //e.preventDefault
}

function pay_now(sales_id){
  $.post('sales/show_pay_now_modal', {sales_id: sales_id}, function(result) {
    $(".pay_now_modal").html('').html(result);
    //Date picker
    $('.datepicker').datepicker({
      autoclose: true,
    format: 'dd-mm-yyyy',
     todayHighlight: true
    });
    $('#pay_now').modal('toggle');

  });
}
function view_payments(sales_id){
  $.post('sales/view_payments_modal', {sales_id: sales_id}, function(result) {
    $(".view_payments_modal").html('').html(result);
    $('#view_payments_modal').modal('toggle');
  });
}

function save_payment(sales_id){
  var base_url=$("#base_url").val().trim();

    //Initially flag set true
    var flag=true;

    function check_field(id)
    {

      if(!$("#"+id).val().trim() ) //Also check Others????
        {

            $('#'+id+'_msg').fadeIn(200).show().html('Required Field').addClass('required');
           // $('#'+id).css({'background-color' : '#E8E2E9'});
            flag=false;
        }
        else
        {
             $('#'+id+'_msg').fadeOut(200).hide();
             //$('#'+id).css({'background-color' : '#FFFFFF'});    //White color
        }
    }


   //Validate Input box or selection box should not be blank or empty
    check_field("amount");
    check_field("payment_date");


    var payment_date=$("#payment_date").val().trim();
    var amount=$("#amount").val().trim();
    var payment_type=$("#payment_type").val().trim();
    var payment_note=$("#payment_note").val().trim();

    if(amount == 0){
      toastr["error"]("Please Enter Valid Amount!");
      return false; 
    }

    if(amount > parseFloat($("#due_amount_temp").html().trim())){
      toastr["error"]("Entered Amount Should not be Greater than Due Amount!");
      return false;
    }

    $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
    $(".payment_save").attr('disabled',true);  //Enable Save or Update button
    $.post('sales/save_payment', {sales_id: sales_id,payment_type:payment_type,amount:amount,payment_date:payment_date,payment_note:payment_note}, function(result) {
      result=result.trim();
  //alert(result);return;
        if(result=="success")
        {
          $('#pay_now').modal('toggle');
          toastr["success"]("Payment Recorded Successfully!");
          success.currentTime = 0; 
          success.play();
          $('#example2').DataTable().ajax.reload();
        }
        else if(result=="failed")
        {
           toastr["error"]("Sorry! Failed to save Record.Try again!");
           failed.currentTime = 0; 
           failed.play();
        }
        else
        {
          toastr["error"](result);
          failed.currentTime = 0; 
          failed.play();
        }
        $(".payment_save").attr('disabled',false);  //Enable Save or Update button
        $(".overlay").remove();
    });
}

function delete_sales_payment(payment_id){
 if(confirm("Do You Wants to Delete Record ?")){
    var base_url=$("#base_url").val().trim();
    $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
   $.post(base_url+"sales/delete_payment",{payment_id:payment_id},function(result){
   //alert(result);return;
   result=result.trim();
     if(result=="success")
        {
          $('#view_payments_modal').modal('toggle');
          toastr["success"]("Record Deleted Successfully!");
          success.currentTime = 0; 
          success.play();
          $('#example2').DataTable().ajax.reload();
        }
        else if(result=="failed"){
          toastr["error"]("Failed to Delete .Try again!");
          failed.currentTime = 0; 
          failed.play();
        }
        else{
          toastr["error"](result);
          failed.currentTime = 0; 
          failed.play();
        }
        $(".overlay").remove();
   });
   }//end confirmation   
  }

  function restrict_quantity(item_id) {
  	var rowcount=$("#hidden_rowcount").val();
  	var available_qty = 0;
  	var count_item_qty = 0;
  	var selected_item_id = 0;
      for(i=1;i<=rowcount;i++){
        if(document.getElementById("tr_item_id_"+i)){
        	selected_item_id = $("#tr_item_id_"+i).val().trim();
            if(parseFloat(item_id)==parseFloat(selected_item_id)){
	             available_qty = parseFloat($("#tr_available_qty_"+i+"_13").val().trim());
	             count_item_qty += parseFloat($("#td_data_"+i+"_3").val().trim());
          }
        }
      }//end for
     /* if(available_qty!=0 && count_item_qty>=available_qty){
        toastr["warning"]("Only "+available_qty+" Items in Stock!!");
        failed.currentTime = 0; 
        failed.play();
      	return false;
      }*/
      return true;
  }

  /*$("#warehouse_id").on("change",function(event) {
    $('#sales_table tbody').html('');
    final_total();
    if($("#warehouse_id").val().trim()!=''){
      $("#item_search").attr({ disabled: false,});
    }
    else{
     $("#item_search").attr({ disabled: true,}); 
    }
  });*/
  function save_note(sales_id) {
    var base_url = $("#base_url").val().trim();

    // Initially flag set true
    var flag = true;

    function check_field(id) {
        if (!$("#" + id).val().trim()) {
            $('#' + id + '_msg').fadeIn(200).show().html('Required Field').addClass('required');
            flag = false;
        } else {
            $('#' + id + '_msg').fadeOut(200).hide();
        }
    }

    // Validate Input box or selection box should not be blank or empty
    var note = $("#note").val().trim(); // Fetching the note value
    check_field("note");

    if (!flag) {
        return; // Don't proceed if validation fails
    }

    $(".box").append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
    $(".note_save").attr('disabled', true); // Disable Save or Update button
    
  var base_url = document.getElementById('base_url').value;
    
    $.post(base_url + 'sales/save_note', {
      sales_id: sales_id,
      note: note},function(response) {
        var result = JSON.parse(response);
    
        if (result.success) {
            console.log("Success"); // For debugging
            $('#add_note_model').modal('toggle');
            toastr["success"]("Note Saved Successfully!");
            success.currentTime = 0;
            success.play();
            $('#example2').DataTable().ajax.reload();
        } else {
            console.log("Failed"); // For debugging
            toastr["error"](result.message || "An error occurred while saving the note. Please try again.");
            failed.currentTime = 0;
            failed.play();
        }
    
        $(".note_save").attr('disabled', false); // Enable Save or Update button
        $(".overlay").remove();
    }).fail(function() {
        toastr["error"]("An error occurred while processing your request. Please try again later.");
        $(".note_save").attr('disabled', false); // Enable Save or Update button
        $(".overlay").remove();
    });
  
}

  