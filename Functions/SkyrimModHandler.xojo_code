#tag Module
Protected Module SkyrimModHandler
	#tag Method, Flags = &h0
		Sub ApplyLoadOrder()
		  Var modListBox As DesktopListBox= MainScreen.lsb_ModOrderList
		  Var enabledToFile As String
		  
		  Utils.WriteFile(App.manualModsFile,_
		  "# This file is used by Skyrim to keep track of your downloaded content.",True)
		  Utils.WriteFile(App.manualModsFile,_
		  "# Please do not modify this file." + EndOfLine,False)
		  
		  For rowNum As Integer= 0 To modListBox.RowCount-1
		    If(modListBox.CellTextAt(rowNum,App.COL_ID)="-1") Then
		      Continue
		    Else
		      If(modListBox.CellTextAt(rowNum,App.COL_ENABLED)="Y") Then
		        enabledToFile= "*"+ modListBox.CellTextAt(rowNum,App.COL_NAME)+ EndOfLine
		      Else
		        enabledToFile= modListBox.CellTextAt(rowNum,App.COL_NAME)+ EndOfLine
		      End
		      
		      Utils.WriteFile(App.manualModsFile,_
		      enabledToFile,False)
		    End
		  Next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BatchInstallMods(zipModFolder as folderItem, modType as integer = 0)
		  Var installed As Boolean= False
		  Var installCount As Integer= 0
		  
		  For Each child As FolderItem In zipModFolder.Children
		    installed= False
		    
		    If(child.IsFolder Or child.IsAlias) Then
		      Continue
		    Else
		      installed= SkyrimModHandler.InstallMod(child,True)
		      If(installed) Then
		        installCount= installCount+1
		      End
		    End
		    
		  Next
		  
		  Utils.GeneratePopup(1,"Batch install completed!",_
		  "Mods probably installed: " + installCount.ToString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckForFomod(modToInstall as folderItem) As Boolean
		  Var isFomod As Boolean= False
		  Var tempTestDir As folderItem= Utils.CreateFolderStructure(SpecialFolder.UserHome,_
		  ".config/AlwaysOfflineSoftware/SkyrimLinuxModder/temp/")
		  
		  Var TestDir As String = """"+SpecialFolder.Resources.NativePath _
		  + "7zzs"" x % -o" + """"+tempTestDir.NativePath+""" -y"
		  
		  Utils.ShellCommand(TestDir.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		  
		  For Each item As FolderItem In tempTestDir.Children
		    If(item.IsFolder And item.Name.Lowercase.Contains("fomod")) Then
		      isFomod= True
		      item.RemoveFolderAndContents
		      Continue
		    End
		    
		    If(item.IsFolder) Then
		      item.RemoveFolderAndContents
		      Continue
		    End
		    
		    item.Remove
		  next
		  
		  If(isFomod) Then
		    Utils.GeneratePopup(3,"Fomod Detected!",_
		    "The installer doesn't support Fomods (yet). Please manually install this one")
		  End
		  
		  Return isFomod
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DependAdd()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DependCheck()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DependLoad()
		  // ChildID=ParentModID,ParentModID,ParentModID
		  
		  Var dependsContent As String= Utils.ReadFile(App.dependsFile)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DependRemove()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstallMod(modToInstall as folderitem, batchmode as boolean = False, modType as integer = 0) As Boolean
		  Var itemArr() As String= modToInstall.Name.Split(".")
		  Var last As Integer= itemArr.LastIndex
		  Var isFomod As Boolean= CheckForFomod(modToInstall)
		  
		  // System.DebugLog(itemArr(last))
		  If(Not isFomod) Then
		    If(itemArr(last)="zip") Then
		      modToInstall.Unzip(App.SkyrimData)
		      Return True
		    ElseIf(itemArr(last)="7z") Then
		      // System.DebugLog(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""))
		      Utils.ShellCommand(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		      Return True
		    ElseIf(itemArr(last)="rar") Then
		      // System.DebugLog(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""))
		      Utils.ShellCommand(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		      Return True
		    Else
		      
		      If(Not batchmode) Then
		        Utils.GeneratePopup(3,"Unsupported archive format",_
		        "Please extract manually and archive as a zip file")
		      End
		    End
		  End
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadMods()
		  //Enabled    ID    Mod Name    Load Order
		  MainScreen.lsb_ModOrderList.RemoveAllRows
		  App.manualItemList= Utils.ReadFile(App.manualModsFile).Split(EndOfLine)
		  
		  Var modID As String
		  Var tempName As String
		  Var loadedOrder As Integer= 0
		  Var scannedNames() As String
		  Var addedNames() As String
		  Var newNames() As String
		  Var matched As Boolean= False
		  
		  MainScreen.lsb_ModOrderList.AddRowAt(App.COL_ENABLED,"Y")
		  MainScreen.lsb_ModOrderList.CellTextAt(0, App.COL_ID)= "-1"
		  MainScreen.lsb_ModOrderList.CellTextAt(0, App.COL_NAME)= "base game files..."
		  MainScreen.lsb_ModOrderList.CellTextAt(0, App.COL_ORDER)= "-1"
		  
		  scannedNames= ScanDataFolder
		  
		  For Each modline As String In App.manualItemList
		    // System.DebugLog(modline.Left(1))
		    If(modline.Left(1)<>"#" And modline.Left(1)<>"") Then
		      // System.DebugLog(modline.Trim + "= " + modline.Trim.Replace(modline.Left(1),""))
		      tempName= modline.Trim.Replace("*","").Replace(".esp","")
		      modID= tempName.Left(2).Lowercase + tempName.Right(2).Lowercase +_
		      tempName.Length.ToString
		      If(modline.Left(1)="*") Then
		        MainScreen.lsb_ModOrderList.AddRow("Y",modID,_
		        modline.Trim.Replace("*",""),loadedOrder.ToString)
		        addedNames.add(modline.Trim.Replace("*",""))
		      Else
		        MainScreen.lsb_ModOrderList.AddRow(" ",modID,_
		        modline.Trim,loadedOrder.ToString)
		        addedNames.add(modline.Trim)
		      End
		      loadedOrder= loadedOrder+1
		    End
		    
		  Next
		  
		  For i As Integer=0 To scannedNames.count-1
		    For k As Integer=0 To addedNames.count-1
		      If(scannedNames(i)= addedNames(k)) Then
		        matched= True
		        Exit
		      End
		    Next
		    If(Not Matched) Then
		      newNames.Add(scannedNames(i))
		    End
		    matched= False
		  Next
		  
		  If(newNames.count>0) Then
		    For v As Integer=0 To newNames.count-1
		      tempName= newNames(v).Trim.Replace("*","").Replace(".esp","")
		      modID= tempName.Left(2).Lowercase + tempName.Right(2).Lowercase +_
		      tempName.Length.ToString
		      
		      MainScreen.lsb_ModOrderList.AddRow(" ",modID,_
		      newNames(v).Trim,loadedOrder.ToString)
		      loadedOrder= loadedOrder+1
		    Next
		  End
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ScanDataFolder() As String()
		  Var espNames() As String
		  
		  For Each item As folderitem In App.skyrimData.Children
		    If(Not item.IsFolder) Then
		      If(item.Name.Contains(".esp")) Then
		        espNames.Add(item.Name)
		      End
		    End
		  Next
		  
		  return espNames
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Startup()
		  // ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition
		  
		  App.configsFolder= Utils.CreateFolderStructure(SpecialFolder.UserHome,_
		  ".config/AlwaysOfflineSoftware/SkyrimLinuxModder/")
		  App.savedSettings= App.configsFolder.child("settings.ini")
		  App.dependsFile= App.configsFolder.child("dependancies.ini")
		  App.modIDMap= New Dictionary
		  
		  If(App.savedSettings.Exists) Then
		    Var rawSettings As String= Utils.ReadFile(App.savedSettings)
		    If(rawSettings.Trim<> "") Then
		      SharedModTools.LoadSettings(rawSettings)
		    End
		  Else
		    Utils.WriteFile(App.savedSettings,"", True)
		    
		    If(Utils.ValidatePath(SpecialFolder.UserHome.NativePath+ _
		      ".local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition") And _
		      Utils.ValidatePath(SpecialFolder.UserHome.NativePath+ _
		      ".local/share/Steam/steamapps/common/Skyrim Special Edition/Data")) Then
		      
		      App.BaseDir= SpecialFolder.UserHome.child(".local").child("share").child("Steam")_
		      .child("steamapps").child("compatdata").child("489830").child("pfx").child("drive_c")_
		      .child("users").child("steamuser").child("AppData").child("Local").child("Skyrim Special Edition")
		      
		      // ~/.local/share/Steam/steamapps/common/Skyrim Special Edition/Data
		      App.skyrimData= SpecialFolder.UserHome.child(".local").child("share").child("Steam")_
		      .child("steamapps").child("common").child("Skyrim Special Edition").child("Data")
		    Else
		      App.BaseDir= Nil
		      App.skyrimData= Nil
		      App.launchCommand= ""
		    End
		  End
		  
		  If(App.BaseDir<> Nil And App.skyrimData<> Nil) Then
		    App.command7Zip= """"+SpecialFolder.Resources.NativePath _
		    + "7zzs"" x % -o" + """"+App.skyrimData.NativePath+""" -y"
		    
		    If(Utils.ValidatePath(App.BaseDir.NativePath+"Plugins.txt")) Then
		      App.manualModsFile= App.BaseDir.child("Plugins.txt")
		    Else
		      Utils.WriteFile(App.BaseDir.NativePath+"Plugins.txt",_
		      "# This file is used by Skyrim to keep track of your downloaded content.",False)
		      Utils.WriteFile(App.BaseDir.NativePath+"Plugins.txt",_
		      "# Please do not modify this file." + EndOfLine,False)
		      App.manualModsFile= App.BaseDir.child("Plugins.txt")
		    End
		    
		    SharedModTools.BackupOriginal
		    SharedModTools.SaveSettings
		    MainScreen.Show
		    OpeningScreen.Close
		  Else
		    App.setupNotAutomatic= True
		    Utils.GeneratePopup(1,"Steam Directory was not detected",_
		    "Please point to all the relevant directories")
		  End
		  
		  
		  Exception err As RuntimeException
		    Utils.GeneratePopup(3,"Something went wrong!",err.message + " (Probably the dev's fault)")
		    Return
		    
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
