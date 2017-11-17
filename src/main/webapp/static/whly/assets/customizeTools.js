$(function() {

	//alert
	window.alert=function(e){
		bootbox.alert({ 
		  size: "small",
		  title: "提示信息",
		  message: e, 
		  callback: function(){ /* your callback code */ }
		})
	}
	
});