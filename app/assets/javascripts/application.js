// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require twitter/bootstrap
//= require jquery.ui.all
//= require sortable
//= require valid_email


jQuery(function($) {


  $("#modal").dialog({ autoOpen: false });
$("#modal").dialog({ show: 'fold' });
$("#modal").dialog({ hide: 'slide' });
$("#modal").dialog({ height: 'auto' });
$("#modal").dialog({ width: 'auto' });
$("#modal").dialog({ title: 'Edit user' });

$("#open_modal").click(function(){
  $("#modal").dialog('open');
  $(".error_messages").html('');
});

$("#close_modal").click(function(){
  $("#modal").dialog('close');
  
});



});