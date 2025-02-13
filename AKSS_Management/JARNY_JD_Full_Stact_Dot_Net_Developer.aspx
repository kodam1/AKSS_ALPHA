<%@ Page Language="C#" AutoEventWireup="true" 
    CodeBehind="JARNY_JD_Full_Stact_Dot_Net_Developer.aspx.cs" 
    Inherits="AKSS_Management.JARNY_JD_Full_Stact_Dot_Net_Developer" %>

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
  <title>Full Stack .NET Developer Intern Job Description</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: url('https://images.unsplash.com/photo-1536859355448-76f92ebdc33d?auto=format&fit=crop&w=1500&q=80') no-repeat center center fixed;
      background-size: cover;
      color: #fff;
    }
    .container {
      margin-top: 0px;
      padding: 30px;
      border-radius: 15px;
    }
    h1 {
      color: #0d6efd;
    }
    .section-title {
      font-size: 1.5rem;
      font-weight: bold;
      color: #ffffff;
    }
    .emoji {
      font-size: 1.3rem;
    }
    @media print {
      #printButton, #pdfButton, #excelButton {
        display: none;
      }
      header, footer {
        display: none;
      }
    }
  </style>
</head>
<body>
  <div class="container" id="container">
    <h1 class="text-center">JARNY Software Solutions.</h1>
    <h2 class="text-center">Full Stack .NET Developer Intern (Fresher)</h2>
      
     <a href="https://api.whatsapp.com/send?phone=+9109833812843&text=Hi" target="_blank" class="back-to-top d-flex align-items-center justify-content-end"><i class="bx bxl-whatsapp me-1 btn btn-success" style="font-size: x-large;"></i></a>

     <p><strong>Location:</strong> [Remote]</p>
    <p><strong>Internship Duration:</strong> [3-6 months]</p>
    <%--<p><strong>Stipend:</strong> [Mention if any]</p>--%>

    <section>
      <h2 class="section-title">About Us <span class="emoji">🚀💻✨</span></h2>
      <p>We are a dynamic and innovative software development agency specializing in creating tailored solutions for clients across various industries. Our mission is to deliver exceptional value and foster creativity, collaboration, and technological excellence.</p>
    </section>

    <section>
      <h2 class="section-title">Job Overview <span class="emoji">🤝📊💡</span></h2>
      <p>We are seeking a motivated and enthusiastic Full Stack .NET Developer Intern (Fresher) to join our team. This internship offers an excellent opportunity to gain hands-on experience in developing web applications using the .NET framework, working on both front-end and back-end technologies.</p>
    </section>

    <section>
      <h2 class="section-title">Key Responsibilities <span class="emoji">🎯📱📈</span></h2>
      <ul>
        <li>Assist in designing, developing, and maintaining web applications using .NET technologies.</li>
        <li>Work on both front-end (HTML, CSS, JavaScript) and back-end (C#, .NET Core) development.</li>
        <li>Collaborate with the team to understand project requirements and deliver solutions.</li>
        <li>Write clean, scalable, and maintainable code following best practices.</li>
        <li>Participate in code reviews and debugging sessions.</li>
        <li>Learn and implement database management using SQL Server or other relational databases.</li>
        <li>Support the deployment and maintenance of applications.</li>
      </ul>
    </section>

    <section>
      <h2 class="section-title">Key Skills and Qualifications <span class="emoji">🎓💬🧑‍💻</span></h2>
      <ul>
        <li>Recent graduate or final-year student in Computer Science, IT, or a related field.</li>
        <li>Basic understanding of .NET framework, C#, and ASP.NET Core.</li>
        <li>Familiarity with front-end technologies like HTML, CSS, and JavaScript.</li>
        <li>Knowledge of SQL and database management systems.</li>
        <li>Strong problem-solving skills and attention to detail.</li>
        <li>Eagerness to learn and adapt to new technologies.</li>
        <li>Good communication and teamwork skills.</li>
      </ul>
    </section>

    <section>
      <h2 class="section-title">Why Join Us <span class="emoji">🌟🤗📈</span></h2>
      <ul>
        <li>Gain hands-on experience in full-stack development using .NET technologies.</li>
        <li>Work on real-world projects and enhance your technical skills.</li>
        <li>Learn from experienced developers and grow your career in software development.</li>
        <li>Opportunity for a full-time role based on performance.</li>
        <li>Collaborative and supportive work environment.</li>
      </ul>
    </section>

    <section>
      <h2 class="section-title">How to Apply <span class="emoji">📧📝💼</span></h2>
      <p>Interested candidates can send their resumes and a cover letter to <strong>akshay.kodam@zohomail.in</strong> with the subject line <strong>"Full Stack .NET Developer Intern Application."</strong></p>
    </section>

    <div class="mt-4">
      <button id="printButton" class="btn btn-primary">Print Page</button>
      <button id="pdfButton" class="btn btn-success" style="display:none">Export as PDF</button>
      <button id="excelButton" class="btn btn-warning" style="display:none">Export to Excel</button>
    </div>
      
      <a href="#" class="back-to-top d-flex align-items-center justify-content-end"><i class="bi bi-arrow-up-short btn btn-primary" style="font-size: x-large;"></i></a>
	
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
  <script>
    // Print page functionality
    document.getElementById('printButton').addEventListener('click', () => {
      var printContents = document.getElementById('container').innerHTML;
      var originalContents = document.body.innerHTML;
      document.body.innerHTML = printContents;
      window.print();
      document.body.innerHTML = originalContents;
    });

    // Export page as PDF functionality
    document.getElementById('pdfButton').addEventListener('click', () => {
      alert('This feature requires server-side implementation or third-party library like jsPDF.');
    });

    // Export to Excel functionality
    document.getElementById('excelButton').addEventListener('click', () => {
      const tableData = [['Section', 'Details'], ['Job Title', 'Full Stack .NET Developer Intern'], ['Company', 'JARNY Software Solutions'], ['Description', 'Dynamic Software Development Agency']];
      const ws = XLSX.utils.aoa_to_sheet(tableData);
      const wb = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(wb, ws, 'Job Description');
      XLSX.writeFile(wb, 'Job_Description.xlsx');
    });
  </script>
</body>
</html>
