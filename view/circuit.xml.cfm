<circuit access="public">
	
	<fuseaction name="welcome">
		<include template="dsp_welcome"/>
	</fuseaction>
	
	<fuseaction name="projectList">
		<include template="dsp_projectList"/>
		<include template="dsp_projectMenu" contentVariable="menuContent"/>
	</fuseaction>
	
	<fuseaction name="newProject">
		<include template="dsp_newProject"/>
		<include template="dsp_projectMenu" contentVariable="menuContent"/>
	</fuseaction>
	
	<fuseaction name="buildList">
		<include template="dsp_buildList"/>
		<include template="dsp_buildMenu" contentVariable="menuContent"/>
	</fuseaction>
	
	<fuseaction name="building">
		<include template="dsp_building"/>
	</fuseaction>

</circuit>

