<cfcomponent name="builds" displayName="Builds" hint="Handles DAO for builds." output="true">

	
	<cffunction name="init" returntype="builds" access="public" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getLatestBuild" access="public" returntype="query" output="false">
		<cfargument name="projectID" required="true" hint="ID of the project to get the latest build info.">
		
		<cfquery name="qryLatestBuild" datasource="#application.dsn#">
			SELECT 	Max(builddate) AS builddate
			FROM	builds
			WHERE	projectid = #arguments.projectID#
		</cfquery>
		<cfreturn qryLatestBuild>
	</cffunction>

	<cffunction name="getbuildsList" access="public" returntype="query">
		<cfargument name="Orderby" default="buildDate" required="no" type="string">
		<cfargument name="Sort" default="Desc" required="no" type="string">
		
		<cfquery name="qGetbuilds" datasource="#application.dsn#">
			SELECT     builds.buildid,builds.active_yn,builds.builddate,builds.result,builds.version,projects.name
			FROM 		builds, projects
			WHERE     (builds.Active_YN = 1)
			AND		(builds.projectid = projects.projectid)
			ORDER BY  #arguments.Orderby# #arguments.Sort#
		</cfquery>
		
		<cfreturn qGetbuilds>
	</cffunction>

	<cffunction name="getbuilds">
		<cfargument name="buildid" default="0">
	
		<cfquery name="qGetbuilds" datasource="#application.dsn#">
			SELECT     *
			FROM         builds 
			WHERE buildid =#arguments.buildid#
		</cfquery>
		
		<cfreturn qGetbuilds>
	</cffunction>
	
	
	<cffunction name="deletebuilds">
		<cfargument name="buildid" default="0">
		<cfquery name="qDeletebuilds" datasource="#application.dsn#">
			UPDATE     builds
			SET        Active_YN = 0
			WHERE buildid = #arguments.buildid#
		</cfquery>
		<cfreturn true>
	</cffunction>
	
	
	 <cffunction name="addbuilds" access="public">
		<cfargument name="Active_YN" required="no" default="0">	
		<cfargument name="projectid" required="no">
		<cfargument name="version" required="no">
		<cfargument name="builddate" required="no">
		<cfargument name="result" required="no">
		
		<cftransaction>
				<cfquery name="addbuilds"  datasource="#application.dsn#">
				INSERT INTO builds
				 ( 
			<cfif isdefined("arguments.projectid")>projectid,</cfif>
			<cfif isdefined("arguments.version")>version,</cfif>
			<cfif isdefined("arguments.builddate")>builddate,</cfif>
			<cfif isdefined("arguments.result")>result,</cfif>

				Active_YN
				)
				VALUES
				(
			<cfif isdefined("arguments.projectid")>#projectid#,</cfif>
			<cfif isdefined("arguments.version")>'#version#',</cfif>
			<cfif isdefined("arguments.builddate")>#builddate#,</cfif>
			<cfif isdefined("arguments.result")>#result#,</cfif>

				#arguments.Active_YN#
				)
			</cfquery>
			
			<cfquery name="getMax_buildid"  datasource="#application.dsn#" maxrows="1">
				select max(buildid) as max_buildid from builds
			</cfquery>
		</cftransaction>
		
		<cfreturn getMax_buildid.max_buildid>
	</cffunction> 


	 <cffunction name="updatebuilds" access="public">
		<cfargument name="buildid" required="yes" type="numeric">
		<cfargument name="projectid" required="no">
		<cfargument name="version" required="no">
		<cfargument name="builddate" required="no">
		<cfargument name="result" required="no">
		<cfargument name="active_yn" required="no">

		<cfquery  name="updatebuilds" datasource="#application.dsn#">
				UPDATE builds
				SET 
				<cfif isdefined("arguments.projectid")>projectid=#projectid#,</cfif>
				<cfif isdefined("arguments.version")>version='#version#',</cfif>
				<cfif isdefined("arguments.builddate")>builddate='#builddate#',</cfif>
				<cfif isdefined("arguments.result")>result=#result#,</cfif>
				<cfif isdefined("arguments.active_yn")>active_yn=#active_yn#,</cfif>

				RecordDate=RecordDate
				WHERE buildid=#arguments.buildid#
		</cfquery> 

		<cfreturn true>
	</cffunction>
	
	<cffunction name="buildProject" access="public" returntype="string" output="true"
				 hint="Calls Ant and passes the build file as an argument to create the build.">
		<cfargument name="projectId" required="true">
		<cfargument name="qGetProjects" type="query" required="true">
		 
	 	<!--- build the command line call and execute it --->
	 	<cfset antOutput = "">
	 	<cfset antCommand = "ant">
	 	<cfset command = "">
		<cfset command = command & " -v -f " & arguments.qGetProjects.buildFile>
		<cfset command = command & " -l " & arguments.qGetProjects.logFile>
		<cfset command = command & " -Dproject.name=" & arguments.qGetProjects.name>
		<cfset command = command & " -DbaseVersion=" & arguments.qGetProjects.baseVersion>
		<cfset command = command & " -Dproject.buildRoot=" & arguments.qGetProjects.buildRoot>
		<cfset command = command & " -DdeploymentRoot=" & arguments.qGetProjects.deploymentRoot>
		<cfset command = command & " -DdeploymentPath=" & arguments.qGetProjects.deploymentPath>
		<cfset command = command & " -Dsvn.rooturl=" & arguments.qGetProjects.svnRootUrl>
		<cfset command = command & " -Dsvn.username=" & arguments.qGetProjects.svnUsername>
		<cfset command = command & " -Dsvn.password=" & arguments.qGetProjects.svnPassword>
		<cfset command = command & " -Dsvn.projecturl=" & arguments.qGetProjects.svnProjectUrl>
		<cfset command = command & " -Dsvn.tagurl=" & arguments.qGetProjects.svnTagUrl>
		
		<cfexecute name="d:\ant\bin\ant.bat" arguments="#command#" outputfile="#arguments.qGetProjects.deploymentPath#_cfout" >
		</cfexecute>
		
		<cfinvoke component="#this#" method="addbuilds">
			<cfinvokeargument name="projectId" value="#arguments.qGetProjects.projectID#" />
			<cfinvokeargument name="active_yn" value="1" />
			<cfinvokeargument name="version" value="#arguments.qGetProjects.baseVersion#" />
			
		</cfinvoke>
		
		<cfreturn command>
	</cffunction>
</cfcomponent>