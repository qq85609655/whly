function getAccountList(){
	$.ajax({
		type : "post",
		url : whlyPath+"/ajax/getAccountList",
		data:"currentPage=1",
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var result=data.resData;
				console.log(JSON.stringify(result))
			}
			
		}			
	});
}
$(function(){
	getAccountList();
})
