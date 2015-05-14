<circuit access="public">

	<fuseaction name="main">
		<set name="showSidebar" value="false"/>
		<do action="v.welcome" contentvariable="pageContent" />
	</fuseaction>
	
	<fuseaction name="projectList">
		<set name="showSidebar" value="true"/>
		<xfa name="deleteProject" value="c.deleteProject"/>
		<invoke object="application.projects" methodCall="getProjectsList()" returnVariable="qGetprojects" />
		<do action="v.projectList" contentVariable="pageContent"/>
	</fuseaction>
	
	<fuseaction name="newProject">
		<set name="showSidebar" value="false"/>
		<xfa name="frmSubmit" value="c.saveProject"/>
		<set name="attributes.projectID" value="0"/>

		<invoke object="application.projects" method="getProjects" returnvariable="qGetProjects">
			<argument name="projectID" value="#attributes.projectID#"/>
		</invoke>
		<do action="v.newProject" contentvariable="pageContent" />
	</fuseaction>
	
	<fuseaction name="editProject">
		<set name="showSidebar" value="false"/>
		<xfa name="frmSubmit" value="c.updateProject"/>
		<set name="attributes.projectID" value="#attributes.projectid#"/>
		
		<invoke object="application.projects" method="getProjects" returnvariable="qGetprojects">
			<argument name="projectID" value="#attributes.projectID#"/>
		</invoke>
		<do action="v.newProject" contentvariable="pageContent" />
	</fuseaction>
	
	<fuseaction name="saveProject">
		<invoke object="application.projects" method="addProjects">
		    <argument name="name" value="#attributes.name#" />
		    <argument name="url" value="#attributes.url#" />
		    <argument name="buildfile" value="#attributes.buildfile#" />
			<argument name="logfile" value="#attributes.logfile#" />
			<argument name="baseVersion" value="#attributes.baseVersion#" />
			<argument name="svnRootURL" value="#attributes.svnRootURL#" />
			<argument name="svnProjectURL" value="#attributes.svnProjectURL#"/>
			<argument name="svnTagURL" value="#attributes.svnTagURL#"/>
			<argument name="svnUsername" value="#attributes.svnUsername#"/>
			<argument name="svnPassword" value="#attributes.svnPassword#"/>
			<argument name="createTag" value="#attributes.createTag#"/>
			<argument name="deploymentRoot" value="#attributes.deploymentRoot#"/>
			<argument name="deploymentPath" value="#attributes.deploymentPath#"/>
			<argument name="buildRoot" value="#attributes.buildRoot#" />
		</invoke>
		<relocate url="#myself#c.projectList" type="client" addToken="false"/>
	</fuseaction>
	
	<fuseaction name="updateProject">
		<invoke object="application.projects" method="updateProjects">
			<argument name="projectID" value="#attributes.projectID#"/>
		   	<argument name="name" value="#attributes.name#" />
		    <argument name="url" value="#attributes.url#" />
		    <argument name="buildfile" value="#attributes.buildfile#" />
			<argument name="logfile" value="#attributes.logfile#" />
			<argument name="baseVersion" value="#attributes.baseVersion#" />
			<argument name="svnRootURL" value="#attributes.svnRootURL#" />
			<argument name="svnProjectURL" value="#attributes.svnProjectURL#"/>
			<argument name="svnTagURL" value="#attributes.svnTagURL#"/>
			<argument name="svnUsername" value="#attributes.svnUsername#"/>
			<argument name="svnPassword" value="#attributes.svnPassword#"/>
			<argument name="createTag" value="#attributes.createTag#"/>
			<argument name="deploymentRoot" value="#attributes.deploymentRoot#"/>
			<argument name="deploymentPath" value="#attributes.deploymentPath#"/>
			<argument name="buildRoot" value="#attributes.buildRoot#" />
		</invoke>
		<relocate url="#myself#c.projectList" type="client" addToken="false"/>
	</fuseaction>
	
	<fuseaction name="deleteProject">
		<invoke object="application.projects" method="deleteProjects">
		    <argument name="projectid" value="#attributes.projectid#" />
		</invoke>
		<relocate url="#myself#c.projectList" type="client" addToken="false"/>
	</fuseaction>
	
	<fuseaction name="buildList">
		<set name="showSidebar" value="true"/>
		<invoke object="application.builds" methodcall="getBuildsList()" returnVariable="qGetbuilds" />
		<do action="v.buildList" contentVariable="pageContent" />
	</fuseaction>
	
	<fuseaction name="buildProject">
		<set name="showSidebar" value="false" />
		<invoke object="application.projects" method="getProjects" returnvariable="qGetprojects">
			<argument name="projectID" value="#attributes.projectID#"/>
		</invoke>
		<invoke object="application.builds" method="buildProject" returnvariable="command">
			<argument name="qGetprojects" value="#qGetprojects#"/>
			<argument name="projectID" value="#attributes.projectID#"/>
		</invoke>
		<do action="v.building" contentVariable="pageContent"/>
	</fuseaction>
	
</circuit>
