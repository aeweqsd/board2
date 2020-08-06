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
<ul class="container layer2">
      <li>
        	<div class= "row">
        		<div class="col-xs-12 a1">
        		<h4>number     <%=see.get_idboard()%></h4></div>
        		<div class="col-xs-12 a1">
        		<h4>name      <%=see.get_name() %></h4></div>
        		<div class="col-xs-12 a1">
        		<h4>writer     <%=see.get_idmember() %></h4></div>
        		<div class="col-xs-12 a1">
				<h4>time  		<%=see.get_time() %></h4></div>
				<div class="col-xs-12 a1">
				<h4>hit 		<%=see.get_hit() %></h4></div>
        	</div>
      </li>
</ul>
	<div class="layer4 container">
		<div class="row">
			<div class="col-xs-12">		
			<button type="button" id="show_insert_comment" class="btn btn-xs btn-default ">write_Comment</button></div>
	</div>
	</div>
	<c:set var="name" value="<%=name1%>"/>
	<c:set var="name2" value="<%=name2%>"/>
	<c:if test="${name eq name2}">	<%@include file= "Modified.jsp" %></c:if>

	<div id="insert_comment" style="display:block"class="layer6">
	<textarea class="form-control"rows="5" name="content" id="content"
			placeholder="Insert Content" required></textarea>
		<button type="button" id="commit" class="btn btn-xs btn-success">Commit</button>	
</div>
	

<%@ include file= "Footer.jsp" %>
</body>
<script>
$(document).on('click', '#show_insert_comment', function() {
	var con = document.getElementById('insert_comment');
		if(con.style.display =="block"){
			con.style.display="none";
		}else{
			con.style.display="block";
		}
	});
$(document).on('click', '#commit', function() {
	var content = document.getElementById('#content');
		console.log(content);
		//Using ajax send to controller
	});
	


</script>