<distribution version="13.0.1" name="UI_test" type="MSI">
	<prebuild>
		<workingdir>workspacedir</workingdir>
		<actions></actions></prebuild>
	<postbuild>
		<workingdir>workspacedir</workingdir>
		<actions></actions></postbuild>
	<msi GUID="{61A7102A-198A-44C6-BA9D-0BD9AE1034CD}">
		<general appName="UI_test" outputLocation="c:\Users\rkh-virtual\Documents\National Instruments\CVI\cvidistkit.UI_test" relOutputLocation="cvidistkit.UI_test" outputLocationWithVars="c:\Users\rkh-virtual\Documents\National Instruments\CVI\cvidistkit.%name" relOutputLocationWithVars="cvidistkit.%name" upgradeBehavior="1" autoIncrement="true" version="1.0.1">
			<arp company="RKH" companyURL="" supportURL="" contact="" phone="" comments=""/>
			<summary title="" subject="" keyWords="" comments="" author=""/></general>
		<userinterface language="English" showPaths="true" readMe="" license="">
			<dlgstrings welcomeTitle="UI_test" welcomeText=""/></userinterface>
		<dirs appDirID="101">
			<installDir name="[Start&gt;&gt;Programs]" dirID="7" parentID="-1" isMSIDir="true" visible="true" unlock="false"/>
			<installDir name="UI_test" dirID="100" parentID="7" isMSIDir="false" visible="true" unlock="false"/>
			<installDir name="[Program Files]" dirID="2" parentID="-1" isMSIDir="true" visible="true" unlock="false"/>
			<installDir name="UI_test" dirID="101" parentID="2" isMSIDir="false" visible="true" unlock="false"/></dirs>
		<files>
			<simpleFile fileID="0" sourcePath="C:\Program Files\IVI Foundation\IVI\bin\chr616xx_32.dll" targetDir="101" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/>
			<simpleFile fileID="1" sourcePath="c:\Users\rkh-virtual\Documents\National Instruments\CVI\cvibuild.UI_test\Release\UI_test.exe" targetDir="101" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/>
			<simpleFile fileID="2" sourcePath="c:\Users\rkh-virtual\Documents\National Instruments\CVI\UI_test.uir" relSourcePath="UI_test.uir" relSourceBase="0" targetDir="101" readonly="false" hidden="false" system="false" regActiveX="false" runAfterInstallStyle="IMMEDIATELY_RESUME_INSTALL" cmdLineArgs="" runAfterInstall="false" uninstCmdLnArgs="" runUninst="false"/></files>
		<fileGroups>
			<projectOutput targetType="0" dirID="101" projectID="0">
				<fileID>1</fileID></projectOutput>
			<projectDependencies dirID="101" projectID="0">
				<fileID>0</fileID></projectDependencies></fileGroups>
		<shortcuts>
			<shortcut name="UI_test" targetFileID="1" destDirID="100" cmdLineArgs="" description="" runStyle="NORMAL"/></shortcuts>
		<mergemodules/>
		<products/>
		<runtimeEngine installToAppDir="false" activeXsup="true" analysis="true" cvirte="true" dotnetsup="true" instrsup="true" lowlevelsup="true" lvrt="true" netvarsup="true" rtutilsup="true">
			<hasSoftDeps/></runtimeEngine><sxsRuntimeEngine>
			<selected>false</selected>
			<doNotAutoSelect>false</doNotAutoSelect></sxsRuntimeEngine>
		<advanced mediaSize="650">
			<launchConditions>
				<condition>MINOS_WINXP_SP0</condition>
			</launchConditions>
			<includeConfigProducts>true</includeConfigProducts>
			<maxImportVisible>silent</maxImportVisible>
			<maxImportMode>merge</maxImportMode>
			<custMsgFlag>false</custMsgFlag>
			<custMsgPath>msgrte.txt</custMsgPath>
			<signExe>false</signExe>
			<certificate></certificate>
			<signTimeURL></signTimeURL>
			<signDescURL></signDescURL></advanced>
		<Projects NumProjects="1">
			<Project000 ProjectID="0" ProjectAbsolutePath="c:\Users\rkh-virtual\Documents\National Instruments\CVI\UI_test.prj" ProjectRelativePath="UI_test.prj"/></Projects>
		<buildData progressBarRate="0.264413930838853">
			<progressTimes>
				<Begin>0.000000000000000</Begin>
				<ProductsAdded>0.057619500000000</ProductsAdded>
				<DPConfigured>1.790342000000000</DPConfigured>
				<DPMergeModulesAdded>4.007014500000000</DPMergeModulesAdded>
				<DPClosed>12.220775999999999</DPClosed>
				<DistributionsCopied>28.414562999999998</DistributionsCopied>
				<End>378.194899500000020</End></progressTimes></buildData>
	</msi>
</distribution>
