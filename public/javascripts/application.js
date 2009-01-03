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

