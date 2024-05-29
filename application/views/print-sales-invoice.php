<?php
//============================================================+
// File name   : example_045.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 045 for TCPDF class
//               Bookmarks and Table of Content
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Bookmarks and Table of Content
 * @author Nicola Asuni
 * @since 2008-03-04
 */

// Include the main TCPDF library (search for installation path).
//require_once('tcpdf_include.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);


//************************************
$q1=$this->db->query("select * from db_company where id=1 and status=1");
$domain=$q1->row();
/*$company_name=$res1->company_name;
$company_mobile=$res1->mobile;
$company_phone=$res1->phone;
$company_email=$res1->email;
$company_country=$res1->country;
$company_state=$res1->state;
$company_city=$res1->city;
$company_address=$res1->address;
$company_gst_no=$res1->gst_no;
$company_vat_no=$res1->vat_no;
$company_logo=$res1->company_logo;*/

$q4=$this->db->query("select sales_invoice_footer_text from db_sitesettings where id=1");
$q5=$this->db->query("select sales_terms_and_conditions from db_company where id=1");
$res5=$q5->row();
$res4=$q4->row();
$sales_invoice_footer_text=$res4->sales_invoice_footer_text;
$sales_terms_and_conditions=$res5->sales_terms_and_conditions;


$q3=$this->db->query("SELECT a.customer_name,a.mobile,a.phone,a.gstin,a.tax_number,a.email,
a.city,s.state,c.country,a.tax_number as vat_no,
                       a.opening_balance,a.country_id,a.state_id,b.created_by,
                       a.postcode,a.address,b.sales_date,b.created_time,b.reference_no,
                       b.sales_code,b.sales_note,b.sales_status,
                       coalesce(b.grand_total,0) as grand_total,
                       coalesce(b.subtotal,0) as subtotal,
                       coalesce(b.paid_amount,0) as paid_amount,
                       coalesce(b.other_charges_input,0) as other_charges_input,
                       other_charges_tax_id,
                       coalesce(b.other_charges_amt,0) as other_charges_amt,
                       discount_to_all_input,
                       b.discount_to_all_type,
                       coalesce(b.tot_discount_to_all_amt,0) as tot_discount_to_all_amt,
                       coalesce(b.round_off,0) as round_off,
                       b.payment_status

                       FROM db_customers a,
                       db_sales b,db_states s,db_country c
                       WHERE 
                       a.`id`=b.`customer_id` AND s.id=a.state_id AND c.id=a.country_id AND
                       b.`id`='$sales_id' 
                       ");

$client=$q3->row();

if(!empty($customer_country)){
  $customer_country = $this->db->query("select country from db_country where id='$customer_country'")->row()->country;  
}
if(!empty($customer_state)){
  $customer_state = $this->db->query("select state from db_states where id='$customer_state'")->row()->state;  
}


//****************************************
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Riyas Sayir');
$pdf->SetTitle($client->sales_code);
$pdf->SetSubject('Tax Invoice');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData('', 0, 'Tax Invoice', $client->sales_code);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------


// add a page
$pdf->AddPage();

/////////
$template_id = $pdf->startTemplate(150, 100, true);
$pdf->StartTransform();
$pdf->StopTransform();
$pdf->Rotate(14, 250, 200);
$pdf->SetXY(0, 0);
$pdf->SetFont('times', '', 55);
$pdf->SetTextColor(0,153,255);
$pdf->Cell(0, 0, '---------    '.$domain->company_name, 0, 0, 'C', false, '', 0, false, 'T', 'M');
$pdf->endTemplate();
$pdf->SetAlpha(0.1);
$pdf->printTemplate($template_id, 20, 15, 180, 220, '', '', true);
$pdf->SetAlpha(1);
///////

$pdf->SetFont('times', '', 10);

$html = '<table style=" solid #0000">
          <tr Style="text-decoration: underline; ">
            <td>Seller</td>
            <td>Customer</td>
            <td>Details</td>
          </tr>
          <tr style="font-size: 15px;">
            <td><b>'.$domain->company_name.'</b></td>
            <td><b>'.$client->customer_name.'</b></td>
            <td><b>Invoice Number :'.$client->sales_code.'</b></td></tr>
          <tr>
            <td>'.$domain->address.'<br/>'.
              $domain->city.'<br/>'.
              $domain->state.','.$domain->country.'<br/>'.
              'Phone : '.$domain->mobile.'<br/>'.
              'Email : '.$domain->email.'<br/>'.
              'TRN : '.$domain->vat_no.'</td>
            <td>'.$client->address.'<br/>'.
            $client->city.'<br/>'.
            $client->state.'<br/>'.$client->country.'<br/>'.
            'Phone : '.$client->mobile.'<br/>'.
            'Email : '.$client->email.'<br/>'.
            'TRN : '.$client->vat_no.'</td><td>';

  $html = $html.'<br/><br/><br/>
              Invoice Date : '.$client->sales_date.' '.$client->created_time.'<br/>
              Reference Number : '.$client->reference_no.'<br/>
                </td></tr></table>';

$pdf->Image(base_url('uploads/company/'.$domain->company_logo), $pdf->GetPageWidth() - 40, 3, 25);

$pdf->writeHTML($html, true, false, true, false, '');

// ---------------------------------------------------------

$q2=$this->db->query("SELECT c.item_name, a.sales_qty,
a.price_per_unit, b.tax,b.tax_name,a.tax_amt,
a.discount_input,a.discount_amt, a.unit_total_cost,
a.total_cost
FROM 
db_salesitems AS a,db_tax AS b,db_items AS c 
WHERE 
c.id=a.item_id AND b.id=a.tax_id AND a.sales_id='$sales_id'");

$html = '<table width="100%"  style="padding: 3px; border: 1px solid #A9A9A9;" >
            <thead >
              <tr bgcolor="#0099ff" style="color: #ffffff;">
                <th width="6%" align="center" style="border: 1px solid #dddddd;">Item</th>
                <th width="44%" align="center" style="border: 1px solid #dddddd;">Name</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">Quantity</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">Unit Price</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">Discount</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">VAT</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">Total</th>
              </tr>
            </thead>';

        $totalprice = 0.0;
        $index = 1;
    foreach($q2->result()  as $item){

$html = $html.'<tr>
            <td width="6%" align="center" style="border: 1px solid #dddddd;">'.$index.'</td>
            <td width="44%" style="border: 1px solid #dddddd;">'.$item->item_name.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$item->sales_qty.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$item->price_per_unit.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$item->discount_amt.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$item->tax_amt.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$item->total_cost.'</td>
          </tr>';

    $index++;

    $tot_qty +=$item->sales_qty;
    $total_discount +=$item->discount_amt;
    $tot_tax_amt +=$item->tax_amt;
    $tot_total_cost +=$item->total_cost;
  }
$html = $html.'<tr style="font-weight:bold">
            <td colspan="2"  align="center" style="border: 1px solid #dddddd;">'.$key.'</td>
            <td  align="center" style="border: 1px solid #dddddd;">'.$tot_qty.'</td>
            <td  align="center" style="border: 1px solid #dddddd;"></td>
            <td  align="center" style="border: 1px solid #dddddd;">'.number_format($total_discount, 2, '.', '').'</td>
            <td  align="center" style="border: 1px solid #dddddd;">'.number_format($tot_tax_amt, 2, '.', '').'</td>
            <td  align="center" style="border: 1px solid #dddddd;">'.number_format($tot_total_cost, 2, '.', '').'</td>
          </tr>';
       
$subtotal=$client->subtotal;
if (strlen($subtotal) !== 0){
$html = $html.'<tr>
    <td colspan="4"></td>
    <td colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">Sub Total : </td>
    <td  align="center" style="border: 1px solid #dddddd;">'.$subtotal.'</td>
</tr>';
}


$grand_total=$client->grand_total;
$other_charges_input=$client->other_charges_input;
$other_charges_tax_id=$client->other_charges_tax_id;
$other_charges_amt=$client->other_charges_amt;
$paid_amount=$client->paid_amount;
$discount_to_all_input=$client->discount_to_all_input;
$discount_to_all_type=$client->discount_to_all_type;
$discount_to_all_type = ($discount_to_all_type=='in_percentage') ? '%' : 'Fixed';
$tot_discount_to_all_amt=$client->tot_discount_to_all_amt;
$round_off=$client->round_off;
$payment_status=$client->payment_status;

//other_charges_amt
//$discount_to_all_input." ".$discount_to_all_type;
//tot_discount_to_all_amt
//echo number_format(($round_off),2,'.','');
//grand_total
if (strlen($tot_discount_to_all_amt) !== 0){
  $html = $html.'<tr>
          <td colspan="4"></td>
          <td  colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">Discount : </td>
          <td  align="center" style="border: 1px solid #dddddd;">'.$tot_discount_to_all_amt.'</td>
      </tr>';
}

if (strlen($other_charges_input) !== 0){
  $html = $html.'<tr>
          <td colspan="4"></td>
          <td  colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">Other Charges : </td>
          <td  align="center" style="border: 1px solid #dddddd;">'.$other_charges_input.'</td>
      </tr>';
}
/*
if (strlen($round_off) !== 0){
$html = $html.'<tr>
        <td colspan="4"></td>
        <td  colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">Round Off	: </td>
        <td  align="center" style="border: 1px solid #dddddd;">'.$round_off.'</td>
    </tr>';
}
*/
$html = $html.'<tr>
    <td colspan="4"></td>
    <td  colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">VAT : </td>
    <td  align="center" style="border: 1px solid #dddddd;">'.$tot_tax_amt.'</td>
</tr>
<tr>
  <td colspan="4"></td>
  <td  colspan="2" style="font-weight:bold; border: 1px solid #dddddd;">Grand Total : </td>
  <td  align="center" style="border: 1px solid #dddddd;">'.$grand_total.'</td>
</tr>
</table>';
$pdf->writeHTML($html, true, false, true, false, '');
//---------------------------------------------------------
  $f = new NumberFormatter("aed", NumberFormatter::SPELLOUT);
  $f->setTextAttribute(NumberFormatter::DEFAULT_RULESET, "%spellout-numbering-verbose");
  $f->setAttribute(NumberFormatter::FRACTION_DIGITS, 0);
 $html = '<div><span style="font-weight:bold;">Grand Total : </span>AED '.$f->formatCurrency($grand_total, "AED").' only</div>';

 $pdf->writeHTML($html, true, false, true, false, '');
//---------------------------------------------------------


if(!empty($client->sales_note)) {
  $html = '<br/><br/><span style="font-weight:bold;">Note :</span>
  <br/><span style="">'.nl2br($client->sales_note).'</span><br/>';
  $pdf->writeHTML($html, true, false, true, false, '');
} 

if(!empty($sales_terms_and_conditions)) {
  $html = '<br/><br/><span style="font-weight:bold;">Terms & Conditions :</span>
  <br/><br/><span style="">'.nl2br($sales_terms_and_conditions).'</span>';
$pdf->writeHTML($html, true, false, true, false, '');
} 


if(!empty($sales_invoice_footer_text)) {
  $html ='<table>
  <tr>
    <td align="center"><span style="font-weight:bold;">'.$sales_invoice_footer_text.'</span></td>
  </tr>
</table>';
$pdf->writeHTML($html, true, false, true, false, '');
} 

 $html ='<table>
           <tr>
             <td><span style="font-weight:bold;">Salesman : </span>'.$client->created_by.'</td>
             <td align="right"><span style="font-weight:bold;">Receiver Name & Signature</span></td>
           </tr>
  </table>';
  $pdf->writeHTML($html, true, false, true, false, '');
//--------------------------------------------------------

//Close and output PDF document
$pdf->Output($client->sales_code.'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
