$( document ).on('turbolinks:load', function() {
	// console.log("I'm in global");
  var notification = document.querySelector('.global-notification');

  if(notification) {
    window.setTimeout(function() {
      notification.style.display = "none";
    }, 3000);
  }

});