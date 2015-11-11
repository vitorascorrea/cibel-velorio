function resetActive(event, percent, step) {
  $(".progress-bar").css("width", percent + "%").attr("aria-valuenow", percent);
  $(".progress-completed").text((percent/100*4)+1 + "/4");

  $("div").each(function () {
    if ($(this).hasClass("activestep")) {
      $(this).removeClass("activestep");
    }
  });

  $('#head_'+step).addClass("activestep");
  

  hideSteps(step);
}

function hideSteps(step) {
  $("div").each(function () {
    if ($(this).hasClass("activeStepInfo")) {
      
      
      
      
      
      // $(this).animate({
      //   width: 'toggle'
      // }, 450, function() {
      //   $(this).removeClass("activeStepInfo");
      //   $(this).addClass("hiddenStepInfo");
      //   showCurrentStepInfo(step);
      // });
      
      
      
      
      $(this).fadeOut(function (){
        $(this).removeClass("activeStepInfo");
        $(this).addClass("hiddenStepInfo");
        showCurrentStepInfo(step);
      });
      
      
      
      
    }
  });
}

function showCurrentStepInfo(step) {        
  var id = "#" + step;
  $(id).removeClass("hiddenStepInfo");
  $(id).hide().fadeIn(450);
  $(id).addClass("activeStepInfo");
}