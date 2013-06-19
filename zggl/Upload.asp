<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert(' 您现在的位置:还没有登录,请登录！');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert(' 您现在的位置:！');history.go(-1);</script>"
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<SCRIPT LANGUAGE="JavaScript">
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
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="sponsorAdDiv" style="visibility:hidden; left: 22px; top: 118px; width: 197px; height: 10px"> 
  <table width="200" height="25" bgcolor="#0099cc" border=0 cellspacing=0>
    <tr> 
      <td> 
        <table width="100%" height="100%"  border=0 cellpadding="0" cellspacing=0>
          <tr bgcolor="#d2e9fe"> 
            <td> &nbsp;&nbsp;&nbsp;&nbsp; 您现在的位置:请稍候...... </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div> 
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><form method="post" action="admin/uploadfiles.asp" enctype="multipart/form-data" name="form2" onsubmit="initAd();">
      <div align="center">文件：
          <input type=file name="sf_upfile" size="18" class=text>
          <input type="submit" name="submit" value="上传" class="text">
        </div>
    </form></td>
  </tr>
</table>
</body></html>