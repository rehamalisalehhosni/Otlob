// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-ui
//= require autocomplete-rails
//= require_tree .


function myFunc(){

	var myOrderId = $("#myOrderId").val();
	/*$.ajax(url: "/articles" , type:'POST').done (html) ->
	$("#viewMyTable").append html*/
	$.ajax(
		{
			type : 'GET',
			data : 'id='+myOrderId,
			url : "/friendapproved" ,
			dataType: "json",
			success : function( data )
			{
				// ha3ml loop 3la al dat Hna
				var myResult = '';
				//console.log( data.invitedFriend[0].user.id);
				if(data.invitedFriend.length != "0"){
					for(var i = 0; i < data.invitedFriend.length; ++i) {
					
				    console.log(data.invitedFriend[i].id)
					$("#myStatusTitle").html('Joined Friends');
					myResult +='<div class="col-sm-6"><img class="img-responsive img-thumbnail" src="/uploads/user/image/'+data.invitedFriend[i].user_id+'/'+data.invitedFriend[i].image+'"><h3>'+data.invitedFriend[i].name+'</h3></div>';
					}	
					$("#viewResult").html(myResult);
				}
				else
				{
					$("#viewResult").html("<p align='center'>No Joined Users</p>");
				}
				
				
				//$("#viewMyTable").html(data.articles[0].title );
				//console.log( data );		
			}
		});		
}


// un Accepted Friend

function unAccept(){

	var myOrderId = $("#myOrderId").val();
	/*$.ajax(url: "/articles" , type:'POST').done (html) ->
	$("#viewMyTable").append html*/
	$.ajax(
		{
			type : 'GET',
			data : 'id='+myOrderId,
			url : "/friendunapproved" ,
			dataType: "json",
			success : function( data )
			{
				// ha3ml loop 3la al dat Hna
				var myResult = '';
				if(data.invitedFriend.length != "0"){
					//console.log( data.invitedFriend[0].user.id);
					for(var i = 0; i < data.invitedFriend.length; ++i) {
						
					    console.log(data.invitedFriend[i].id)
						$("#myStatusTitle").html('Un Joined Friends');
						myResult +='<div class="col-sm-6"><img class="img-responsive img-thumbnail" src="/uploads/user/image/'+data.invitedFriend[i].user_id+'/'+data.invitedFriend[i].image+'"><h3>'+data.invitedFriend[i].name+'</h3></div>';
					}
					$("#viewResult").html(myResult);
				}
				else
				{
					$("#viewResult").html("<p align='center'>No Un Joined Users</p>");
				}
				//$("#viewMyTable").html(data.articles[0].title );
				//console.log( data );		
			}
		});		
}


// Join Order

function join_order(order_id){

	var myOrderId = order_id;


	/*$.ajax(url: "/articles" , type:'POST').done (html) ->
	$("#viewMyTable").append html*/
	$.ajax(
		{
			type : 'GET',
			data : 'id='+myOrderId,
			url : "/join_order" ,
			dataType: "json",
			success : function( data )
			{
				window.location = "/orders/"+myOrderId;
				//console.log("status Updated")
					
			}
		});		
}


// Cancel My Invitation
function cancel_order(order_id){

	var myOrderId = order_id;


	/*$.ajax(url: "/articles" , type:'POST').done (html) ->
	$("#viewMyTable").append html*/
	$.ajax(
		{
			type : 'GET',
			data : 'id='+myOrderId,
			url : "/cancel_order" ,
			dataType: "json",
			success : function( data )
			{
				window.location = "/orders/"+myOrderId;
				//console.log("status Updated")
					
			}
		});		
}