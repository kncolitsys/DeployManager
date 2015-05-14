<cfcomponent output="false">
	<cfset this.name 				= "deploymanager" />
	<cfset this.applicationTimeout 	= createTimeSpan(0,0,1,0) />
	<cfset this.clientManagement 	= true />
	<cfset this.clientStorage 		= "cookie" />
	<cfset this.loginStorage 		= "session" />
	<cfset this.sessionManagement 	= true />
	<cfset this.sessionTimeout 		= createTimeSpan(0,0,20,0) />
	<cfset this.setClientCookies 	= true />
	<cfset this.setDomainCookies 	= false />
	<cfset this.scriptProtect 		= false />
	
<cffunction name="onApplicationStart" returnType="boolean" output="false">
	<cfscript>
	// set the site settings
		application.isDevDebug = 0;
		
	//Initilized cfcs to the application scope 
		//application.reactor = createObject("component", "reactor.reactorFactory").init(expandPath("config/reactor.xml"));
	// END|| Initilized cfc to the application scope 		
	
	// set up the server variables and paths
		if (cgi.HTTP_HOST contains 'localhost'){
			application.siteRoot	= "D:\wwwroot\deploymanager";		
			application.siteURL		= 'http://192.168.2.120/deploymanager';	}
		else{
			application.siteRoot	= "D:\wwwroot\deploymanager";
			application.siteURL		= 'http://192.168.2.120/deploymanager';	
		}
	</cfscript>
	<cfreturn true>
</cffunction>

<cffunction name="onApplicationEnd" returnType="void" output="false">
	<cfargument name="applicationScope" required="true">
</cffunction>

<cffunction name="onRequestStart" returnType="boolean" output="false">
	<cfargument name="thePage" type="string" required="true">
<!--- reinit the application  --->
	<cfsilent>
		<cfif right(cgi.script_name, len("index.cfm")) neq "index.cfm" and right(cgi.script_name, 3) neq "cfc">
			<cflocation url="index.cfm" addtoken="no" />
		</cfif>
		<cfif structKeyExists(url, "reinit")>
			<cfset onApplicationStart()>
		</cfif>
	</cfsilent>
<cfreturn true>
</cffunction>

<cffunction name="onRequest" returnType="void">
	<cfargument name="thePage" type="string" required="true">
	<cfinclude template="#arguments.thePage#">
</cffunction>

<cffunction name="onRequestEnd" returnType="void" output="false">
	<cfargument name="thePage" type="string" required="true">
</cffunction>

<cffunction name="onError" returnType="void" output="false">
	<cfargument name="exception" required="true">
	<cfargument name="eventname" type="string" required="true">
</cffunction>

<cffunction name="onSessionStart" returnType="void" output="false">

</cffunction>

<cffunction name="onSessionEnd" returnType="void" output="false">
	<cfargument name="sessionScope" type="struct" required="true">
	<cfargument name="appScope" type="struct" required="false">
</cffunction>

</cfcomponent>