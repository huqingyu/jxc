<div id="J_header">
<div class="info">
<span id="J_user"></span>
<span id="J_cpos"></span>
<div class="J_login"></div>
</div>
<div class="logo"></div>
</div>
<div  class="J_menu">
<ul>
	<li <% if menu_index="" then Response.Write("class=menu2") end if %> >
		<a href="/index.asp">�� ҳ</a>
	</li>
	<li <% if menu_index="about" then Response.Write("class=menu2") end if %> >
		<a href="/help/about.asp">�߽�����</a>
	</li>
	<li <% if menu_index="news" then Response.Write("class=menu2") end if %> >
		<a href="/news.asp">��������</a>
	</li>

	<li <% if menu_index="sny" then Response.Write("class=menu2") end if %> >
		<a href="/you_sheng.asp">ʡ����</a>
	</li>
	<li <% if menu_index="gny" then Response.Write("class=menu2") end if %> >
		<a href="/you_guonei.asp">������</a>
	</li>
	<li <% if menu_index="cjy" then Response.Write("class=menu2") end if %> >
		<a href="/you_guowai.asp">������</a>
	</li>
	<li <% if menu_index="jq" then Response.Write("class=menu2") end if %> >
		<a href="/jingqu.asp">����</a>
	</li>
	<li <% if menu_index="hotel" then Response.Write("class=menu2") end if %> >
		<a href="/hotel.asp">�Ƶ�</a>
	</li>
	<li <% if menu_index="qz" then Response.Write("class=menu2") end if %> >
		<a href="/qianzheng.asp">ǩ֤</a>
	</li>
	<li <% if menu_index="zc" then Response.Write("class=menu2") end if %> >
		<a href="/zuche.asp">�⳵</a>
	</li>

	<li <% if menu_index="gef" then Response.Write("class=menu2") end if %> >
		<a href="/gaoerfu.asp">�߶���</a>
	</li>	
	<li <% if menu_index="hy" then Response.Write("class=menu2") end if %> >
		<a href="/huiyi.asp">���鿼��</a>
	</li>
</ul>
</div>