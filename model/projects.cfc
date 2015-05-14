<cfcomponent name="projects" displayname="projects" hint="Handles DAO's for projects.">

	<cffunction name="init" returntype="projects" access="public" output="false">
		<cfreturn this />
	</cffunction>

	<cffunction name="getprojectsList" access="public" returntype="query" hint="Returns a list of all Projects.">
		<cfargument name="Orderby" default="name" required="no" type="string">
		<cfargument name="Sort" default="Desc" required="no" type="string">
		<cftry>
		<cfquery name="qGetprojects" datasource="#application.dsn#">
			SELECT     *
			FROM projects
			WHERE     (projects.Active_YN = 1) 
			ORDER BY  #arguments.Orderby# #arguments.Sort#
		</cfquery>
		<cfcatch type="database"/>
		</cftry>
		<cfreturn qGetprojects>
	</cffunction>


	<cffunction name="getprojects" access="public" returntype="query" hint="Returns one record based on ID from Projects.">
		<cfargument name="projectid" default="0">
	
		<cfquery name="qGetprojects" datasource="#application.dsn#">
			SELECT     *
			FROM         projects 
			WHERE projectid =#arguments.projectid#
		</cfquery>
		
		<cfreturn qGetprojects>
	</cffunction>
	
	
	<cffunction name="deleteprojects" access="public" returntype="any" hint="Sets a project to inactive.">
		<cfargument name="projectid" default="0">
		<cfquery name="qDeleteprojects" datasource="#application.dsn#">
			UPDATE     projects
			SET        Active_YN = 0
			WHERE projectid = #arguments.projectid#
		</cfquery>
		<cfreturn true>
	</cffunction>
	
	
	<cffunction name="addprojects" access="public" returntype="any" hint="Saves a project to the database.">

		<cfargument name="Active_YN" required="no" default="1">	
		<cfargument name="name" required="no">
		<cfargument name="url" required="no">
		<cfargument name="buildfile" required="no">
		<cfargument name="logfile" required="no">
		<cfargument name="buildroot" required="no">
		<cfargument name="deploymentroot" required="no">
		<cfargument name="deploymentpath" required="no">
		<cfargument name="svnrooturl" required="no">
		<cfargument name="svnprojecturl" required="no">
		<cfargument name="svntagurl" required="no">
		<cfargument name="svnusername" required="no">
		<cfargument name="svnpassword" required="no">
		<cfargument name="baseversion" required="no">
		<cfargument name="createtag" required="no">

		
		<cftransaction>
			<cfquery name="addprojects"  datasource="#application.dsn#">
			INSERT INTO projects
			 ( 
			<cfif isdefined("arguments.name")>name,</cfif>
			<cfif isdefined("arguments.url")>url,</cfif>
			<cfif isdefined("arguments.buildfile")>buildfile,</cfif>
			<cfif isdefined("arguments.logfile")>logfile,</cfif>
			<cfif isdefined("arguments.buildroot")>buildroot,</cfif>
			<cfif isdefined("arguments.deploymentroot")>deploymentroot,</cfif>
			<cfif isdefined("arguments.deploymentpath")>deploymentpath,</cfif>
			<cfif isdefined("arguments.svnrooturl")>svnrooturl,</cfif>
			<cfif isdefined("arguments.svnprojecturl")>svnprojecturl,</cfif>
			<cfif isdefined("arguments.svntagurl")>svntagurl,</cfif>
			<cfif isdefined("arguments.svnusername")>svnusername,</cfif>
			<cfif isdefined("arguments.svnpassword")>svnpassword,</cfif>
			<cfif isdefined("arguments.baseversion")>baseversion,</cfif>
			<cfif isdefined("arguments.createtag")>createtag,</cfif>

				Active_YN
				)
				VALUES
				(
			<cfif isdefined("arguments.name")>'#name#',</cfif>
			<cfif isdefined("arguments.url")>'#url#',</cfif>
			<cfif isdefined("arguments.buildfile")>'#buildfile#',</cfif>
			<cfif isdefined("arguments.logfile")>'#logfile#',</cfif>
			<cfif isdefined("arguments.buildroot")>'#buildroot#',</cfif>
			<cfif isdefined("arguments.deploymentroot")>'#deploymentroot#',</cfif>
			<cfif isdefined("arguments.deploymentpath")>'#deploymentpath#',</cfif>
			<cfif isdefined("arguments.svnrooturl")>'#svnrooturl#',</cfif>
			<cfif isdefined("arguments.svnprojecturl")>'#svnprojecturl#',</cfif>
			<cfif isdefined("arguments.svntagurl")>'#svntagurl#',</cfif>
			<cfif isdefined("arguments.svnusername")>'#svnusername#',</cfif>
			<cfif isdefined("arguments.svnpassword")>'#svnpassword#',</cfif>
			<cfif isdefined("arguments.baseversion")>'#baseversion#',</cfif>
			<cfif isdefined("arguments.createtag")>#createtag#,</cfif>

				#arguments.Active_YN#
				)
			</cfquery>
			
			<cfquery name="getMax_projectid"  datasource="#application.dsn#" maxrows="1">
				select max(projectid) as max_projectid from projects
			</cfquery>
		</cftransaction>
		
		<cfreturn getMax_projectid.max_projectid>
	</cffunction> 


	<cffunction name="updateprojects" access="public" returntype="any" hint="Updates a project in the database.">
		<cfargument name="projectid" required="yes" type="numeric">
		<cfargument name="name" required="no">
		<cfargument name="url" required="no">
		<cfargument name="buildfile" required="no">
		<cfargument name="logfile" required="no">
		<cfargument name="buildroot" required="no">
		<cfargument name="deploymentroot" required="no">
		<cfargument name="deploymentpath" required="no">
		<cfargument name="svnrooturl" required="no">
		<cfargument name="svnprojecturl" required="no">
		<cfargument name="svntagurl" required="no">
		<cfargument name="svnusername" required="no">
		<cfargument name="svnpassword" required="no">
		<cfargument name="baseversion" required="no">
		<cfargument name="createtag" required="no">
		
		<cfquery  name="updateprojects" datasource="#application.dsn#">
			UPDATE projects
			SET 
			<cfif isdefined("arguments.name")>name='#name#',</cfif>
			<cfif isdefined("arguments.url")>url='#url#',</cfif>
			<cfif isdefined("arguments.buildfile")>buildfile='#buildfile#',</cfif>
			<cfif isdefined("arguments.logfile")>logfile='#logfile#',</cfif>
			<cfif isdefined("arguments.buildroot")>buildroot='#buildroot#',</cfif>
			<cfif isdefined("arguments.deploymentroot")>deploymentroot='#deploymentroot#',</cfif>
			<cfif isdefined("arguments.deploymentpath")>deploymentpath='#deploymentpath#',</cfif>
			<cfif isdefined("arguments.svnrooturl")>svnrooturl='#svnrooturl#',</cfif>
			<cfif isdefined("arguments.svnprojecturl")>svnprojecturl='#svnprojecturl#',</cfif>
			<cfif isdefined("arguments.svntagurl")>svntagurl='#svntagurl#',</cfif>
			<cfif isdefined("arguments.svnusername")>svnusername='#svnusername#',</cfif>
			<cfif isdefined("arguments.svnpassword")>svnpassword='#svnpassword#',</cfif>
			<cfif isdefined("arguments.baseversion")>baseversion='#baseversion#',</cfif>
			<cfif isdefined("arguments.createtag")>createtag=#createtag#</cfif>
			WHERE projectid= #arguments.projectid#
		</cfquery> 
	
	<cfreturn true>
	</cffunction> 
</cfcomponent>