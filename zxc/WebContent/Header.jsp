<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
  <head>
  <%String title = (String)request.getAttribute("title");
  	String remem = (String) session.getAttribute("id");
  	System.out.println(remem);
  %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
    <title><%=title %></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<style>
	[class*="col-"] {
  padding-top: 15px;
  padding-bottom: 15px;
   background-color: #eee;  
   background-color: rgba(86,61,124,.15); 
     border: 1px solid #ddd; 
   border: 1px solid rgba(86,61,124,.2); 
}
html{
  position: relative;
  min-height: 100%;
}
  body{
    min-height: 2000px;
    padding-top : 70px;
    margin-bottom:60px;

  }
  #footer{
    position:fixed;
    padding: 10px 10px 0px 10px;
    bottom:0;
    width:100%;
    height :40px;
    background-color:grey;
  }
  .container{
    width:auto;
    max-width: 680px;
    padding: 0 15px;
  }
  .container .text-muted{
    margin:20px 0;
  }
	
</style>
  </head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top ">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href=/zxc/service/NewFile>Index</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/zxc/service/board">Board</a></li>
            <li><a href="service/Memberinfo">Member info</a></li>
            <li>
            <c:choose>
            	<c:when test="${sessionScope.status eq null}"><a href="/zxc/service/NewFile">Login</a></c:when>
            	<c:otherwise><a href="/zxc/service/logout">Logout</a></c:otherwise>
            </c:choose></li>
		
		</ul>
        </div>
      </div>
    </nav>
 