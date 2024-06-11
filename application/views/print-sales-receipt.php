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
$q1=$this->db->query("select * from db_sales where id=$sales_id");
		$res1=$q1->row();
		$customer_id = $res1->customer_id;
		$q2=$this->db->query("select * from db_customers where id=$customer_id");
		$res2=$q2->row();


        $customer_country=$res2->country_id;
	    $customer_state=$res2->state_id;

$payment_status=$res2->payment_status;
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
$pdf->SetTitle($res1->sales_code);
$pdf->SetSubject('Reciept');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData('', 0, 'Reciept', $res1->sales_code);

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
// Determine payment status class and text


// Add diagonal label
// Add diagonal label


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
// Add diagonal label
// Add diagonal label

$pdf->SetFont('times', '', 10);

$html = '<table style=" solid #0000">
          <tr Style="text-decoration: underline; ">
            <td>Seller</td>
            <td>Customer</td>
           
            <td>Details</td>
             
          </tr>
          <tr style="font-size: 15px;">
            <td><b>'.$domain->company_name.'</b></td>
    
            <td><b>'.$res2->customer_name.'</b></td>
              
            <td><b>Invoice Number :'.$res1->sales_code.'</b></td>
            </tr>
          <tr>
            <td>'.$domain->address.'<br/>'.
              $domain->city.'<br/>'.
              $domain->state.','.$domain->country.'<br/>'.
              'Phone : '.$domain->mobile.'<br/>'.
              'Email : '.$domain->email.'<br/>'.
              'TRN : '.$domain->vat_no.'</td>
            <td>'.$res2->address.'<br/>'.
            $res2->city.'<br/>'.
           $customer_state.'<br/>'.$customer_country.'<br/>'.
            'Phone : '.$res2->mobile.'<br/>'.
            'Email : '.$res2->email.'<br/>'.
            'TRN : '.$res2->vat_no.'</td><td>';

  $html = $html.'<br/><br/><br/>
              Invoice Date : '.$res2->sales_date.' '.$res2->created_time.'<br/>
              Reference Number : '.$res2->reference_no.'<br/>
                </td></tr></table>';

$pdf->Image(base_url('uploads/company/'.$domain->company_logo), $pdf->GetPageWidth() - 40, 3, 25);

$pdf->writeHTML($html, true, false, true, false, '');

// ---------------------------------------------------------


$html = '<table width="100%"  style="padding: 3px; border: 1px solid #A9A9A9;" >
            <thead >
               <tr bgcolor="#0099ff" style="color: #ffffff;">
                <th width="6%" align="center" style="border: 1px solid #dddddd;">#</th>
                <th width="25%" align="center" style="border: 1px solid #dddddd;">Payment Date</th>
                <th width="15%" align="center" style="border: 1px solid #dddddd;">Payment</th>
                <th width="10%" align="center" style="border: 1px solid #dddddd;">Payment Type</th>
                <th width="34%" align="center" style="border: 1px solid #dddddd;">Payment Note</th>
                <th width="15%" align="center" style="border: 1px solid #dddddd;">Created by</th>
              </tr>
            </thead>';

$q1 = $this->db->query("select * from db_salespayments where sales_id=$sales_id and payment>0");
$index = 1;
$str = '';
if ($q1->num_rows() > 0) {
    foreach ($q1->result() as $res1) {
        $html .= '<tr>
            <td width="6%" align="center" style="border: 1px solid #dddddd;">'.$index++.'</td>
            <td width="25%" style="border: 1px solid #dddddd;">'.$res1->payment_date.'</td>
            <td width="15%" align="center" style="border: 1px solid #dddddd;">'.$res1->payment.'</td>
            <td width="10%" align="center" style="border: 1px solid #dddddd;">'.$res1->payment_type.'</td>
            <td width="34%" align="center" style="border: 1px solid #dddddd;">'.$res1->payment_note.'</td>
            <td width="15%" align="center" style="border: 1px solid #dddddd;">'.$res1->created_by.'</td>
          </tr>';
    }
} else {
    $html .= "<tr><td colspan='5' class='text-danger text-center'>No Records Found</td></tr>";
}

$html .= '</table>'; // Close the table tag here

$pdf->writeHTML($html, true, false, true, false, '');

//---------------------------------------------------------
 

 $html ='<table>
           <tr>
             <td><span style="font-weight:bold;">Salesman : </span>'.$res2->created_by.'</td>
             <td align="right"><span style="font-weight:bold;">Receiver Name & Signature</span></td>
           </tr>
  </table>';
  $pdf->writeHTML($html, true, false, true, false, '');
//--------------------------------------------------------
$pdf->writeHTML($html, true, false, true, false, '');
//---------------------------------------------------------
 
 $pdf->Image(base_url('uploads/company/'.$domain->company_logo), $pdf->GetPageWidth() - 40, 3, 25);
 $pdf->writeHTML($html, true, false, true, false, '');
//Close and output PDF document
$pdf->Output($res1->sales_code.'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
