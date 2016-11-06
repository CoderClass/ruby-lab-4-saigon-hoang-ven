// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
  $.getJSON("http://localhost:3000/rooms/1/messages.json", function(messages) {
    // this is the data you receive from http://localhost:3000/rooms/1/messages.json
    // loop through the messages and render them
    // you can use $(".messages").append("blah")
    // to add blah to the <div class="messages">...</div> element
    //alert('success')
    $("#messages").empty()
    for (var index = 0 ; index < messages.length; ++index){
    $("#messages").append('<div>' + messages[index].content +'</div>')
  }
  })
}

window.updateMessagesViaJS = function() {
  console.log("inside updateMessagesViaJSON");
  $.getScript("http://localhost:3000/rooms/1/messages")
}
