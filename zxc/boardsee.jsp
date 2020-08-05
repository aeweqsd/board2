<%@include file= "Header.jsp" %>
<%@page import = "DB.Board"%>
<%@page import= "java.util.List"%>
<%@page import= "Bean.*"%>
<%
	BoardBean see = (BoardBean)request.getAttribute("see");
	MemberBean see2 = (MemberBean)session.getAttribute("status");
	int name1= see2.get_idmember();
	int name2= see.get_idmember();

%>
<body>
<table class="table table-striped table-boardered ">
	<tr>
		<th>Number</th>
		<td><%=see.get_idboard() %></td>
	</tr>
	<tr>
		<th>Name</th>
		<td><%=see.get_name() %></td>
	</tr>
	<tr>
		<th>Content</th>
		<td><%=see.get_content() %></td>
	</tr>
	<tr>
		<th>Writer</th>
		<td><%=see.get_idmember() %></td>
	</tr>
	<tr>
		<th>Time</th>
		<td><%=see.get_time() %></td>
	</tr>
</table>
	<c:set var="name" value="<%=name1%>"/>
	<c:set var="name2" value="<%=name2%>"/>
	<c:if test="${name eq name2}">	<%@include file= "Modified.jsp" %></c:if>
	<form class ="form-signin" action="/zxc/service/insertcomment"method="post">
	<button class="btn btn-lg btn-default" type="submit">Comment</button>
	</form>		
	

<%@ include file= "Footer.jsp" %>
</body>
