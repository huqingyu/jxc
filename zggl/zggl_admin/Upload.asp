<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<style>
<!--
body { font-size:9pt   }
td{ font-size:9pt   }
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
textarea {border-width: 1; border-color: #000000; font-family: 宋体; font-size: 9pt; font-style: bold;}
#sponsorAdDiv {position:absolute; height:1; width:1; top:0; left:0;}
-->
</style>
<script>
adTime=8;
chanceAd=1;
var ns=(document.layers);
var ie=(document.all);
var w3=(document.getElementById && !ie);
adCount=0;
function initAd(){
        if(!ns && !ie && !w3) return;
        if(ie)                adDiv=eval('document.all.sponsorAdDiv.style');
        else if(ns)        adDiv=eval('document.layers["sponsorAdDiv"]');
        else if(w3)        adDiv=eval('document.getElementById("sponsorAdDiv").style');
        randAd=Math.ceil(Math.random()*chanceAd);
        if (ie||w3)
        adDiv.visibility="visible";
        else
        adDiv.visibility ="show";
        if(randAd==1) showAd();
}
function showAd(){
if(adCount<adTime*10){adCount+=1;
        if (ie){documentWidth  =document.body.offsetWidth/2+document.body.scrollLeft-20;
        documentHeight =document.body.offsetHeight/2+document.body.scrollTop-20;}
        else if (ns){documentWidth=window.innerWidth/2+window.pageXOffset-20;
        documentHeight=window.innerHeight/2+window.pageYOffset-20;}
        else if (w3){documentWidth=self.innerWidth/2+window.pageXOffset-20;
        documentHeight=self.innerHeight/2+window.pageYOffset-20;}
        adDiv.left=documentWidth-100;adDiv.top =documentHeight-0;
        setTimeout("showAd()",100);}
}
function closeAd(){
if (ie||w3)
adDiv.display="none";
else
adDiv.visibility ="hide";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk"></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="sponsorAdDiv" style="visibility:hidden; left: 22px; top: 118px; width: 197px; height: 10px"> 
  <table width="200" height="25" bgcolor="#0099cc" border=0 cellspacing=0>
    <tr> 
      <td> 
        <table width="100%" height="100%"  border=0 cellpadding="0" cellspacing=0>
          <tr bgcolor="#d2e9fe"> 
            <td> &nbsp;&nbsp;&nbsp;&nbsp;正在上传图片，请稍候...... </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div> 
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><form method="post" action="uploadfiles.asp" enctype="multipart/form-data" name="form2" onsubmit="initAd();">
      <div align="center">文件：
          <input type=file name="sf_upfile" size="18" class=text>
          <input type="submit" name="submit" value="上传" class="text">
        </div>
    </form></td>
  </tr>
</table>
</body></html>