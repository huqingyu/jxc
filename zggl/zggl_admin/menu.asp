<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>��̨���� - by seirsoft.com</title>
<link href="css/menu.css" rel="stylesheet" />
</head>
<body>
<div style="width:158px; margin:0 auto;">
	<div class="menu_title" onclick="showsubmenu(1)">
		<span>���¹���</span>
	</div>
	<div id="submenu1" class="sec_menu">
		<ul>
			<li><b></b><A href="news.asp" target=main>�������</A></li>
			<li><b></b><A href="news_list.asp" target=main>��������</A></li>
		</ul>
	</div>

	<div class="menu_title" onclick="showsubmenu(2)">
		<span>�������</span>
	</div>
	<div id="submenu2" class="sec_menu">
		<ul>
			<li><b></b><a href="nlei.asp?wang=nlei" target="main">�������</a></li>
			<li><b></b><a href="nlei.asp?wang=up" target="main">�����޸�</a></li>
		</ul>
	</div>

			
	<div class="menu_title" onclick="showsubmenu(3)">
		<span>��վ��Ϣ</span>
	</div>
	<div id="submenu3" class="sec_menu">
		<ul>
			<li><b></b><a href="gonggao.asp" target="main">��ҳ����</a></li>
			<li><b></b><a href="viewfk.asp" target="main">�ͻ�����</a></li>
			<li><b></b><a href="html.asp" target="main">���ɾ�̬Html</a></li>
			<li><b></b><a href="admin_mb.asp" target="main">��վģ��</a></li>
		</ul>
	</div>
	
	
	<div class="menu_title" onclick="showsubmenu(4)">
		<span>����</span>
	</div>
	<div id="submenu4" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">���</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(5)">
		<span>����</span>
	</div>
	<div id="submenu5" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">���</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(6)">
		<span>����</span>
	</div>
	<div id="submenu6" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">���</a></li>
		</ul>
	</div>
	<div class="menu_title" onclick="showsubmenu(7)">
		<span>����</span>
	</div>
	<div id="submenu7" class="sec_menu">
		<ul>
			<li><b></b><a href="#" target="main">���</a></li>
		</ul>
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	

	<div class="menu_title">
		<span>����</span>
	</div>
	<div class="sec_menu">
		<ul>
			<li><b></b><a href="pwd_update.asp" target="main">�޸�����</a></li>
			<li><b></b><a href="logout.asp" 	target=_top>�˳�</a></li>
		</ul>
	</div>
	<div class="copyright">
		<a href="http://seirsoft.com" target="_blank" style="line-height:20px">seirsoft.com</a>
		<br />
		copyright
	</div>
	
	
	

<table width=158 align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle10 onClick="showsubmenu(10)" style="cursor:hand;"> <span><strong>��վ��Ϣ����</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu10'>
      <div class=sec_menu style="width:158">        
        <table align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="22"><a href="../newsadmin/newsup.asp" target="main">���Ź���</a> | <a href="../newsadmin/news.asp" target="main">���</a></td>
          </tr>
          <tr>
            <td height="22"><a href="../newsadmin/nlei.asp?wang=up" target="main">���ŷ������</a>  | <a href="../newsadmin/nlei.asp?wang=nlei" target="main">���</a></td>
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
          <span><strong>��·Ԥ������</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu1'>
<div class=sec_menu style="width:158">
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="admin_masterlook.asp?action=looknew" target="main">�鿴�µ�Ԥ��</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_masterlook.asp?action=lookall" target="main">�鿴����Ԥ��</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_select.asp" target="main">�������鿴Ԥ���ͻ�</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_yddel.asp?action=del" target="main">ɾ��Ԥ��</a></td>
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
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle2 onClick="showsubmenu(2)" style="cursor:hand;"><span>������·����</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu2'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_addxl.asp?action=edit" target="main">������·����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=add" target="main">���������·</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=del" target="main">ɾ��������·</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=add" target="main">�����·����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=del" target="main">ɾ����·����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=edit" target="main">�༭��·����</a></td>
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
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle3 onClick="showsubmenu(3)" style="cursor:hand;"> <span><strong>�Ƶ�Ԥ������</strong></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu3'>
      <div class=sec_menu style="width:158">        
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" height="22"><a href="OrderInfo.asp" target="main">��Ԥ����Ϣ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="OverOrderInfo.asp" target="main">�Ѵ�����Ϣ</a></td>
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
          <span>�Ƶ���Ϣ����</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu4'>
<div class=sec_menu style="width:158">
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="HotelReg.asp" target="main">�Ƶ���Ϣ���</a></td>
    </tr>
    <tr>
      <td height="22"><a href="HotelInfo.asp" target="main">�Ƶ���Ϣ���</a></td>
    </tr>
    <tr>
      <td height="22"><a href="RoomReg.asp" target="main">������Ϣ���</a></td>
    </tr>
    <tr>
      <td height="22"><a href="RoomInfo.asp" target="main">������Ϣ���</a></td>
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
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle11 onClick="showsubmenu(11)" style="cursor:hand;"><span>��Ʊ��Ϣ����</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu11'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="Admin_AddJipiao.asp" target="main">��ӻ�Ʊ��Ϣ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_EmdJipiao.asp" target="main">ɾ���༭��Ʊ��Ϣ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_lookjipiao.asp?action=looknew" target="main">�鿴�µ�Ԥ��</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_lookjipiao.asp?action=lookall" target="main">�鿴����Ԥ��</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_ydjipiaodel.asp?action=del" target="main">ɾ��Ԥ��</a></td>
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
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle5 onClick="showsubmenu(5)" style="cursor:hand;"><span>���ι���</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu5'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_adddaoyou.asp" target="main">����µ���</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_emddaoyou.asp" target="main">ɾ���༭����</a></td>
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
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="Images/Admin_left_1.gif" id=menuTitle12 onClick="showsubmenu(12)" style="cursor:hand;"><span>ͼƬ��Ϣ����</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu12'>
      <div class=sec_menu style="width:158">
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="Admin_PicEditDel.asp?action=edit" target="main">����ͼƬ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_AddPic.asp?action=add" target="main">���ͼƬ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_PicEditDel.asp?action=del" target="main">ɾ��ͼƬ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=add" target="main">���ͼƬ����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=edit" target="main">�༭ͼƬ����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="Admin_Pic_board.asp?action=del" target="main">ɾ��ͼƬ����</a></td>
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
          <span>ϵͳ����</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu6'>
<div class=sec_menu style="width:158">
            <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="88%" height="22"><a href='webconfig.asp' target=main>��վ��Ϣ����ѡ��</a></td>
              </tr>
              <tr>
                <td width="88%" height="22"><a href='editxx.asp' target=main>��վ������Ϣ����</a></td>
              </tr>
              <tr>
                <td height="22"> <a href="shengmanage.asp" target="main">����ʡ����</a></td>
              </tr>
              <tr>
                <td height="22"> <a href="shimanage.asp" target="main">����������</a></td>
              </tr>
              <tr>
                <td height="22"><a href="manageuser.asp?action=all" target="main"><font color="#000000" >��Ա��Ϣ���</font></a></td>
              </tr>
              <tr>
                <td height="22"><a href="editxx.asp?action=regtiaoyue" target="main">ע����Լ����</a></td>
              </tr>
              <tr>
                <td height="22"><a href='Admin_password.asp' target=main>�޸ĺ�̨����</a> | <a href="http://www.hncits.org" target="main">���</a></td>
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