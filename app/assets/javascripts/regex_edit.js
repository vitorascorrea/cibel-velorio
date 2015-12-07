$( document ).ready(function() {
  
  $('.corpo-principal').delegate("#form_d_obito", "keypress", function(event){
    if (!event.charCode) return true;          
    var ch = String.fromCharCode(event.charCode);
    return (/[\d]/.test(ch));
  });
  
  $("#edit_d_obito_salvar").keypress(function(event) {
    if (!event.charCode) return true;          
    var ch = String.fromCharCode(event.charCode);
    return (/[\d]/.test(ch));
  });
});
