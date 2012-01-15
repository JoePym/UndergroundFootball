// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('document').ready(function(){
  $('.player').draggable({
	  "revert": "invalid",
	});
  $('.tile').droppable({
    drop:function(event, ui){
      var player = $(ui.draggable);
      // disable further dragging for this turn
      player.draggable({'disabled': true});
      $.post(window.location + "/recieve_move", 
        {'player': $(player).data('id'),
         'location': $(this).data('id')
        }
      );
    }
  });
})
