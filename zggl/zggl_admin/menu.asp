<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
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
			<li><b></b><A href="news_list.asp?lei=63" target=main>�������</A> | <a href="news.asp?lei=63" target=main>���</a></li>
			<li><b></b><A href="news_list.asp?lei=64" target=main>���Ź���</A> | <a href="news.asp?lei=64" target=main>���</a></li>
			<li><b></b><A href="news_list.asp?lei=66" target=main>ǩ֤����</A> | <a href="news.asp?lei=66" target=main>���</a></li>
			<li><b></b><A href="news_list.asp?lei=76" target=main>��ʶ����</A> | <a href="news.asp?lei=76" target=main>���</a></li>
		</ul>
	</div>

	
	<div class="menu_title" onclick="showsubmenu(81)">
		<span>��Ʒ����</span>
	</div>
	<div id="submenu81" class="sec_menu">
		<ul>
			<li><b></b><A href="pic_goods_list.asp?lei=73" target=main>�� �� ��</A> | <a href="pic_goods.asp?lei=73" target=main>���</a></li>
			<li><b></b><A href="pic_goods_list.asp?lei=82" target=main>�⳵����</A> | <a href="pic_goods.asp?lei=82" target=main>���</a></li>
			<li><b></b><A href="pic_goods_list.asp?lei=75" target=main>�������</A> | <a href="pic_goods.asp?lei=75" target=main>���</a></li>
		</ul>
	</div>
	
	



	<div class="menu_title" onclick="showsubmenu(91)">
		<span>��·Ԥ������</span>
	</div>
    <div id='submenu91' class=sec_menu>
  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="88%" height="22"><a href="admin_masterlook.asp?action=looknew" target="main">�鿴�µ�Ԥ��</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_masterlook.asp?action=lookall" target="main">�鿴����Ԥ��</a></td>
    </tr>
    <tr>
      <td height="22"><a href="admin_search.asp" target="main">�ͻ�������ѯ</a></td>
    </tr>

    <tr>
      <td height="22"><a href="admin_yddel.asp?action=del" target="main">ɾ��Ԥ��</a></td>
    </tr>
  </table>
</div>


	<div class="menu_title" onclick="showsubmenu(92)">
		<span>������·����</span>
	</div>
    <div id='submenu92' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="22"><a href="admin_addxl.asp?action=add" target="main">������·���</a></td>
          </tr>
          <tr>
            <td width="88%" height="22"><a href="admin_addxl.asp?action=edit" target="main">������·�༭</a></td>
          </tr>

          <tr>
            <td height="22"><a href="admin_addxl.asp?action=del" target="main">������·ɾ��</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=add" target="main">��·�������</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=edit" target="main">��·����༭</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_board.asp?action=del" target="main">��·����ɾ��</a></td>
          </tr>
		  </table>
      </div>

	<div class="menu_title" onclick="showsubmenu(93)">
		<span>�Ƶ�Ԥ������</span>
	</div>
    <div id='submenu93' class=sec_menu>        
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="16%" height="22"><a href="OrderInfo.asp" target="main">��Ԥ����Ϣ</a></td>
          </tr>
          <tr>
            <td height="22"><a href="OverOrderInfo.asp" target="main">�Ѵ�����Ϣ</a></td>
          </tr>
        </table>
      </div>

	<div class="menu_title" onclick="showsubmenu(94)">
		<span>�Ƶ���Ϣ����</span>
	</div>
	<div id='submenu94' class=sec_menu>
	  <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="88%" height="22"><a href="admin_hotel_add.asp" target="main">�Ƶ���Ϣ���</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="admin_hotel.asp" target="main">�Ƶ���Ϣ�༭</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="admin_hotel_del.asp" target="main">�Ƶ���Ϣɾ��</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="RoomReg.asp" target="main">������Ϣ���</a></td>
		</tr>
		<tr>
		  <td height="22"><a href="RoomInfo.asp" target="main">������Ϣ���</a></td>
		</tr>
	  </table>
	</div>
<!--
	<div class="menu_title" onclick="showsubmenu(95)">
		<span>��Ʊ��Ϣ����</span>
	</div>
    <div id='submenu95' class=sec_menu>
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

	<div class="menu_title" onclick="showsubmenu(96)">
		<span>���ι���</span>
	</div>
    <div id='submenu96' class=sec_menu>
        <table width="130"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="88%" height="22"><a href="admin_adddaoyou.asp" target="main">����µ���</a></td>
          </tr>
          <tr>
            <td height="22"><a href="admin_emddaoyou.asp" target="main">ɾ���༭����</a></td>
          </tr>
        </table>
    </div>



	<div class="menu_title" onclick="showsubmenu(97)">
		<span>ͼƬ��Ϣ����</span>
	</div>
    <div id='submenu97' class=sec_menu>
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

	  
	  
	<div class="menu_title" onclick="showsubmenu(2)">
		<span>�������</span>
	</div>
	<div id="submenu2" class="sec_menu">
		<ul>
			<li><b></b><a href="nlei.asp?wang=nlei" target="main">�������</a></li>
			<li><b></b><a href="nlei.asp?wang=up" target="main">�����޸�</a></li>
		</ul>
	</div>

-->			
	<div class="menu_title" onclick="showsubmenu(3)">
		<span>��վ��Ϣ</span>
	</div>
	<div id="submenu3" class="sec_menu">
		<ul>
			<li><b></b><a href="gonggao.asp" target="main">��ҳ����</a></li>
			<li><b></b><a href="webconfig.asp" target="main">����ѡ��</a></li>
			<!--
			<li><b></b><a href="viewfk.asp" target="main">�ͻ�����</a></li>
			<li><b></b><a href="html.asp" target="main">���ɾ�̬Html</a></li>
			<li><b></b><a href="admin_mb.asp" target="main">��վģ��</a></li>
			-->
		</ul>
	</div>
	
	<div class="menu_title">
		<span>����</span>
	</div>
	<div class="sec_menu">
		<ul>
			<li><b></b><a href="manageuser.asp?action=all" target="main">��Ա����</a></li>
			
			<li><b></b><a href="shengmanage.asp" target="main">ʡ �� ��</a></li>
			<li><b></b><a href="shimanage.asp" target="main">��������</a></li>
			
			<li><b></b><a href="pwd_update.asp" target="main">�޸�����</a></li>
			<li><b></b><a href="logout.asp" 	target=_top>�˳�</a></li>
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