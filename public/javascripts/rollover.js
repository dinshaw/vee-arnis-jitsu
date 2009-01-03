function prepareNav() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;

	var links = document.getElementsByTagName("a");

	for ( var i=0; i < links.length; i++) {
			//Checkif popup is in the styles
			if(links[i].className.indexOf("rollover") != -1 ) {

			links[i].onmouseover = function() {
				return navRollOver(this,"over");
			}
			links[i].onmouseout = function() {
				return navRollOver(this,"out");
			}
		}
	}
}

function navRollOver(anchor, state) {

	//get the first image element
	var img =  anchor.getElementsByTagName("img")[0]
	
	if(state == "over") {
		
		img.setAttribute("src",img.src.replace(/-off/,"-on"));	

	}else if (state == "out") {
	
		img.setAttribute("src",img.src.replace(/-on/,"-off"));			
	}


	//set the image src

}

addLoadEvent(prepareNav);