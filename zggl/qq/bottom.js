document.write('<table cellSpacing="0" cellPadding="0" width="110" border="0" id="qqtab">');
document.write('    <tr>');
document.write('      <td width="110" onclick="if(document.all.qqtab.style.display==\'none\'){document.all.qqtab.style.display=\'\'} else {document.all.qqtab.style.display=\'none\'}"><img src="/qq/images/qq/skin/1/top.gif" border="0"></td>');
document.write('    </tr>');
document.write('    <tr id="qqstab">');
document.write('      <td valign="middle" align="center" background="/qq/images/qq/skin/1/middle.gif">');
document.write('<table border="0" width="80" cellSpacing="0" cellPadding="0">');
document.write('  <tr>');
document.write('    <td width="80" height="5" border="0" colspan="2"></td>');
document.write('  </tr>');
document.write('  <tr>');
if (online[0]==0)
  {
    document.write('    <td width="25" height="22" valign="middle" align="center">');
    document.write('<img src="/qq/images/qqface/76_f.gif" border="0">');
    document.write('    </td>');
    document.write('    <td width="55" height="22" valign="middle" align="left">');
    document.write('<a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=909888314&amp;Site=hncits.org&amp;Menu=yes" target="blank"><font style="font-size:12px;TEXT-DECORATION:none;color:#000000;">中国国旅</font></a><br>');
    document.write('    </td>');
  }
else
  {
    document.write('    <td width="25" height="22" valign="middle" align="center">');
    document.write('<img src="/qq/images/qqface/76_m.gif" border="0">');
    document.write('    </td>');
    document.write('    <td width="55" height="22" valign="middle" align="left">');
    document.write('<a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=909888314&amp;Site=hncits.org&amp;Menu=yes" target="blank"><font style="font-size:12px;TEXT-DECORATION:none;color:#000000;">中国国旅</font></a><br>');
    document.write('    </td>');
  }
document.write('  </tr>');
document.write('  <tr>');
if (online[1]==0)
  {
    document.write('    <td width="25" height="22" valign="middle" align="center">');
    document.write('<img src="/qq/images/qqface/84_f.gif" border="0">');
    document.write('    </td>');
    document.write('    <td width="55" height="22" valign="middle" align="left">');
    document.write('<a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=854757408&amp;Site=hncits.org&amp;Menu=yes" target="blank"><font style="font-size:12px;TEXT-DECORATION:none;color:#000000;">中国国旅</font></a><br>');
    document.write('    </td>');
  }
else
  {
    document.write('    <td width="25" height="22" valign="middle" align="center">');
    document.write('<img src="/qq/images/qqface/84_m.gif" border="0">');
    document.write('    </td>');
    document.write('    <td width="55" height="22" valign="middle" align="left">');
    document.write('<a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=854757408&amp;Site=hncits.org&amp;Menu=yes" target="blank"><font style="font-size:12px;TEXT-DECORATION:none;color:#000000;">中国国旅</font></a><br>');
    document.write('    </td>');
  }
document.write('  </tr>');
document.write('</table>');
document.write('</td>');
document.write('    </tr>');
document.write('    <tr>');
document.write('      <td width="110" onclick="if(document.all.qqstab.style.display==\'none\'){document.all.qqstab.style.display=\'\'} else {document.all.qqstab.style.display=\'none\'}"><img src="/qq/images/qq/skin/1/bottom.gif" border="0"></td>');
document.write('    </tr>');
document.write('</table>');
var verticalpos="frombottom"
if (!document.layers)
document.write('</div>')
function JSFX_FloatTopDiv()
{
  var jqq_startX = screen.width-137;
  var jqq_startY = 500;
  var jqq_ns = (navigator.appName.indexOf("Netscape") != -1);
  var jqq_d = document;
  function jqq_ml(id)
  {
    var jqq_el=jqq_d.getElementById?jqq_d.getElementById(id):jqq_d.all?jqq_d.all[id]:jqq_d.layers[id];
    if(jqq_d.layers)jqq_el.style=jqq_el;
    jqq_el.sP=function(x,y){this.style.left=x;this.style.top=y;};
    jqq_el.x = jqq_startX;
    if (verticalpos=="fromtop")
      jqq_el.y = jqq_startY;
    else{
      jqq_el.y = jqq_ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;
      jqq_el.y -= jqq_startY;
    }
    return jqq_el;
  }
  window.stayTopLeft=function()
  {
    if (verticalpos=="fromtop"){
      var jqq_pY = jqq_ns ? pageYOffset : document.body.scrollTop;
      jqq_ftlObj.y += (jqq_pY + jqq_startY - jqq_ftlObj.y)/8;
    }
    else{
      var jqq_pY = jqq_ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;
      jqq_ftlObj.y += (jqq_pY - jqq_startY - jqq_ftlObj.y)/8;
    }
    jqq_ftlObj.sP(jqq_ftlObj.x, jqq_ftlObj.y);
    setTimeout("stayTopLeft()", 10);
  }
  jqq_ftlObj = jqq_ml("divStayTopLeft");
  stayTopLeft();
}
JSFX_FloatTopDiv();
