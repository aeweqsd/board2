<%@ include file= "Header.jsp" %>
<%@ page import="Bean.*" %>
<%
MemberBean member = (MemberBean)session.getAttribute("status");
int num = member.get_idmember();
BoardBean board = new BoardBean();
//if(request.getAttribute("modified")!=null){
//	board = (BoardBean)request.getAttribute("modified");	
//}
%>
<body>
	<form action="service/writing"method ="post" class="layer">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="text" name="name" class="form-control mt-4 mb-2"
			placeholder="Insert Name." required>
		<div class="form-group">
			<textarea class="form-control"rows="10" name="content"
			placeholder="Insert Content" required></textarea>
		</div>
		<button type="submit" class="btn btn-secondary mb-3">Submit</button>	
	</form>



<%@ include file= "Footer.jsp" %>