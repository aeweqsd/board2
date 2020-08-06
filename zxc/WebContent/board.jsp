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


<ul class="py-2 container layer2">
      <li>
        	<div class= "row">
        		<div class="col-xs-2 a1">
        		<h5>number</h5></div>
        		<div class="col-xs-3 a1">
        		<h5>name</h5></div>
        		<div class="col-xs-3 a1">
        		<h5>writer</h5></div>
        		<div class="col-xs-2 a1">
				<h5>time</h5></div>
				<div class="col-xs-2 a1">
				<h5>hit</h5></div>
        	</div>
      </li>
      <li>
             <% 
      	List<BoardBean> list = db.selectList(pagenum);
      	for(BoardBean bb : list){
%>
        		<div class="col-xs-2 a2">
        		<h5><%=bb.get_relative()%></h5></div>
        		<div class="col-xs-3 a2">
        		<h5><a href="/zxc/service/boardsee?num=<%=bb.get_idboard()%>"><%=bb.get_name()%></a></h5></div>
        		<div class="col-xs-3 a2">
				<h5><%=bb.get_memberid()%></h5></div>
				<div class="col-xs-2 a2">
				<h5><%=bb.get_time()%></h5></div>
				<div class="col-xs-2 a2">
				<h5><%=bb.get_hit()%></h5></div>
      </li>
      <% }%>
      <li> 
      			<div class="col-xs-12">
      			<h5><a href="/zxc/service/write">Write Board</a></h5>
     			</div>
      </li>
      <li>
      <div class="col-xs-7">
      	<c:forEach var="i" begin="1" end="<%=c%>" step ="1">
      			<h4><a href="/zxc/service/board?pagenum=${i}">${i} </a></h4>
      	</c:forEach>
    	  </div>

      
 
      </li>
</ul>




<%@ include file= "Footer.jsp" %>