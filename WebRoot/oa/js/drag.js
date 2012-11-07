$(document).ready(function(){
	var iscanmove = false;
	var offsetX=0;
	var offsetY=0;
	$("#msgpal").bind({
		mousedown:function(e){
			if($(e.target).attr("id")=="pal_close")
			{
				return;
			}
			else{
				iscanmove= true;
				offsetX = e.pageX-$(this).offset().left;
				offsetY = e.pageY-$(this).offset().top;
			}
		},
		mouseup:function(){
			iscanmove = false;
		}
		
	});
	$("body").bind({
		mousemove:function(e){
			if(iscanmove==true)
			{
				if(e.pageX-offsetX<0||e.pageY-offsetY<0)
				{
					return;
				}
				if(e.pageX-offsetX+parseInt($("#msgpal").css("width"))>document.body.clientWidth||e.pageY-offsetY+parseInt($("#msgpal").css("height"))>document.body.clientHeight)
				{
					return;
				}
				$("#msgpal").css("left",e.pageX-offsetX)
				.css("top",e.pageY-offsetY);
			}
		}
	});
});
