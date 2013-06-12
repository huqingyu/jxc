<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>视频播放</title>
<SCRIPT language=JavaScript>
<!--
          function killErrors() {
            return true;
          }
          window.onerror = killErrors;
		  
	function nosta(){
		window.status="";
		return true;
	}
	document.onmouseover=nosta;
	document.onmouseout=nosta;
    document.oncontextmenu = new Function("return false;") 
	document.ondragstart = new Function("return false;")   
	document.onselectstart = new Function("return false;") 

// -->
</SCRIPT>
<SCRIPT language=javascript defer>
var volv=phx.settings.volume;
setInterval("if(phx.playState==3){disp.innerText=phx.controls.currentPositionString+'|'+phx.currentMedia.durationString}",1000);
setInterval("if(phx.playState==3){itcn.style.width=parseInt(245*(phx.controls.currentPosition/phx.currentMedia.duration))}",1000);
function volup(){
if (volv<100){
volv+=5;
phx.settings.volume=volv;
disp.innerText=volv;}
else{disp.innerText='最大';}
}
function voldown(){
if (volv>0){
volv-=5;
phx.settings.volume=volv;
disp.innerText=volv;}
else{disp.innerText='最小';}
}
</SCRIPT>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>

<body>
<%
dz = Request.QueryString("dz") 
if dz="" then
dz="8.wmv"
end if 
%>
<table width="216" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
              
              <tr>
                <td width="326" align="center"><TABLE WIDTH=216 BORDER=0 CELLPADDING=0 CELLSPACING=0>
                    <tr>
                      <TD COLSPAN=7><IMG SRC="images/vod_1.png" WIDTH=216 HEIGHT=11 ALT=""></td>
                    </tr>
                    <tr>
                      <td><IMG SRC="images/vod_2.png" WIDTH=12 HEIGHT=152 ALT=""></td>
                      <TD width="193" height="152" COLSPAN=5 align="center" background="images/vod_3.png"><object id="phx" height="152" width="193" 
            classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6">
                        <param name="URL" value="http://lywww.com/06ly/wmv/<% Response.Write(dz) %>" />
                        <param name="rate" value="1" />
                        <param name="balance" value="0" />
                        <param name="currentPosition" value="0" />
                        <param name="defaultFrame" value="" />
                        <param name="playCount" value="1" />
                        <param name="ShowControls" value="false" />
                        <param name="autoStart" value="true" />
                        <param name="currentMarker" value="0" />
                        <param name="invokeURLs" value="-1" />
                        <param name="volume" value="50" />
                        <param name="mute" value="0" />
                        <param name="stretchToFit" value="0" />
                        <param name="windowlessVideo" value="0" />
                        <param name="enabled" value="-1" />
                        <param name="enableContextMenu" value="false" />
                        <param name="fullScreen" value="0" />
                        <param name="enableErrorDialogs" value="0" />
                        <param name="ShowStatusBar" value="false" />
                        <param name="AutoSize" value="0" />
                        <param name="uiMode" value="none" />
                      </object></td>
                      <td><IMG SRC="images/vod_4.png" WIDTH=11 HEIGHT=152 ALT=""></td>
                    </tr>
                    <tr>
                      <TD COLSPAN=7><IMG SRC="images/vod_5.png" WIDTH=216 HEIGHT=11 ALT=""></td>
                    </tr>
                    <tr>
                      <TD COLSPAN=2><IMG SRC="images/vod_6.png" WIDTH=16 HEIGHT=21 ALT=""></td>
                      <td><IMG SRC="images/vod_7.png" WIDTH=25 HEIGHT=21 ALT="" style="CURSOR: hand" 
      onclick="phx.controls.play();disp.innerText='播放&nbsp;';"></td>
                      <td><IMG SRC="images/vod_8.png" WIDTH=12 HEIGHT=21 ALT=""></td>
                      <td><IMG SRC="images/vod_9.png" WIDTH=25 HEIGHT=21 ALT="" style="CURSOR: hand" 
      onclick="phx.controls.pause();disp.innerText='暂停&nbsp;';"></td>
                      <TD COLSPAN=2><IMG SRC="images/vod_10.png" WIDTH=138 HEIGHT=21 ALT=""></td>
                    </tr>
                    <tr>
                      <TD COLSPAN=7><IMG SRC="images/vod_11.png" WIDTH=216 HEIGHT=9 ALT=""></td>
                    </tr>
                    <tr>
                      <td><IMG SRC="images/spacer.gif" WIDTH=12 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=4 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=25 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=12 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=25 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=127 HEIGHT=1 ALT=""></td>
                      <td><IMG SRC="images/spacer.gif" WIDTH=11 HEIGHT=1 ALT=""></td>
                    </tr>
                  </TABLE></td>
              </tr>
              <tr>
                <td align="center">
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CC0000">
                  <tr>
                    <td height="23" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=7.wmv"><font color="#FF0000">《中国临沂》- 您现在的位置:</font></a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=1.wmv">《走遍中国》-沂蒙山小调</a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=2.wmv">《走遍中国》-费县奇石-钻石传奇</a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=3.wmv">《走遍中国》-书圣出临沂</a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=4.wmv">《走遍中国》-沂沭春秋</a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=5.wmv">《走遍中国》-银雀山之迷</a></td>
                  </tr>
                  <tr>
                    <td height="19" bgcolor="#FF6600"> &nbsp;&nbsp; <a href="video.asp?dz=6.wmv">《走遍中国》-古墓之迷</a></td>
                  </tr>
                </table></td>
              </tr>
</table>
</body>
</html>
