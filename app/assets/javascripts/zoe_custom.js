$(document).ready(function(){
  	$("#notify_clicker").click(function() {
  		$('.unread').remove();
  		$.post("/users/read_notifications");
	});
});