// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function getHTTPObject() { 
	var xhr = false; 
	if (window.XMLHttpRequest) { 
		xhr = new XMLHttpRequest(); 
	} else if (window.ActiveXObject) { 
		try { 
			xhr = new ActiveXObject("Msxml2.XMLHTTP"); 
		} catch(e) { 
			try { 
				xhr = new ActiveXObject("Microsoft.XMLHTTP"); 
			} catch(e) { 
				xhr = false; 
			} 
		} 
	} 
	return xhr; 
}

function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
			if (oldonload){
				oldonload();
			}
			func();
		}
	}
}



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