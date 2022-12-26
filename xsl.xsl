<xsl>
<!-- Корневое  правило -->
<rule>
    <root/>      
    <HTML><HEAD>    <!-- Область сценария-->   
       <SCRIPT LANGUAGE="JSCRIPT"><![CDATA[
var ie4=((navigator.appName=="Microsoft Internet Explorer")&&(parseInt(navigator.appVersion)  >= 4 ));
       function msover(){
if (ie4){
  		event.srcElement.style.color="red";
  		event.srcElement.style.cursor = "hand";
  	}
}
       function msout(){
	if (ie4){
  		event.srcElement.style.color="black";
  		event.srcElement.style.cursor = "auto";
  	}
}        ]]></SCRIPT>
    </HEAD>
    <BODY bgcolor="white">
    <center>
    <table width="80%" border="1">
    <children/>  		
    </table></center>
    </BODY>
    </HTML>	   
</rule>
<!--   Использование элемента select-elements -->
  <rule>
    <target-element type="journal"/>
      <select-elements> <target-element type="title"/> </select-elements>,
      <select-elements> <target-element type="contacts"/> </select-elements>,
      <select-elements> <target-element type="issues-list"/> </select-elements>,
      <select-elements> <target-element type="authors-list"/> </select-elements>.
  </rule>
<!-- Formatting title element -->
<rule>
 	 <element type="journal">
	    <target-element type="title"/>
		<!--  Элемент title должен определяться внутри элемента journal   -->
         </element>
        <tr><td align="center"><center>
	<table width="80%" border="1"><tr><td width="100%">
	<b><font color="blue">
	<children/>
	</font></b></td></tr>
	</table></center>
        </td></tr>
</rule>
<!-- Issues list -->
<rule>
<element type="journal">
		<target-element type="issues-list"/>
</element>
        <tr><td align="center">
	<children/>
	</td></tr>
</rule>
<rule>
	<element type="issues-list">
		<target-element type="issue"/>
        </element>
        <tr><td><center>
        <table width="100%" border="0">
	<tr><td colspan="2" bgcolor="gray">
	<font color="white">Issues list</font></td></tr>
	<children/>
	<tr><td> </td></tr></table></center></td></tr>
</rule>
<rule>
	<target-element type="issue"/>
        <tr><td>
        <table width="100%" border="0">
	<tr><td colspan="2">Issue number
	<b><eval>childNumber(this);</eval></b></td></tr>
	<children/>
	<tr><td> </td></tr></table></td></tr>
</rule>
<rule>
	<element type="issue">
		<target-element type="title"/>
		<target-element type="date"/>
		<target-element type="about"/>
		<target-element type="home-url"/>
        </element>
        <tr>
	<td width="40%"><font color="blue"><eval>tagName</eval></font></td>
	<td width="60%" align="right"><div align="right"><b><font color="red">
	<children/></font></b>
	</div></td></tr>
</rule>
<rule>
	<element type="issue">
		<target-element type="articles"/>
        </element>
        <tr><td colspan="2" align="right" bgcolor="silver">
	<center>Articles list</center></td></tr>
        <children/>
</rule>
<rule>
	<element type="articles">
		<target-element type="article"/>
        </element>
        <tr><td colspan="2" align="right">Article number
	<b><eval>childNumber(this);</eval></b></td></tr>
        <children/>
</rule>
<rule>
	<element type="article">
		<target-element type="title"/>
		<target-element type="url"/>
		<target-element type="author"/>
        </element>
        <tr>
	<td width="40%"><font color="maroon"><eval>tagName</eval></font></td>
	<td width="60%" align="right"><div align="right"><b><font color="red">
	<children/></font></b>
	</div></td></tr>
</rule>
<rule>
	<target-element type="article" position="last-of-type"/>
	<children/>
        <tr><td colspan="2" bgcolor="silver" width="100%"> </td></tr>
</rule>
<rule>
	<element type="hotkeys">
		<target-element type="hotkey"/>
        </element>
        <tr>
	<td width="40%"><font color="maroon"><eval>tagName</eval></font></td>
	<td width="60%" align="right"><div align="right"><b><font color="red">
	<children/></font></b>
	</div></td></tr>
</rule>
<!-- Contacts -->
<rule>
	<element type="journal">
	<target-element type="contacts"/>
	<select-elements> <target-element type="address"/> </select-elements>,
	<select-elements> <target-element type="tel"/> </select-elements>,
	<select-elements> <target-element type="email"/> </select-elements>,
	<select-elements> <target-element type="url"/> </select-elements>.
        </element>
        <tr><td><center><table width="100%" border="1">
	<tr><td colspan="2" bgcolor="gray"><font color="white">Contact us:</font></td></tr>
	<children/>
	<tr><td> </td></tr></table></center></td></tr>
</rule>
<rule>
	<element type="contacts">
		<target-element type="address"/>
		<target-element type="tel"/>
		<target-element type="email"/>
		<target-element type="url"/>
        </element>
        <tr>
	<td width="40%"><font color="blue"><eval>tagName</eval></font></td>
	<td width="60%" align="right"><div align="right"><b><font color="red">
	<children/></font></b>
	</div></td></tr>
</rule>
<!-- Authors -->
<rule>
	<element type="journal">
		<target-element type="authors-list"/>
        </element>
       	<tr><td bgcolor="gray"><font color="white">Authors list</font></td></tr>
	<tr><td>
        <children/>
	</td></tr>
</rule>
<rule>
	<element type="authors-list">
		<target-element type="author"/>
	<select-elements> <target-element type="firstname"/> </select-elements>,
	<select-elements> <target-element type="lastname"/> </select-elements>,
	<select-elements> <target-element type="email"/> </select-elements>.
        </element>
        <table width="100%" border="1">
	<tr><td colspan="2">Author index  <b><eval>getAttribute("ID");</eval></b></td></tr>
	<children/>
	<tr><td> </td></tr></table>
</rule>
<rule>
	<element type="author">
      <attribute name="ID" has-value="yes"/>
		<target-element type="firstname"/>
		<target-element type="lastname"/>
		<target-element type="email"/>
        </element>
        <tr>
	<td width="40%"><font color="blue"><eval>tagName</eval></font></td>
	<td width="60%" align="right"><b><font color="black">
<!--  Подсветка элементов   --> 
            <DIV id='=tagName + formatNumber(childNumber(this),"1")' background-color="marron"
	  onmouseover='="msover("+ tagName + formatNumber(childNumber(this),1)+")"'
	  onmouseout='="msout("+ tagName + formatNumber(childNumber(this),1)+")"'>
	<children/>
	</DIV>
	</font></b>
	</td></tr>
</rule>
<!-- Определение стиля. Изменение стиля комнется всех элементов title и url,
	 вне зависимости от их месторасположения -->	
  <style-rule>  
    <target-element type="title"/>
    <target-element type="url"/>
    <apply font-style="italic" color="maroon"/>
  </style-rule>
</xsl>
