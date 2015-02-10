Template._pushpin.rendered = function() {

	var pushpin = function() {
		if ($('.table-of-contents').length) {
		  var toc_offset = $('.table-of-contents').first().offset().top;
		  $('.table-of-contents').each(function() {
		    var origin = $(this);
		    origin.pushpin({ 
		    	top: toc_offset,
		      	bottom: $(document).height() - window.innerHeight
		      });
		  });
		}
	}

	pushpin()
}