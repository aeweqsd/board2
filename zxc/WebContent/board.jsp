<%@include file= "Header.jsp" %>
<%@page import = "DB.Board"%>
<%@page import= "java.util.List"%>
<%@page import= "Bean.BoardBean"%>
<%
	Board db = new Board();
	int b = db.boardnumber();
	int c = db.devide_page(b);

	int pagenum = (int)request.getAttribute("pagenum");
%>

<body>


<div class="container-fluid">
      <div class="row">
      	<div class="col-sm-1"></div> 	
     	<div class="col-sm-10">
     		<div class="col-sm-12">
     		<table class="table table-striped">
     		<tr>
     			<th>number</th>
     			<th>name</th>
     			<th>writer</th>
     			<th>time</th>
     			<th>hit</th>
     		</tr>
     			 <% 
      	List<BoardBean> list = db.selectList(pagenum);
      	for(BoardBean bb : list){
%>					<tr>
     				<td><%=bb.get_relative()%></td>
     				<td><a href="/zxc/service/boardsee?num=<%=bb.get_idboard()%>"><%=bb.get_name()%></a></td>
     				<td><%=bb.get_memberid()%></td>
     				<td><%=bb.get_time() %></td>
     				<td><%=bb.get_hit()%></td>
     				
     			</tr>
     	<% }%>
     	</table>
     	</div>
     		<div class="col-sm-12 text-center"><c:forEach var="i" begin="1" end="<%=c%>" step ="1">
      			<a href="/zxc/service/board?pagenum=${i}">${i}</a></c:forEach>
      			<p class="text-right"><a href="/zxc/service/write">Write Board</a></p>
      		</div>
     	</div>
    	<div class="col-sm-1"></div> 	
  
	</div>
	
</div>
   	  
<%@ include file= "Footer.jsp" %>


