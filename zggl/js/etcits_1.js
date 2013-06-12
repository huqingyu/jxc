var adwidth=396;
var adheight=422;
var adwidth_test=396-120;	//面板数字：背景
var adheight_test=422-25;	//面板数字:背景
var adwidth_title=396-100;	//面板上的标题

var t = n = count = 0;
$(function(){
	count = $("#play_list a").size();
	$("#play_list a:not(:first-child)").hide();
	$("#play_info").html($("#play_list a:first-child").find("img").attr('alt'));
	$("#play_text li:first-child").css({"background":"#f20",'color':'#fff',"font-size":"16px","font-weight":"bold"});
	$("#play_info").click(function(){window.open($("#play_list a:first-child").attr('href'), "_blank")});
	$("#play_text li").click(function() {
		var i = $(this).text() - 1;
		n = i;
		if (i >= count) return;
		$("#play_info").html($("#play_list a").eq(i).find("img").attr('alt'));
		$("#play_info").unbind().click(function(){window.open($("#play_list a").eq(i).attr('href'), "_blank")})
		$("#play_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
		$(this).css({"background":"#f20",'color':'#fff','font-size':'16px'}).siblings().css({"background":"#B3B3B3",'color':'#fff','font-size':'12px'});
	});
	t = setInterval("showAuto()", 5000);
	$("#play").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
	
	$('.jdZhezhao').hover(
		function () {
			$(this).children('.xuanfuCeng').removeClass('none');
		},
		function () {
			$(this).children('.xuanfuCeng').addClass('none')
		}
	)
})

function showAuto(){
	n = n >= (count - 1) ? 0 : n + 1;
	$("#play_text li").eq(n).trigger('click');
}

