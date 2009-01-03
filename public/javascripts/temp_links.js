function prepareTmpLinks() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;

	var links = document.getElementsByTagName("a");

	for ( var i=0; i < links.length; i++) {
		//Checkif popup is in the styles
		if(links[i].className.indexOf("temp_link") != -1 ) {
			links[i].onclick = function() {	
				alert("We are in the process of building the site's functionality. Live links to member-generated content are coming soon.")
				return false
			}
			links[i].onkeypress = links[i].onclick;
		}

	}
}
addLoadEvent(prepareTmpLinks);