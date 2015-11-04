function resetActive(event, percent, step) {
  $(".progress-bar").css("width", percent + "%").attr("aria-valuenow", percent);
  $(".progress-completed").text(percent + "%");

  $("div").each(function () {
    if ($(this).hasClass("activestep")) {
      $(this).removeClass("activestep");
    }
  });

  if (event.target.className == "col-md-2") {
    $(event.target).addClass("activestep");
  }
  else {
    $(event.target.parentNode).addClass("activestep");
  }

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

$( document ).ready(function() {
  $("#fim_selecao").on("click", function(){      
      resetActive(event, 33, 'step-2');
  });
});