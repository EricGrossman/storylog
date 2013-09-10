//Prevent disabled links from doing anything.
$(document).ready(function() {
    $('a.disabled').click(function(event){
	    return false;
        event.preventDefault(); // Prevent link from following its href
    });
});