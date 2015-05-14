<h1>Create New Project</h1>

<cfoutput>
<form name="CreateNewProject" action="#myself##xfa.frmSubmit#" method="post">
	<input type="hidden" name="projectId" value="#attributes.projectID#" id="projectID">
	<fieldset><legend>Project Properties</legend>
		<div class="notes">
			<h4>Project Info</h4>
			<p class="last">Basic project information.</p>
		</div>
		
		<div class="required">
			<label for="name">Project Name: </label>
			<input type="text" name="name" style="inputText" class="inputText" value="#qGetprojects.name#">
		</div>
		<div class="required">
			<label for="url">Project URL: </label>
			<input type="text" name="url" label="Project URL" class="inputText" value="#qGetProjects.url#">
		</div>
		<div class="required">	
			<label for="buildFile">Path To Buildfile: </label>
			<input type="text" name="buildfile" id="buildfile" class="inputText" value="#qGetProjects.buildfile#">
		</div>
		<div class="required">	
			<label for="url">Path To Logfile: </label>
			<input type="text" name="logfile"  id="logfile" class="inputText" value="#qGetProjects.logfile#">
		</div>
		<div class="required">	
			<label for="url">Base Version: </label>
			<input type="text" name="baseVersion" id="baseVersion" class="inputText" required="true" 
					message="You must enter a Base Version." value="#qGetProjects.baseVersion#">
		</div>
	</fieldset>
	
	<fieldset><legend>Subversion Properties</legend>
		<div class="notes">
			<h4>Subversion Info</h4>
			<p class="last">Antfarm connects to your subversion repository to pull the latest version
				of your code to create its builds.</p>
		</div>
		<div class="required">
			<label for="svnRootUrl">SVN Root URL: </label>
			<input type="text" name="svnRootUrl" id="svnRootUrl" class="inputText" value="#qGetProjects.svnRootURL#">
		</div>
		<div class="required">
			<label for="svnProjectUrl">SVN Project URL: </label>
			<input type="text" name="svnProjectUrl" id="svnProjectUrl" class="inputText" value="#qGetProjects.svnProjectURL#">
		</div>
		<div class="required">
			<label for="svnTagUrl">SVN Tag URL: </label>
			<input type="text" name="svnTagUrl" id="svnTagUrl" class="inputText" value="#qGetProjects.svnTagURL#">
		</div>
		<div class="required">	
			<label for="svnUsername">SVN Username: </label>
			<input type="text" name="svnUsername" id="svnUsername" class="inputText" value="#qGetProjects.svnUsername#">
		</div>
		<div class="required">	
			<label for="svnPassword">SVN Password: </label>
			<input type="text" name="svnPassword" id="svnPassword" class="inputText" value="#qGetProjects.svnPassword#">
		</div>
		<div class="required">	
			<label for="createTag" class="labelCheckbox">Create Subversion Tag <input type="checkbox" name="createTag" value="1" id="createTag"  class="inputCheckbox" checked="true"></label>
			
		</div>
	</fieldset>
	
	<fieldset><legend>Deployment Properties</legend>
		<div class="notes">
			<h4>Deployment Info</h4>
			<p class="last">These are the paths to the locations that you will be checking the code out to and
			where the final "clean" copy will be placed.</p>
		</div>
		<div class="required">
			<label for="buildRoot">Build Root:</label>
			<input type="text" name="buildRoot" id="buildRoot" required="true" 
					message="You must enter a Build Root." value="#qGetProjects.buildRoot#">
		</div>
		<div class="required">
			<label  for="depploymentRoot">Deployment Root: </label>
			<input type="text" name="deploymentRoot" id="deploymentRoot" class="inputText" value="#qGetProjects.deploymentRoot#">
		</div>
		<div class="required">	
			<label for="deploymentPath">Deployment Path:</label>
			<input type="text" name="deploymentPath" id="deploymentPath" class="inputText" value="#qGetProjects.deploymentPath#">
		</div>
	</fieldset>
	<input type="submit" name="submit" value="Save Project" class="inputSubmit" id="submit">
</form>
</cfoutput>