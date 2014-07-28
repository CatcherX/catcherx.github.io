var serverUrl = 'http://aspspider.info/CatcherXue0/Handler/ajaxhandler.ashx?key=CatcherX';

window.onload = function() {
		$.ajax({
		type: "get",
		async: true,
		url: serverUrl,
		dataType: "jsonp",
		jsonp: "callbackparam",
		jsonpCallback: "success_jsonpCallback",
		success: function (json) {
			console.log("responeFromServer:" + json[0].responeFromServer);
		},
		error: function () {
			console.log('fail');
		}
	});
}
