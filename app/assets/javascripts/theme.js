

$("[data-toggle='buttons'] .btn").each(function(i, el) {
  var $button = $(el);
  var checked = $button.find("input[type='checkbox']").prop("checked");
  if (checked) {
    $button.addClass("active");
  } else {
    $button.removeClass("active");
  }
});


