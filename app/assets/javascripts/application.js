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

//= require_tree .

//= require jquery_ujs

//= require bootstrap-sprockets

//= require jquery.ui.all

jQuery(function($) {

  $(function() {
  $(".sort_paginate_ajax th a, .sort_paginate_ajax .pagination a").on("click", function(){
    $.getScript(this.href);
    return false;
  });
});

  //разнеси скрипт по папкам

  $(function(){
        $("#sortable").sortable({
            placeholder: "ui-state-highlight"
            
          });
});


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

//.modal('hide')
//--------------

var callbacks_password = $.Callbacks();
callbacks_password.add( validation_presence );
callbacks_password.add( validation_password );



//--------------

$("#email_form").change(validation_);

$("#password_form").change(callbacks_password.fire);

$("#password_confirmation_form").change(
callbacks_password.fire
  );

$("#first_name_form").change(validation_presence);

$("#last_name_form").change(validation_presence);

$("#secret").change(validation_presence);

//--------------

function validation_presence(){

  if (( $("#"+this.id).val().length )==0) {

    $("#"+this.id+"_rezult").html("can't be blank");
    $("#"+this.id+"_rezult").css('color', 'red');

  }else{
    $("#"+this.id+"_rezult").html("V");
    $("#"+this.id+"_rezult").css('color', 'green');
  }

}

function validation_password(){
  
  
  var p=$('#password_form').val();
  var p1=$('#password_confirmation_form').val();

  if (p!=p1){
    $("#password_form_rezult").html("Password doesn't match conf...");
    $("#password_confirmation_form_rezult").html("");
    $("#password_form_rezult").css("color","red");
    $("#password_confirmation_form_rezult").css("color","red");
  }else if (p.length!=0 && p1.length!=0)
  {
    $("#password_form_rezult").html("V");
    $("#password_confirmation_form_rezult").html("V");

    $("#password_form_rezult").css("color","green");
    $("#password_confirmation_form_rezult").css("color","green");
  }

}

function validation_(){

var params=
"email_form="    + $('#email_form').val() + 
"&email_form_ch=" + $('#email_form').attr('value');

$.ajax({
url: 'validation_aj',
data: params,
type: 'POST',
dataType: "script",
success: function(result){

$("#email_form_rezult").html(response_);

if (response_=='V'){
$("#email_form_rezult").css("color","green");
}else{
$("#email_form_rezult").css("color","red");
}

}

});
}

});