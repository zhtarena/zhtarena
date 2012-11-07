function changefirstModule()
{
	var firstModule = document.moduleform.pmodule.value;
	
	$.ajax({
			   type: "POST",
			   url: "module.do",
			   data: "method=changefirstModule&firstModule="+firstModule+"&r="+Math.random(),
			   success: function(msg){
			   		$("#module2").html(msg);
			   	}
		}); 


}
