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
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
	
    <title><%=title %></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="starter-template.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


	<style>
	.footer {
	position : absolute;
	bottom : 0;
	width : 100%;
	height : 60px;
	background-color : blue;
}


	.layer{
  position:absolute;
  top:40%;
  left:40%;
  width:400px;
  height:300px;
  margin:-50px 0 0 -50px;
}
	.layer2{
	position:absolute;
	top : 30%;
	left:10%;
	margin: -50px 0 0 -50px;

	
	
}
	.layer3{
	position:absolute;
	top : 60%;
	left:60%;
	width:400px;
	margin: -50px 0 0 -50px;
}
	.layer4{
	position:absolute;
	top : 60%;
	left:50%;
	width:400px;
	margin: -50px 0 0 -50px;
}
	.layer5{
	position:absolute;
	top : 70%;
	left:40%;
	width:400px;
	margin: -50px 0 0 -50px;
}
	.layer6{
	position:absolute;
	top : 70%;
	left : 30%;
	margin: -50px 0 0 -50px;
	width:600px;
}  .layer7{
	position:absolute;
	top : 120%;
	left :0%;
	margin : 0 0 0 50px;

}


ul{
   list-style:none;
   padding-left:0px;
   }


.footer {

    position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

	padding: 15px 0;

	text-align: center;

}
.a1 {
color : black ;
font-size:12px ;
background:white;
}
.a2{
color : white ;
font-size: 12px;
background : gray;
}
ul >li{
	font-family: "Times New Roman", Times, serif;
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
 