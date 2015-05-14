<h1>Projects</h1>
<p>This is a list of available projects.</p>

<!--- output the table here --->
<table class="listing">
	<thead>
		<tr>
			<th>Name</th>
			<th>View</th>
			<th>Edit</th>
			<th>Build</th>
			<th>Delete</th>
			<th>Last Build</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="qGetprojects">
			
			<cfset versionFile = "../version/"&#name#&".cfm">
			
			<cfif currentRow Mod 2>
				<cfset class="odd">
			<cfelse>
				<cfset class="even">
			</cfif>
			<tr class="#class#">
				<td><a href="#logfile#" target="_blank">#name#</td>
				<td><a href="#url#" target="_blank">View</a></td>
				<td><a href="#myself#c.editProject&projectID=#projectID#">Edit</td>
				<td><a href="#myself#c.buildProject&projectID=#projectID#">Build</td>
				<td><a href="#myself##xfa.deleteProject#&projectID=#projectID#">Delete</a></td>
				<cfinvoke component="deploymanager.model.builds" method="getLatestBuild" returnvariable="qryLatestBuild">
					<cfinvokeargument name="projectID" value="#projectID#">
				</cfinvoke>
				<td>
					<cftry>
					<cfinclude template="#versionFile#">
					<cfcatch type="missingInclude">
						No Builds Exist
					</cfcatch>
					</cftry>
				</td>
			</tr>
		</cfoutput>
			<tr class="odd">
				<cfoutput><td colspan="6"><a href="#myself#c.newProject"><strong>Create New Project</strong></a></td></cfoutput>
			</tr>
	</tbody>
</table>