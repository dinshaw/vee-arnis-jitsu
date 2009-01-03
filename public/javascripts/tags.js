
function prepareTagShortCuts() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;

	var cloud = document.getElementById("tag-cloud");
	var links = document.getElementsByTagName("a");
	var tagField = document.getElementById("asset-tag-list");
	
	for ( var i=0; i < links.length; i++) {
		//Checkif popup is in the styles
		if(links[i].className.indexOf("tag-short-cut") != -1 ) {
			
			links[i].onclick = function() {	
				tagField.value = tagField.value + ", " + this.getAttribute("title");
				return false;
			}
			
			links[i].onkeypress = links[i].onclick;
		}
	}
}

addLoadEvent(prepareTagShortCuts);