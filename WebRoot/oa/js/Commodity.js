function changeType()
{
	var typeId = document.addImg.type.value;
	$.ajax({
			   type: "POST",
			   url: "imgs",
			   data: "action=findCom&typeId="+typeId+"&r="+Math.random(),
			   success: function(msg){
			   		$("#com").html(msg);
			   	}
		}); 
}
function searchsecondArea()
{
	var teacher = document.select_housing.secondArea.value;
	if(teacher==-1||term==-1||teacher==""||term=="")
	{
		return;
	}else{
		$.ajax({
			   type: "POST",
			   url: "tAndC",
			   data: "method=showTandC&teacher="+teacher+"&term="+term+"&r="+Math.random(),
			   success: function(msg){
			   		$(".show_t_c_info").html(msg);
			   	}
		}); 
	}
}
