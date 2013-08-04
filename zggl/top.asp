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
		<a href="/index.asp">首 页</a>
	</li>
	<li <% if menu_index="about" then Response.Write("class=menu2") end if %> >
		<a href="/help/about.asp">走进国旅</a>
	</li>
	<li <% if menu_index="news" then Response.Write("class=menu2") end if %> >
		<a href="/news.asp">新闻中心</a>
	</li>

	<li <% if menu_index="sny" then Response.Write("class=menu2") end if %> >
		<a href="/you_sheng.asp">省内游</a>
	</li>
	<li <% if menu_index="gny" then Response.Write("class=menu2") end if %> >
		<a href="/you_guonei.asp">国内游</a>
	</li>
	<li <% if menu_index="cjy" then Response.Write("class=menu2") end if %> >
		<a href="/you_guowai.asp">出境游</a>
	</li>
	<li <% if menu_index="jq" then Response.Write("class=menu2") end if %> >
		<a href="/jingqu.asp">景区</a>
	</li>
	<li <% if menu_index="hotel" then Response.Write("class=menu2") end if %> >
		<a href="/hotel.asp">酒店</a>
	</li>
	<li <% if menu_index="qz" then Response.Write("class=menu2") end if %> >
		<a href="/qianzheng.asp">签证</a>
	</li>
	<li <% if menu_index="zc" then Response.Write("class=menu2") end if %> >
		<a href="/zuche.asp">租车</a>
	</li>

	<li <% if menu_index="gef" then Response.Write("class=menu2") end if %> >
		<a href="/gaoerfu.asp">高尔夫</a>
	</li>	
	<li <% if menu_index="hy" then Response.Write("class=menu2") end if %> >
		<a href="/huiyi.asp">会议考察</a>
	</li>
</ul>
</div>