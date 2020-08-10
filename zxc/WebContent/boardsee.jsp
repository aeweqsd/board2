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
	<div class="container layer3">
		<div class = "row">
			<div class = "col-xs-12">
				<div class ="form-group">
					<button type="button" id="modified" class="replyUpdate btn btn-warning btn-xs">Modified</button>
					<button type="button" id="delete"class="replyUpdate btn btn-danger btn-xs">Delete</button>
				</div>
			</div>
		</div>
	</div>

	<div id="insert_comment" style="display:none"class="layer6">
		<textarea class="form-control"rows="5" name="content" id="content"
				placeholder="Insert Content" required></textarea>
		<button type="button" id="commit" class="btn btn-xs btn-success">Commit</button>	
	</div>
	<div id="cmt" class="layer7">
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
$(document).on('click', '#delete',function(){
	var name1 =<%=name1%>
	var name2 =<%=name2%>
	var idboard =<%=see.get_idboard()%>;
	if(name1==name2){
		$.ajax('/zxc/service/delete_board',{
			type:'post',
			datatype:'html',
			data:{
				idboard:idboard
			},
		success:function(){
			alert("Delete Complete");
			window.location.href="board.jsp";
		},
		error:function(data,status,er){
			alert("error:"+data+"status"+status+"er"+er);
		}	
		})
		
	}else{
		alert("not matching this board");
	}
	
	
	
	
});
$(document).on('click', '#modified',function(){
	var name1 =<%=name1%>
	var name2 =<%=name2%>
	var idboard =<%=see.get_idboard()%>;
	if(name1==name2){
		$.ajax('/zxc/service/update_board',{
			type:'post',
			datatype:'html',
			data:{
				idboard:idboard
			},
		success:function(){
			
		},
		error:function(data,status,er){
			alert("error:"+data+"status"+status+"er"+er);
		}	
		})
		
	}else{
		alert("not matching this board");
	}
	
	
	
	
});


$(document).on('click', '#commit', function() {
	var idboard = <%=see.get_idboard()%>;
	var commentwriter= <%=name2%>;
	var content = document.getElementById('content').value;
	$.ajax('/zxc/service/insert_comment', {
		type:'post',
		datatype : 'html',
		data:{
			idboard: idboard,
			commentwriter: commentwriter,
			content: content
		},
		success:function(html){
//			alert("Complete");
			$('#cmt').html(html);
			//document.getElementById('cmt').html = html;
		},
		error:function(request,status,error){
		}
	});
});



	

</script>