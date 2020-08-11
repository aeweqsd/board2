<body>
<%@ include file= "Header.jsp" %>
<%@page import= "Bean.*"%>
<% 
	MemberBean member = (MemberBean)session.getAttribute("status");
	String id = member.get_memberid();
	String password =member.get_password();



%>

<div class="container">
	<div class="row">
		<div class="col-xs-1"></div>
		<div class="col-xs-10">
		<table class="table table striped">
			<tr><th>Id</th><th>Password</th></tr>
			<tr><td><%=id%></td><td><%=password%></td></tr>
		</table>
		</div>
		<div class="col-xs-1"></div>
	</div>
</div>
     
      <%@ include file= "Footer.jsp" %>
