<%@page import = "java.util.List"%>
<%@page import = "Bean.*" %>
<%@page import = "DB.Comment" %>

<%
 	Comment db = new Comment();
	int idboard = Integer.parseInt(request.getParameter("idboard"));
	MemberBean see1= (MemberBean)session.getAttribute("status");
	int name3= see1.get_idmember();
	int selfkey2=0;
%>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
	  <% 
      	List<CommentBean> list = db.selectList(idboard);
      	for(CommentBean cc : list){
      	String row = "row";
      	int selfkey= cc.get_selfkey();
      	if(selfkey != 0){
      		
      		row ="col-xs-10  col-xs-offset-2";
      	}
%>				
				<c:set var="name3" value="<%=name3%>"/>
				<c:set var="name4" value="<%=cc.get_idmember()%>"/>
				<div class="<%=row%>">
					<table class="table table-striped">
						<tr><td><%=cc.get_content()%></td></tr>
						<tr><td><%=cc.get_time() %><p class="text-right"> <%=cc.get_idmember()%></p><button type="button" id="show-re-insert_comment" value=<%=cc.get_idcomment()%> idcomment=<%=cc.get_idcomment()%> class="btn btn-xs btn-default btn-idcomment" >Insert comment</button>
						<c:if test="${name3 eq name4}"><button type="button" id="btn-delete_comment" class="btn btn-xs btn-primary">Delete</button></c:if>
				</td></tr>
	
					</table>
        		
				<div class="col-xs-12 a2">
					<div style="display:none" id="<%=cc.get_idcomment()%>" class="div-comment">
						<textarea class="form-control"rows="3" name="reply" id="reply"
						placeholder="Insert Content" required></textarea>
					<button type="button" id="commit-2" value ="<%=cc.get_idcomment()%>"class="btn btn-xs btn-success">Commit</button></div>
				</div>
				</div>
				</div>
		</div>
		</div>
      <% }%>
<script>
/* $(document).on('click', '.btn-idcomment', function () {
	var id = $(this).attr('idcomment');
	console.log($('#'+id).css('display'));
	$('#'+id).toggle();
	//$('#'+id).show(500);
	//$('#'+id).hide(500);
	
}); */


</script>

