<body>
<%@ include file= "Header.jsp" %>
<%@page import= "Bean.*"%>
<% 
	MemberBean member = (MemberBean)session.getAttribute("status");
	String id = member.get_memberid();
	String password =member.get_password();



%>

<ul class="py-2 layer2 container">
      <li>
        	<div class= "row ">
        		<div class="col-xs-2 a1">
        		<h2>member id = <%=id %> </h2></div>
        		<div class="col-xs-7 a1">
        		<h2>member password = <%=password %></h2></div>
        	</div>
      </li>
      </ul>
      <%@ include file= "Footer.jsp" %>
</body>
</html>