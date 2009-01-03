function prepareToolTips() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;
	if (!document.getElementsByTagName("span")) return false;
	 
	var spans = document.getElementsByTagName("span");

	for ( var i=0; i < spans.length; i++) {

		//Checkif popup is in the styles
		if(spans[i].className.indexOf("tool_tip") != -1 ) {
			if (!spans[i].getElementsByTagName("span")) return false;
			
			tip = spans[i].getElementsByTagName("span")	
			
			spans[i].onmouseover = function() {	
				tip[0].style.display = "block";
			}
			spans[i].onmouseout = function() {	
				tip[0].style.display = "none";
			}
			spans[i].onclick = function() {	
				return false;
			}
			spans[i].onkeypress = spans[i].onclick;
		}

	}
}




addLoadEvent(prepareToolTips);

