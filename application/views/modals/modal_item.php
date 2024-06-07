<div class="modal fade " id="item-modal" tabindex='-1'>
                <?= form_open('#', array('class' => '', 'id' => 'item-form')); ?>
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header header-custom">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title text-center"><?= $this->lang->line('add_item'); ?></h4>
                    </div>
                    <div class="modal-body">
                        
                    <div class="row">
                              <div class="form-group col-md-4">
                                 <label for="item_name"><?= $this->lang->line('item_name'); ?><span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" id="item_name" name="item_name" placeholder="" value="<?php print $item_name; ?>" >
                                 <span id="item_name_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="brand_id">Brand</label>
                                 <div class="input-group">
                                 <select class="form-control select2" id="brand_id" name="brand_id"  style="width: 100%;"  >
                                    <?php
                                       $query1="select * from db_brands where status=1";
                                       $q1=$this->db->query($query1);
                                       if($q1->num_rows($q1)>0)
                                        {  echo '<option value="">-Select-</option>'; 
                                            foreach($q1->result() as $res1)
                                          { 
                                            $selected = ($brand_id==$res1->id)? 'selected' : '';
                                            echo "<option $selected value='".$res1->id."'>".$res1->brand_name."</option>";
                                          }
                                        }
                                        else
                                        {
                                           ?>
                                    <option value="">No Records Found</option>
                                    <?php
                                       }
                                       ?>
                                 </select>
                                
                                    </div>
                                 <span id="brand_id_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="category_id">Category <!--<span class="text-danger">*</span>--></label>
                                 <div class="input-group">
                                 <select class="form-control select2" id="category_id" name="category_id"  style="width: 100%;"  value="<?php print $category_id; ?>">
                                    <?php
                                       $query1="select * from db_category where status=1";
                                       $q1=$this->db->query($query1);
                                       if($q1->num_rows($q1)>0)
                                        {  echo '<option value="0">-Select-</option>'; 
                                            foreach($q1->result() as $res1)
                                          { 
                                            $selected = ($category_id==$res1->id)? 'selected' : '';
                                            echo "<option $selected value='".$res1->id."'>".$res1->category_name."</option>";
                                          }
                                        }
                                        else
                                        {
                                           ?>
                                    <option value="">No Records Found</option>
                                    <?php
                                       }
                                       ?>
                                 </select>
                                 
                                    </div>
                                 <span id="category_id_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="unit_id" class="control-label"><?= $this->lang->line('unit'); ?><!--<span class="text-danger">*</span>--></label>
                                 <div class="input-group">
                                 <select class="form-control select2" id="unit_id" name="unit_id"  style="width: 100%;" >
                                    <?php
                                       $query1="select * from db_units where status=1";
                                       $q1=$this->db->query($query1);
                                       if($q1->num_rows($q1)>0)
                                        {
                                         echo '<option value="0">-Select-</option>'; 
                                            foreach($q1->result() as $res1)
                                          {
                                            $selected = ($res1->id==$unit_id)? 'selected' : '';
                                            echo "<option $selected value='".$res1->id."'>".$res1->unit_name."</option>";
                                          }
                                        }
                                        else
                                        {
                                           ?>
                                    <option value="">No Records Found</option>
                                    <?php
                                       }
                                       ?>
                                 </select>
                               
                                    </div>
                                 <span id="unit_id_msg" style="display:none" class="text-danger"></span>
                              </div>
                             
                              <div class="form-group col-md-4">
                                 <label for="alert_qty" ><?= $this->lang->line('minimum_qty'); ?></label>
                                 <input type="number" class="form-control no_special_char" id="alert_qty" name="alert_qty" placeholder="" min="0"  value="<?php print $alert_qty; ?>" >
                                 <span id="alert_qty_msg" style="display:none" class="text-danger"></span>
                              </div>
                            
                             
                             
                              
                              <div class="form-group col-md-4">
                                 <label for="item_image"><?= $this->lang->line('select_image'); ?></label>
                                 <input type="file" name="item_image" id="item_image">
                                 <span id="item_image_msg" style="display:block;" class="text-danger">Max Width/Height: 1000px * 1000px & Size: 1MB </span>
                              </div>
                           </div>

                           <hr>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label for="price"><?= $this->lang->line('price'); ?><!--<span class="text-danger">*</span>--></label>
                                 <input type="text" class="form-control only_currency" id="price" name="price" placeholder="Price of Item without Tax"  value="<?php print $price; ?>" >
                                 <span id="price_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4 <?=tax_disable_class()?>">
                                 <label for="tax_id" ><?= $this->lang->line('tax'); ?><span class="text-danger">*</span></label>
                                 <div class="input-group">
                                 <select class="form-control select2" id="tax_id" name="tax_id"  style="width: 100%;" >
                                    <?php
                                       $query1="SELECT * FROM db_tax WHERE STATUS=1 ORDER BY undelete_bit DESC";
                                       $q1=$this->db->query($query1);
                                       if($q1->num_rows($q1)>0)
                                        {
                                            //echo '<option data-tax="0" value="">-Select-</option>'; 
                                            foreach($q1->result() as $res1)
                                          { 
                                            $selected = ($tax_id==$res1->id)? 'selected' : '';
                                            echo "<option $selected data-tax='".$res1->tax."' value='".$res1->id."'>".$res1->tax_name."(".$res1->tax."%)</option>";
                                          }
                                        }
                                        else
                                        {
                                           ?>
                                    <option value="">No Records Found</option>
                                    <?php
                                       }
                                       ?>
                                 </select>
                                 <span class="input-group-addon pointer" data-toggle="modal" data-target="#tax_modal" title="Add Tax"><i class="fa fa-plus-square-o text-primary fa-lg"></i></span>
                                    </div>
                                 <span id="tax_id_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="purchase_price"><?= $this->lang->line('purchase_price'); ?><span class="text-danger">*</span></label>
                                 <input type="text" class="form-control only_currency" id="purchase_price" name="purchase_price" placeholder="Total Price with Tax Amount"  value="<?php print $purchase_price; ?>" readonly='' >
                                 <span id="purchase_price_msg" style="display:none" class="text-danger"></span>
                              </div>
                           </div>
                           <!-- /row -->
                           <div class="row">
                              <div class="form-group col-md-4 <?=tax_disable_class()?>">
                                 <label for="tax_type"><?= $this->lang->line('tax_type'); ?><span class="text-danger">*</span></label>
                                 <select class="form-control select2" id="tax_type" name="tax_type"  style="width: 100%;" >
                                  <?php 
                                    $inclusive_selected=$exclusive_selected='';
                                    if($tax_type =='Inclusive') { $inclusive_selected='selected'; }
                                    if($tax_type =='Exclusive') { $exclusive_selected='selected'; }

                                  ?>
                                    <option <?= $exclusive_selected ?> value="Exclusive">Exclusive</option>
                                    <option <?= $inclusive_selected ?> value="Inclusive">Inclusive</option>
                                 </select>
                                 <span id="tax_type_msg" style="display:none" class="text-danger"></span>
                                 
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="profit_margin"><?= $this->lang->line('profit_margin'); ?>(%) <i class="hover-q " data-container="body" data-toggle="popover" data-placement="top" data-content="<?= $this->lang->line('based_on_purchase_price'); ?>" data-html="true" data-trigger="hover" data-original-title="">
                                  <i class="fa fa-info-circle text-maroon text-black hover-q"></i>
                                </i></label>
                                 <input type="text" class="form-control only_currency" id="profit_margin" name="profit_margin" placeholder="Profit in %"  value="<?php print $profit_margin; ?>" >
                                 <span id="profit_margin_msg" style="display:none" class="text-danger"></span>
                              </div>
                              <div class="form-group col-md-4">
                                 <label for="sales_price" class="control-label"><?= $this->lang->line('sales_price'); ?><span class="text-danger">*</span></label>
                                 <input type="text" class="form-control only_currency " id="sales_price" name="sales_price" placeholder="Sales Price"  value="<?php print $sales_price; ?>" >
                                 <span id="sales_price_msg" style="display:none" class="text-danger"></span>
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label for="final_price" class="control-label"><?= $this->lang->line('final_price'); ?><span class="text-danger">*</span></label>
                                 <input type="text" class="form-control only_currency " id="final_price" name="final_price" placeholder="Final Price"  value="<?php print $final_price; ?>" readonly >
                                 <span id="final_price_msg" style="display:none" class="text-danger"></span>
                              </div>
                           </div>
                           <!-- /row -->
                        
                           
                          
                           
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary add_item">Save</button>
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
               <?= form_close();?>
              </div>
              <!-- /.modal -->