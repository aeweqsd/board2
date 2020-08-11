
<body>
	<div class="container">
		<div class = "row">
			<div class = "col-xs-12">
				<div class ="form-group">
					<button type="button" id="btn-modified" class="replyUpdate btn btn-warning btn-xs">Modified</button>
					<button type="button" onclick ="board_delete();"class="replyUpdate btn btn-danger btn-xs">Delete</button>
				</div>
			</div>
		</div>
	</div>
			
</body>

<script>


function board_modified(){
	$(document).on('click', '#btn-modified', function () {
		alert();
	});
	
	//alert(" 11")
	//$.getJSON()
}
function board_delete(){
	
	
}
</script>