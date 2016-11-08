$('#create_table').on('click', function(event) {
  event.preventDefault();

  var request = $.ajax({
    method: "GET",
    url: "/new_dish.json"
  });
  // request a new dish and alert the user
  request.done(function(newDish) {
    alert(newDish["dish"]);
  });
});
