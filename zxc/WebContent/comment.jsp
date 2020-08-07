<%@page import = "java.util.List"%>
<%@page import = "Bean.*" %>
<%@page import = "DB.Comment" %>

<%
 	Comment db = new Comment();
	int idboard = Integer.parseInt(request.getParameter("idboard"));
	MemberBean see1= (MemberBean)session.getAttribute("status");
	int name3= see1.get_idmember();
%>
<body>
	<ul class="py-2 container">
		<li>
		<div class="row">
	  <% 
      	List<CommentBean> list = db.selectList(idboard);
      	for(CommentBean cc : list){
%>
        		<div class="col-xs-12 a2">
        		<h5><%=cc.get_content()%></h5>
        		</div>
        		<div class="col-xs-5 a1">
        		<h5><%=cc.get_time()%></h5></div>
        		<div class="col-xs-3 a1">
				<h5><%=cc.get_idmember()%></h5></div>
				<div class="col-xs-4 a1">
				<button type="button" id="show-re-insert_comment" value=<%=cc.get_idmember()%> class="btn btn-xs btn-default" >Insert comment</button>
        		<c:set var="name3" value="<%=name3%>"/>
				<c:set var="name4" value="<%=cc.get_idmember()%>"/>
				<c:if test="${name3 eq name4}"><button type="button" id="btn-delete_comment" class="btn btn-xs btn-primary">Delete</button>
				</c:if>
				</div>
				<div class="col-xs-12 a2">
					<div style="display:none" id ='show'>
						<textarea class="form-control"rows="3" name="reply" id="reply"
						placeholder="Insert Content" required></textarea>
					<button type="button" id="commit-2" value ="<%=cc.get_idcomment()%>"class="btn btn-xs btn-success">Commit</button></div>
				</div>
				</div>
				</li>
				
				
      </ul>
      <% }%>
</body>
<script>
$(document).on('click', '#show-re-insert_comment',function(){

	var con1=document.getElementById('show');

	if(con1.style.display == "block"){
		con1.style.display = "none";
	}else{
		con1.style.display ="block";
	}
});
$(document).on('click', '#commit-2',function(){
	var idboard =<%=idboard%>;
	var commentwriter=<%=name3%>;
	var idcomment=document.getElementById('commit-2').value;
	var content=document.getElementById('reply').value;
	alert(idcomment);
	$.ajax('/zxc/service/insert_comment',{
		type:'post',
		data:{
			idboard:idboard,
			idcomment:idcomment,
			content:content,
			commentwriter:commentwriter
		},
		success:function(){
		},
		error:function(request,status,error){
			alert("message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	
	
	
	
})
$(document).on('click', '#btn-delete_comment',function(){
	
	
	
})



</script>