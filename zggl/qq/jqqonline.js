document.writeln("<script>");
document.writeln("function loadLink(){");
document.writeln("    var linkURL='linkTop.ashx?top=9&timeStamp='+new Date().getTime();");
document.writeln("    AjaxDiv('Link_Content',linkURL,function(){");
document.writeln("        $('#Link_Content a img').hover(function(){");
document.writeln("            $(this).css('border-color','Red');");
document.writeln("        },function(){");
document.writeln("            $(this).css('border-color','000');");
document.writeln("        })");
document.writeln("    })");
document.writeln("}");
document.writeln("$(document).ready(function(){");
document.writeln("    loadLink();");
document.writeln("})");
document.writeln("<\/script>");
document.writeln("<DIV id=divStayTopleft style='POSITION: absolute'>");
document.writeln("<TABLE cellSpacing=0 cellPadding=0 width=120 border=0>");
document.writeln("  <TR>");
document.writeln("    <TD style='PADDING-LEFT: 28px' vAlign=top>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("        <TR>");
document.writeln("          <TD><img height=52 src='\/QQ\/quick_top.gif' width='85' /><\/TD><\/TR><\/TABLE>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("        ");
document.writeln("        <TR>");
document.writeln("          <TD vAlign=top background=\/QQ\/quick.gif>");
document.writeln("            <DIV align=center><\/DIV>");
document.writeln("            <TABLE cellSpacing=0 cellPadding=0 width='96%' border=0>");
document.writeln("              ");
document.writeln("              <TR>");
document.writeln("                <TD>");
document.writeln("                  <DIV align=center>");
document.writeln("                  <TABLE height=10 cellSpacing=0 cellPadding=0 width='100%' ");
document.writeln("                  border=0>");
document.writeln("                    ");
document.writeln("                    <TR>");
document.writeln("                      <TD><\/TD><\/TR><\/TABLE><A ");
document.writeln("                  href='http:\/\/wpa.qq.com\/msgrd?V=1&amp;Uin=1037053885&amp;Site=���ü���&amp;Menu=yes' ");
document.writeln("                  target=_blank><IMG alt=����QQ��ѯ ");
document.writeln("                  src='\/QQ\/qq1.gif' width=30 ");
document.writeln("                  border=0><\/A><BR><\/DIV><\/TD><\/TR><\/TABLE>");
document.writeln("            <TABLE cellSpacing=0 cellPadding=0 width='96%' align=center ");
document.writeln("border=0>");
document.writeln("              <TR>");
document.writeln("                <TD>");
document.writeln("                  <DIV ");
document.writeln("      align=center><\/DIV><\/TD><\/TR><\/TABLE><\/TD><\/TR><\/TABLE>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("        <TR>");
document.writeln("          <TD vAlign=top background=\/QQ\/quick.gif>");
document.writeln("            <DIV align=center><\/DIV>");
document.writeln("            <TABLE cellSpacing=0 cellPadding=0 width='96%' border=0>");
document.writeln("              <TR>");
document.writeln("                <TD>");
document.writeln("                  <DIV align=center>");
document.writeln("                  <TABLE height=10 cellSpacing=0 cellPadding=0 width='100%' ");
document.writeln("                  border=0>");
document.writeln("                    <TR>");
document.writeln("                      <TD><\/TD><\/TR><\/TABLE><FONT ");
document.writeln("                  color=red>��ѯ����<BR>65852351<BR>65852305<\/FONT><\/DIV><\/TD><\/TR><\/TABLE>");
document.writeln("            <TABLE cellSpacing=0 cellPadding=0 width='96%' align=center ");
document.writeln("border=0>");
document.writeln("              <TR>");
document.writeln("                <TD>");
document.writeln("                  <DIV ");
document.writeln("      align=center><\/DIV><\/TD><\/TR><\/TABLE><\/TD><\/TR><\/TABLE>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("        <TR>");
document.writeln("          <TD><IMG height=14 src='\/QQ\/quick_fl.gif' ");
document.writeln("            width=85><\/TD><\/TR><\/TABLE>");
document.writeln("      <TABLE height=6 cellSpacing=0 cellPadding=0 width='100%' border=0>");
document.writeln("        ");
document.writeln("        <TR>");
document.writeln("          <TD><\/TD><\/TR><\/TABLE><!-- --><\/TD><\/TR><\/TABLE><\/DIV>");
document.writeln("<SCRIPT language=javascript>");
document.writeln("function picsize(obj,MaxWidth){");
document.writeln("  img=new Image();");
document.writeln("  img.src=obj.src;");
document.writeln("  if (img.width>MaxWidth)");
document.writeln("  {");
document.writeln("    return MaxWidth;");
document.writeln("  }");
document.writeln("  else");
document.writeln("  {");
document.writeln("    return img.width;");
document.writeln("  }");
document.writeln("}");
document.writeln("function CloseQQ()");
document.writeln("{");
document.writeln("	divStayTopleft.style.display='none';");
document.writeln("}");
document.writeln("var online= new Array();");
document.writeln("<\/SCRIPT>");
document.writeln("");
document.writeln("<DIV id=divStay style='POSITION: absolute'>");
document.writeln("<TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("  ");
document.writeln("  <TR>");
document.writeln("    <TD><IMG height=52 src='\/QQ\/quick_top.gif' ");
document.writeln("    width=85><\/TD><\/TR><\/TABLE>");
document.writeln("<TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("  ");
document.writeln("  <TR>");
document.writeln("    <TD vAlign=top background=\/QQ\/quick.gif>");
document.writeln("      <DIV align=center><\/DIV>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width='96%' border=0>");
document.writeln("        ");
document.writeln("        <TR>");
document.writeln("          <TD>");
document.writeln("            <DIV align=center>");
document.writeln("            <TABLE height=10 cellSpacing=0 cellPadding=0 width='100%' ");
document.writeln("              border=0>");
document.writeln("              <TR>");
document.writeln("                <TD><\/TD><\/TR><\/TABLE><A ");
document.writeln("            href='http:\/\/wpa.qq.com\/msgrd?V=1&amp;Uin=1037053885&amp;Site=���ü���&amp;Menu=yes' ");
document.writeln("            target=_blank><IMG alt=����QQ��ѯ ");
document.writeln("            src='\/QQ\/qq1.gif' width=30 border=0><\/A> ");
document.writeln("            <\/DIV><\/TD><\/TR><\/TABLE>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width='96%' align=center border=0>");
document.writeln("        ");
document.writeln("        <TR>");
document.writeln("          <TD>");
document.writeln("            <DIV align=center><\/DIV><\/TD><\/TR><\/TABLE><\/TD><\/TR><\/TABLE>");
document.writeln("<TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("  ");
document.writeln("  <TR>");
document.writeln("    <TD vAlign=top background=\/QQ\/quick.gif>");
document.writeln("      <DIV align=center><\/DIV>");
document.writeln("      <TABLE cellSpacing=0 cellPadding=0 width='96%' border=0>");
document.writeln("        ");
document.writeln("        <TR>");
document.writeln("          <TD>");
document.writeln("            <DIV align=center>");
document.writeln("            <TABLE height=10 cellSpacing=0 cellPadding=0 width='100%' ");
document.writeln("              border=0>");
document.writeln("              <TR>");
document.writeln("                <TD><\/TD><\/TR><\/TABLE><FONT ");
document.writeln("            color=red>��ѯ����<BR>65852305<BR>65852351<\/FONT><\/DIV><\/TD><\/TR><\/TABLE><\/TD><\/TR><\/TABLE>");
document.writeln("<TABLE cellSpacing=0 cellPadding=0 width=85 border=0>");
document.writeln("  <TR>");
document.writeln("    <TD><IMG height=14 src='\/QQ\/quick_fl.gif' ");
document.writeln("    width=85><\/TD><\/TR><\/TABLE>");
document.writeln("<TABLE height=6 cellSpacing=0 cellPadding=0 width='100%' border=0>");
document.writeln("  ");
document.writeln("  <TR>");
document.writeln("    <TD><\/TD><\/TR><\/TABLE><\/DIV>");
document.writeln("<SCRIPT type=text\/javascript>");
document.writeln("function FloatTop()");
document.writeln("{");
document.writeln("	 var startX1 =document.body.offsetWidth-134 ,startY1 = 200;");
document.writeln("	 var startX2 =0,startY2 = 200;");
document.writeln("	 var ns = (navigator.appName.indexOf('Netscape') != -1);");
document.writeln("	 var d = document;");
document.writeln("	 function ml(id,startX,startY)");
document.writeln("	 {");
document.writeln("		  var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];");
document.writeln("		  if(d.layers)el.style=el;");
document.writeln("		  el.sP=function(x,y){this.style.left=x;this.style.top=y;};");
document.writeln("		  el.x = startX;");
document.writeln("		  el.y = startY;");
document.writeln("		  return el;");
document.writeln("	 }");
document.writeln("	 window.stayTopLeft=function()");
document.writeln("	 {");
document.writeln("		  var pY = ns ? pageYOffset : document.body.scrollTop;");
document.writeln("		  ftlObj.y += (pY + startY1 - ftlObj.y)\/8;");
document.writeln("		  ftlObj1.y += (pY + startY2 - ftlObj1.y)\/8;");
document.writeln("		  ftlObj.sP(document.body.scrollLeft+document.body.offsetWidth-134, ftlObj.y);");
document.writeln("		  ftlObj1.sP(ftlObj1.x, ftlObj1.y);");
document.writeln("		  setTimeout('stayTopLeft()', 30);");
document.writeln("	 }");
document.writeln("	 ftlObj = ml('divStay',document.body.scrollLeft+document.body.offsetWidth-134,30);");
document.writeln("	 ftlObj1 = ml('divStayTopLeft',-15,30);");
document.writeln("	 stayTopLeft();");
document.writeln("}");
document.writeln("FloatTop();");
document.writeln("<\/SCRIPT>");