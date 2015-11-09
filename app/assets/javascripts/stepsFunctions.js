function resetActive(event, percent, step) {
  $(".progress-bar").css("width", percent + "%").attr("aria-valuenow", percent);
  $(".progress-completed").text(percent + "%");

  $("div").each(function () {
    if ($(this).hasClass("activestep")) {
      $(this).removeClass("activestep");
    }
  });

  $('#head_'+step).addClass("activestep");
  

  hideSteps();
  showCurrentStepInfo(step);
}

function hideSteps() {
  $("div").each(function () {
    if ($(this).hasClass("activeStepInfo")) {
      $(this).removeClass("activeStepInfo");
      $(this).addClass("hiddenStepInfo");
    }
  });
}

function showCurrentStepInfo(step) {        
  var id = "#" + step;
  $(id).addClass("activeStepInfo");
}