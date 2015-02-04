 //разнеси скрипт по папкам

  $(function(){
        $("#sortable").sortable({
            placeholder: "ui-state-highlight"
            
          });

        //$('<div id=button><button>Получить порядок</button></div>').appendTo('body');
  
    // $('button').button().click(function() {
    //     var order = $('#sortable').sortable("toArray");
        
    //     alert(order);
    // })

    $("#sortable").sortable({
      //on move down
        update: function(event, ui) {
          var order = $('#sortable').sortable("toArray");

          $.post(
            "sort_bd",
            {
              param1: order
            }//,
            //onAjaxSuccess
          );


          //alert(order);
         }
    });

});