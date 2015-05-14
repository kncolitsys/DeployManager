<cfoutput>
<cfcontent reset="true"><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
<head>
<title>DeployManager - Build Management Tool</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link rel="stylesheet" href="layouts/default/form.css" type="text/css" />
<link rel="stylesheet" href="layouts/default/styles.css" type="text/css" />
<style type="text/css">
      @import "/styles/form.import.css";
</style>
</head>
<body>

<cfoutput>
<div class="topLinks">
	<ul>
		<li><a href="##">Login</a></li>
		<li><a href="##">Settings</a></li>
		<li><a href="##">Help/Guide</a></li>
		<li class="last"><a href="##">About DeployManager</a></li>
	</ul>
</div>
</cfoutput>

<div id="header">#trim(headerContent)#</div>

<div id="tabs">
  <ul>
    <li><a href="#myself#c.main" title="Dashboard"><span>Dashboard</span></a></li>
    <li><a href="#myself#c.projectList" title="Projects"><span>Projects</span></a></li>
    <li><a href="#myself#c.buildList" title="Builds"><span>Builds</span></a></li>  
  </ul>
</div>

<div id="content">
	#trim(pageContent)#
</div>

<cfparam name="showSidebar" default="true">
<cfif showSidebar>
<div id="menu">
	#trim(menuContent)#	
</div>
</cfif>

<div id="footer">
	DeployManager - Biuld Manager
</div>

</body>
</html>
</cfoutput>

<cfdump var="#attributes#">
