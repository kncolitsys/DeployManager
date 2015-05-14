<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fusebox>
<fusebox>
	<circuits>
		<!-- controller circuits -->
		<circuit alias="c" path="controller/" parent=""/>

		<!-- view circuits -->
		<circuit alias="v" path="view/" parent=""/>
		
		<!-- layout specific -->
		<circuit alias="layouts" path="layouts/" parent=""/>
		<circuit alias="default" path="layouts/default" parent="layouts"/>
	</circuits>

	<classes>
		<class alias="projects" classpath="deploymanager.model.projects" type="component" constructor="init"/>
		<class alias="builds" classpath="deploymanager.model.builds" type="component" constructor="init"/>
	</classes>

	<parameters>
		<parameter name="defaultFuseaction" value="c.main" />
		<!-- you may want to change this to development-full-load mode: -->
		<parameter name="mode" value="development-full-load" />
		<!-- change this to something more secure: -->
		<parameter name="password" value="skeleton" />
		<parameter name="fuseactionVariable" value="do" />
		<parameter name="debug" value="true" />
		<parameter name="allowImplicitCircuits" value="true" />
		<!--
			These are all default values that can be overridden:
		<parameter name="fuseactionVariable" value="fuseaction" />
		<parameter name="precedenceFormOrUrl" value="form" />
		<parameter name="scriptFileDelimiter" value="cfm" />
		<parameter name="maskedFileDelimiters" value="htm,cfm,cfml,php,php4,asp,aspx" />
		<parameter name="characterEncoding" value="utf-8" />
		<paramater name="strictMode" value="false" />
		<parameter name="allowImplicitCircuits" value="false" />
		-->
	</parameters>

	<globalfuseactions>
		<appinit>
		</appinit>
		<preprocess>
		</preprocess>
		<postprocess>
			<fuseaction action="layouts.default"/>
		</postprocess>
	</globalfuseactions>

	<plugins>
		<phase name="preProcess">
			<!--
			<plugin name="prePP" template="preProcess">
				<parameter name="abc" value="123" />
			</plugin>
			-->
		</phase>
		<phase name="preFuseaction">
		</phase>
		<phase name="postFuseaction">
		</phase>
		<phase name="fuseactionException">
		</phase>
		<phase name="postProcess">
		</phase>
		<phase name="processError">
		</phase>
	</plugins>

</fusebox>
