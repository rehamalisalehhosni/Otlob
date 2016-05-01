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


	/*$.ajax(url: "/articles" , type:'POST').done (html) ->
	$("#viewMyTable").append html*/
	$.ajax(
		{
			type : 'GET',
			url : "/friendapproved" ,
			dataType: "json",
	        
			success : function( data )
			{
				// ha3ml loop 3la al dat Hna
				
				//console.log( data.invitedFriend[0].user.id);
				for(var i = 0; i < data.invitedFriend.length; ++i) {
				    console.log(data.invitedFriend[i].created_at)
					//$("#viewMyTable").append(data.invitedFriend[i].user.name + "<BR>" );
				}

				//$("#viewMyTable").html(data.articles[0].title );
				//console.log( data );		
			}
		});		
}
