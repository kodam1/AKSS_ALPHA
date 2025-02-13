<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JARNY_Invoice.aspx.cs" Inherits="AKSS_Management.INVOICE.JARNY_Invoice" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Invoice Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container{
            max-width: 800px;  
            height: auto;       
            margin:auto;
            padding: auto;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }
        .invoice-header {
            text-align: center;
            margin-bottom: 30px;	
			 
        }		 
        .invoice-header img {
            max-height: 200px;
            height: 150px;
            border-radius: 50%;
        }
        .invoice-details, .invoice-summary {
            margin-top: 20px;
        }
        .print-btn {
            margin-top: 20px;
        }
		 
    </style>
	
	<script>


	 document.addEventListener('DOMContentLoaded', function () {  
      
        const printBtn = document.querySelector('#btnPrint');       		
        printBtn.addEventListener('click', () => {		
             window.print();

            // var printContents = document.getElementById('printContent').innerHTML;
            // var originalContents = document.body.innerHTML;

            // document.body.innerHTML = printContents;
            // window.print();

        });	

    });
    </script>
	
</head>
<body>
    <div class="container"  id="printContent">
	  <div class="row mt-3" style="display:none;">
        <!-- <div class="col-sm-12 col-md-12 col-lg-12"> -->
            <div class="col-sm-12 col-md-4 col-lg-4">     
                <div class="invoice-header ">
                   <%-- <img src="../assets/img/Jarny_logo1.jpg" alt="Company Logo" id="btnPrint">   --%>                   
                    <!-- <img src="D:/AKSS/Main Invoice html document type/AKSS_LOGO1.png" alt="Company Logo" id="btnPrint">                       -->
                </div>      
            </div>
             <div class="col-sm-12 col-md-8 col-lg-8">
                   <h3>JARNY Software Solution</h3>
                   <!-- <p style="font-size: xx-small;margin-top: 5px;margin-bottom: 5px;text-align: left;">Business Tech For Inovation</p> -->
                   <p>                      
                       Temghar 2, Bhiwandi, Maharashtra - 421302<br>
                       Email: akshay.kodam@zohomail.in<br>
                       Phone: +91 9833812843
                   </p>  
            </div>
        <!-- </div> -->

        </div>

        <div class="row mt-3 mb-5">
            <table>
                <tr>
                    <td class="invoice-header ">
                        <img src="../assets/img/Jarny_logo1.jpg" alt="Company Logo" id="btnPrint">
                    </td>
                    <td class="justify-content-end">
                        <h3>JARNY Software Solution</h3>
                        <!-- <p style="font-size: xx-small;margin-top: 5px;margin-bottom: 5px;text-align: left;">Business Tech For Inovation</p> -->
                        <p>
                            Temghar 2, Bhiwandi, Maharashtra - 421302<br>
                            Email: akshay.kodam@zohomail.in<br>
                            Phone: +91 9833812843
                        </p>
                    </td>
                </tr>
            </table>
        </div>


        <div class="row">
            <div class="col-md-6">				
                <h6><b>Bill To:</b> </h6>
                <p>
                    <strong>Pooja Dental Clinic</strong> <br>
                    Anand Nagar, Bhiwandi, Maharashtra - 421302 <br>
                    Email: abc@gmail.com<br>
                    Phone: +91 90672 86287
                </p>                 
            </div>
            <div class="col-md-6 text-end">
                <h6><b>Invoice Details:</b> </h6>
                <p>
                    <strong>Invoice No:</strong> INV1<br>
                    <strong>Date:</strong> 12-12-2024
                </p>
            </div>
        </div>

        <div class="invoice-details">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Sr. No.</th>
                        <th>Product</th>
                        <th>Qty</th>
                        <th>Rate</th>
                        <th>Tax</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Website for Pooja Dental Clinic<br><small>HSN Code: DC1</small></td>
                        <td>1.00</td>
                        <td>₹ 20,000.00</td>
                        <td>₹ 2,000.00</td>
                        <td>₹ 22,000.00</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="invoice-summary">
            <div class="row">
                <div class="col-md-6">
                    <p>
                        <strong>Base Amount:</strong> ₹ 20,000.00<br>
                        (+) SGST: 2.50% ₹ 500.00<br>
                        (+) CGST: 2.50% ₹ 500.00<br>
                        (+) IGST: 5.00% ₹ 1,000.00
                    </p>
                </div>
                <div class="col-md-6 text-end">
                    <p>
                        <strong>Total:</strong> ₹ 22,000.00<br>
                        (-) Discount: ₹ 2,000.00<br>
                        (-) Paid (16-12-2024): ₹ 10,000.00<br>
                        <strong>Balance:</strong> ₹ 10,000.00
                    </p>
                </div>
            </div>
        </div>

		 
        <footer class="text-center mt-3">
            <p class="text-end"><strong>Signature:</strong> Akshay Ashok Kodam</p>             
					Thank you for your business! 			 
        </footer>
		
        <!-- <div class="text-center print-btn" style="visibility:hidden">
            <button class="btn btn-primary btn-print" id="btnPrint">Print Invoice</button>
			onclick="window.print()"
        </div> -->

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
