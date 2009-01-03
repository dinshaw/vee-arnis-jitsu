function preparePopups() {

	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;

	var links = document.getElementsByTagName("a");

	for ( var i=0; i < links.length; i++) {
		//Checkif popup is in the styles
		if(links[i].className.indexOf("popup") != -1 ) {
			title = links[i].getAttribute("title")			
			
			links[i].onclick = function() {	
				return popup(this,title,this.className);
			}
			links[i].onkeypress = links[i].onclick;
		}

	}
}

function popup(target,title,classname) {
	if(classname.indexOf("full") != -1 ) {
		w = 1000
		h = 800
	}else{
		w = 640
		h = 480
	}
	
	attributes = 'width='+w+',height='+h+',scrollbars=yes,resizable=yes'
	window.open(target,'NextGenPopup',attributes)
	return false
}

addLoadEvent(preparePopups);