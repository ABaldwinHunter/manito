$(document).ready(function () {

// $('#search_event').submit(function(event){
//   event.preventDefault();
//   $.ajax({
//     url: '/events/search',
//     type: 'POST'
//     data: $(this).serialize()
//   }).done(function(response){
//     console.log(response);
//     var imageTag = '<img src="' + response + '.png" title="' +response +'" alt="the roll">';
//     $('#die').html(imageTag);
//   });
// });
  $('#assign-ss').submit(function(event){
    event.preventDefault();
    var url = (this).action
    $.ajax({
      method: 'GET',
      url: url
    }).success(function(response){
      console.log(response)
      $('.giftee').html(response)
    })
  });

});
