<%@include file= "Header.jsp" %>
<%@page import = "DB.Board"%>
<%@page import= "java.util.List"%>
<%@page import= "Bean.*"%>
<%
	BoardBean see = (BoardBean)request.getAttribute("see");
	MemberBean see2 = (MemberBean)session.getAttribute("status");
	int name1= see2.get_idmember();
	int name2= see.get_idmember();
	int idboard= see.get_idboard();

%>
<div class="container-fluid">
      <div class="row">
 		<div class="col-xs-1"></div>
 		<div class="col-xs-10">
        		<table class="table table-striped">
        		<tr>
        		<td>number  <%=see.get_idboard()%></td></tr>
        		<tr><td>name      <%=see.get_name() %></td></tr>
        		<tr><td>content      <%=see.get_content()%></td></tr>
        		<tr><td>writer     <%=see.get_idmember() %></td></tr>
				<tr><td>time  		<%=see.get_time() %></td></tr>
				<tr><td>hit 		<%=see.get_hit() %></td></tr>
				</table>		
  
			<div class="col-xs-12">		
			<button type="button" id="show_insert_comment" class="btn btn-xs btn-default ">write_Comment</button>
			<div class ="form-group text-center">
					<button type="button" id="modified" class="replyUpdate btn btn-warning btn-xs">Modified</button>
					<button type="button" id="delete"class="replyUpdate btn btn-danger btn-xs">Delete</button>
			</div>
	</div>
				
	
	<div id="insert_comment" style="display:none"class="col-xs-12">
		<textarea class="form-control"rows="5" name="content" id="content"
				placeholder="Insert Content" required></textarea>
		<button type="button" id="commit" class="btn btn-xs btn-success">Commit</button>	
	</div>
	<div id="cmt" class="col-xs-12">
	</div>
	</div>
	<div class="col-xs-1"></div>
	</div>
	</div>
	

<%@ include file= "Footer.jsp" %>
</body>
<script>
$(document).ready(function(){
	var idboard =<%=see.get_idboard()%>;

	$.ajax('/zxc/service/show_comment',{
		type:'post',
		data:{
			idboard:idboard
		},
	success:function(html){
		$("#cmt").html(html);
	},
	error:function(request,status,error){
		
		
}
	

	
});
})
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
	var commentwriter= <%=name1%>;
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

})
$(document).on('click', '#commit-2',function(){
	var idboard = <%=see.get_idboard()%>;
	var commentwriter=<%=name1%>;
	var idcomment=document.getElementById('commit-2').value;
	var content=document.getElementById('reply').value;
	$.ajax('/zxc/service/insert_comment',{
		type:'post',
		data:{
			idboard:idboard,
			idcomment:idcomment,
			content:content,
			commentwriter:commentwriter
		},
		success:function(html){
			$('#cmt').html(html);
		},
		error:function(request,status,error){
			alert("message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	
	
	
	
})
$(document).on('click', '#btn-delete_comment',function(){
	var idboard=<%=idboard%>;
	var idcomment=document.getElementById('commit-2').value;
	$.ajax('/zxc/service/delete_comment',{
		type:'post',
		data:{
			idboard:idboard,
			idcomment:idcomment
			
		},
		success:function(html){
			$('#cmt').html(html);
		},
		error:function(request,status,error){
			alert("message"+request.responseText+"error:"+error)
		}
	
	
});
	
})


$(document).on('click', '.btn-idcomment', function () {
	var id = $(this).attr('idcomment');
	console.log($('#'+id).css('display'));
	$('#'+id).toggle();
	//$('#'+id).show(500);
	//$('#'+id).hide(500);
	
});


	

</script>