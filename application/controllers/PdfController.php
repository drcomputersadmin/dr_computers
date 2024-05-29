<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PdfController extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('pdf');
    }

    public function generatePdf($saleid) {
        // Your PDF generation code here
        $this->load->library('Pdf');
        $data['saleid'] = $saleid;
        $this->load->view('print-sales-invoice',$saleid);
    }
}