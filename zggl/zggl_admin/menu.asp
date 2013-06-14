<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
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
			<li><b></b><A href="news.asp" target=main>添加文章</A></li>
			<li><b></b><A href="news_list.asp" target=main>管理文章</A></li>
		</ul>
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

			
	<div class="menu_title" onclick="showsubmenu(3)">
		<span>网站信息</span>
	</div>
	<div id="submenu3" class="sec_menu">
		<ul>
			<li><b></b><a href="gonggao.asp" target="main">首页公告</a></li>
			<li><b></b><a href="viewfk.asp" target="main">客户反馈</a></li>
			<li><b></b><a href="html.asp" target="main">生成静态Html</a></li>
			<li><b></b><a href="admin_mb.asp" target="main">网站模板</a></li>
		</ul>
	</div>
	
	
	<div class="menu_title" onclick="showsubmenu(4)">
		<span>管理</span>
	</div>
	<div id="submenu4" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">添加</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(5)">
		<span>管理</span>
	</div>
	<div id="submenu5" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">添加</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(6)">
		<span>管理</span>
	</div>
	<div id="submenu6" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">添加</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(7)">
		<span>管理</span>
	</div>
	<div id="submenu7" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">添加</a></li>
		</ul>
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	

	<div class="menu_title">
		<span>其他</span>
	</div>
	<div class="sec_menu">
		<ul>
			<li><b></b><a href="pwd_update.asp" target="main">修改密码</a></li>
			<li><b></b><a href="logout.asp" 	target=_top>退出</a></li>
		</ul>
	</div>
	<div class="copyright">
		<a href="http://seirsoft.com" target="_blank" style="line-height:20px">seirsoft.com</a>
		<br />
		copyright
	</div>
	
	
	

<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle10 onClick="showsubmenu(10)" style="cursor:hand;"> <span><strong>网站信息管理</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu10'>
      <div class=sec_menu style="width:158">        
        <table align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="22"><a href="../newsadmin/newsup.asp" target="main">新闻管理</a> | <a href="../newsadmin/news.asp" target="main">添加</a></td>
          </tr>
          <tr>
            <td height="22"><a href="../newsadmin/nlei.asp?wang=up" target="main">新闻分类管理</a>  | <a href="../newsadmin/nlei.asp?wang=nlei" target="main">添加</a></td>
          </tr>
          <tr>

          </tr>
        </table>
      </div>
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle1 onClick="showsubmenu(1)" style="cursor:hand;"> 
          <span><strong>线路预订管理</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu1'>
<div class=sec_menu style="width:158">
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="admin_masterlook.asp?action=looknew" target="main">查看新的预订</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_masterlook.asp?action=lookall" target="main">查看所有预订</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_select.asp" target="main">按条件查看预订客户</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_yddel.asp?action=del" target="main">删除预订</a></td>
    </tr>
  </table>
</div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle2 onClick="showsubmenu(2)" style="cursor:hand;"><span>旅游线路管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu2'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_addxl.asp?action=edit" target="main">旅游线路管理</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=add" target="main">添加旅游线路</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=del" target="main">删除旅游线路</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=add" target="main">添加线路分类</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=del" target="main">删除线路分类</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=edit" target="main">编辑线路分类</a></td>
          </tr>
        </table>
      </div>
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle3 onClick="showsubmenu(3)" style="cursor:hand;"> <span><strong>酒店预订管理</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu3'>
      <div class=sec_menu style="width:158">        
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" height="22"><a href="OrderInfo.asp" target="main">新预订信息</a></td>
          </tr>
          <tr>
            <td height="22"><a href="OverOrderInfo.asp" target="main">已处理信息</a></td>
          </tr>
        </table>
      </div>
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle4 onClick="showsubmenu(4)" style="cursor:hand;"> 
          <span>酒店信息管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu4'>
<div class=sec_menu style="width:158">
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="HotelReg.asp" target="main">酒店信息添加</a></td>
    </tr>
    <tr>
      <td height="22"><a href="HotelInfo.asp" target="main">酒店信息审查</a></td>
    </tr>
    <tr>
      <td height="22"><a href="RoomReg.asp" target="main">房型信息添加</a></td>
    </tr>
    <tr>
      <td height="22"><a href="RoomInfo.asp" target="main">房型信息审查</a></td>
    </tr>
  </table>
</div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>

<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle11 onClick="showsubmenu(11)" style="cursor:hand;"><span>机票信息管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu11'>
      <div class=sec_menu style="width:158">
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
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle5 onClick="showsubmenu(5)" style="cursor:hand;"><span>导游管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu5'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_adddaoyou.asp" target="main">添加新导游</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_emddaoyou.asp" target="main">删除编辑导游</a></td>
          </tr>
        </table>
      </div>
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
   
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle12 onClick="showsubmenu(12)" style="cursor:hand;"><span>图片信息管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu12'>
      <div class=sec_menu style="width:158">
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
      <div  style="width:158">
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle6 onClick="showsubmenu(6)" style="cursor:hand;"> 
          <span>系统设置</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu6'>
<div class=sec_menu style="width:158">
            <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="88%" height="22"><a href='webconfig.asp' target=main>网站信息设置选项</a></td>
              </tr>
              <tr>
                <td width="88%" height="22"><a href='editxx.asp' target=main>网站其他信息设置</a></td>
              </tr>
              <tr>
                <td height="22"> <a href="shengmanage.asp" target="main">所在省设置</a></td>
              </tr>
              <tr>
                <td height="22"> <a href="shimanage.asp" target="main">所在市设置</a></td>
              </tr>
              <tr>
                <td height="22"><a href="manageuser.asp?action=all" target="main"><font color="#000000" >会员信息审查</font></a></td>
              </tr>
              <tr>
                <td height="22"><a href="editxx.asp?action=regtiaoyue" target="main">注册条约设置</a></td>
              </tr>
              <tr>
                <td height="22"><a href='Admin_password.asp' target=main>修改后台密码</a> | <a href="http://www.hncits.org" target="main">添加</a></td>
              </tr>
            </table>
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