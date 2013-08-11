<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/menu.css" rel="stylesheet" />
</head>
<body>
<div style="width:158px; margin:0 auto;">
	<div class="menu_title" onclick="showsubmenu(1)">
		<span>文章管理</span>
	</div>
	<div id="submenu1" class="sec_menu">
		<ul>
			<li><b></b><A href="news_list.asp?lei=63" target=main>公告管理</A> | <a href="news.asp?lei=63" target=main>添加</a></li>
			<li><b></b><A href="news_list.asp?lei=64" target=main>新闻管理</A> | <a href="news.asp?lei=64" target=main>添加</a></li>
			<li><b></b><A href="news_list.asp?lei=66" target=main>签证管理</A> | <a href="news.asp?lei=66" target=main>添加</a></li>
			<li><b></b><A href="news_list.asp?lei=76" target=main>常识管理</A> | <a href="news.asp?lei=76" target=main>添加</a></li>
		</ul>
	</div>

	
	<div class="menu_title" onclick="showsubmenu(81)">
		<span>商品管理</span>
	</div>
	<div id="submenu81" class="sec_menu">
		<ul>
			<li><b></b><A href="pic_goods_list.asp?lei=73" target=main>高 尔 夫</A> | <a href="pic_goods.asp?lei=73" target=main>添加</a></li>
			<li><b></b><A href="pic_goods_list.asp?lei=82" target=main>租车管理</A> | <a href="pic_goods.asp?lei=82" target=main>添加</a></li>
			<li><b></b><A href="pic_goods_list.asp?lei=75" target=main>会议管理</A> | <a href="pic_goods.asp?lei=75" target=main>添加</a></li>
		</ul>
	</div>
	
	



	<div class="menu_title" onclick="showsubmenu(91)">
		<span>线路预订管理</span>
	</div>
    <div id='submenu91' class=sec_menu>
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="admin_masterlook.asp?action=looknew" target="main">查看新的预订</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_masterlook.asp?action=lookall" target="main">查看所有预订</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_search.asp" target="main">客户订单查询</a></td>
    </tr>

    <tr>
      <td height="22"><a href="admin_yddel.asp?action=del" target="main">删除预订</a></td>
    </tr>
  </table>
</div>


	<div class="menu_title" onclick="showsubmenu(92)">
		<span>旅游线路管理</span>
	</div>
    <div id='submenu92' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=add" target="main">旅游线路添加</a></td>
          </tr>
          <tr>
            <td width="88%" height="22"><a href="admin_addxl.asp?action=edit" target="main">旅游线路编辑</a></td>
          </tr>

          <tr>
            <td height="22"><a href="admin_addxl.asp?action=del" target="main">旅游线路删除</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=add" target="main">线路分类添加</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=edit" target="main">线路分类编辑</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=del" target="main">线路分类删除</a></td>
          </tr>
		  </table>
      </div>

	<div class="menu_title" onclick="showsubmenu(93)">
		<span>酒店预订管理</span>
	</div>
    <div id='submenu93' class=sec_menu>        
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" height="22"><a href="OrderInfo.asp" target="main">新预订信息</a></td>
          </tr>
          <tr>
            <td height="22"><a href="OverOrderInfo.asp" target="main">已处理信息</a></td>
          </tr>
        </table>
      </div>

	<div class="menu_title" onclick="showsubmenu(94)">
		<span>酒店信息管理</span>
	</div>
	<div id='submenu94' class=sec_menu>
	  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="88%" height="22"><a href="admin_hotel_add.asp" target="main">酒店信息添加</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="admin_hotel.asp" target="main">酒店信息编辑</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="admin_hotel_del.asp" target="main">酒店信息删除</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="RoomReg.asp" target="main">房型信息添加</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="RoomInfo.asp" target="main">房型信息审查</a></td>
		</tr>
	  </table>
	</div>
<!--
	<div class="menu_title" onclick="showsubmenu(95)">
		<span>机票信息管理</span>
	</div>
    <div id='submenu95' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="Admin_AddJipiao.asp" target="main">添加机票信息</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_EmdJipiao.asp" target="main">删除编辑机票信息</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_lookjipiao.asp?action=looknew" target="main">查看新的预订</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_lookjipiao.asp?action=lookall" target="main">查看所有预订</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_ydjipiaodel.asp?action=del" target="main">删除预订</a></td>
          </tr>
        </table>
      </div>

	<div class="menu_title" onclick="showsubmenu(96)">
		<span>导游管理</span>
	</div>
    <div id='submenu96' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_adddaoyou.asp" target="main">添加新导游</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_emddaoyou.asp" target="main">删除编辑导游</a></td>
          </tr>
        </table>
    </div>



	<div class="menu_title" onclick="showsubmenu(97)">
		<span>图片信息管理</span>
	</div>
    <div id='submenu97' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="Admin_PicEditDel.asp?action=edit" target="main">管理图片</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_AddPic.asp?action=add" target="main">添加图片</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_PicEditDel.asp?action=del" target="main">删除图片</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=add" target="main">添加图片分类</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=edit" target="main">编辑图片分类</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=del" target="main">删除图片分类</a></td>
          </tr>
        </table>
      </div>

	  
	  
	<div class="menu_title" onclick="showsubmenu(2)">
		<span>分类管理</span>
	</div>
	<div id="submenu2" class="sec_menu">
		<ul>
			<li><b></b><a href="nlei.asp?wang=nlei" target="main">分类添加</a></li>
			<li><b></b><a href="nlei.asp?wang=up" target="main">分类修改</a></li>
		</ul>
	</div>

-->			
	<div class="menu_title" onclick="showsubmenu(3)">
		<span>网站信息</span>
	</div>
	<div id="submenu3" class="sec_menu">
		<ul>
			<li><b></b><a href="gonggao.asp" target="main">首页公告</a></li>
			<li><b></b><a href="webconfig.asp" target="main">设置选项</a></li>
			<!--
			<li><b></b><a href="viewfk.asp" target="main">客户反馈</a></li>
			<li><b></b><a href="html.asp" target="main">生成静态Html</a></li>
			<li><b></b><a href="admin_mb.asp" target="main">网站模板</a></li>
			-->
		</ul>
	</div>
	
	<div class="menu_title">
		<span>其他</span>
	</div>
	<div class="sec_menu">
		<ul>
			<li><b></b><a href="manageuser.asp?action=all" target="main">会员管理</a></li>
			
			<li><b></b><a href="shengmanage.asp" target="main">省 管 理</a></li>
			<li><b></b><a href="shimanage.asp" target="main">市区管理</a></li>
			
			<li><b></b><a href="pwd_update.asp" target="main">修改密码</a></li>
			<li><b></b><a href="logout.asp" 	target=_top>退出</a></li>
		</ul>
	</div>
	<div class="copyright">
		<a href="http://seirsoft.com" target="_blank" style="line-height:20px">seirsoft.com</a>
		<br />
		copyright
	</div>
		
	
	
	
	
	
	
</div>
<script>
function showsubmenu(sid)
{
	var o = document.getElementById("submenu" + sid);
	if (o.style.display == "none")
	{
		o.style.display = "";
	}
	else
	{
		o.style.display = "none";
	}
}
</script>
</body>