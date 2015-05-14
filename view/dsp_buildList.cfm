<h1>Builds</h1>
<p>This is a list of all prevous builds.</p>
<!--- output the table here --->
<table class="listing">
	<thead>
		<tr>
			<th>Project</th>
			<th>BuildDate</th>
			<th>Version</th>
			<th>Result</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="qGetbuilds">
			<cfif currentRow Mod 2>
				<cfset class="odd">
			<cfelse>
				<cfset class="even">
			</cfif>
			<tr class="#class#">
				<td><a href="#myself#">#name#</td>
				<td>#buildDate#</td>
				<td>#version#</td>
				<td>#result#</td>
				<td><a href="##">Delete</a></td>
			</tr>
		</cfoutput>
	</tbody>
</table>