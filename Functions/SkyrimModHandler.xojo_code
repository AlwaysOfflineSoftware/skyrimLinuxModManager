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
		  
		  Utils.ErrorHandler(1,"Batch install completed!",_
		  "Mods probably installed: " + installCount.ToString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstallMod(modToInstall as folderitem, batchmode as boolean = False, modType as integer = 0) As Boolean
		  Var itemArr() As String= modToInstall.Name.Split(".")
		  Var last As Integer= itemArr.LastIndex
		  
		  System.DebugLog(itemArr(last))
		  If(itemArr(last)="zip") Then
		    modToInstall.Unzip(App.SkyrimData)
		    Return True
		  ElseIf(itemArr(last)="7z") Then
		    System.DebugLog(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""))
		    Utils.ShellCommand(App.command7Zip.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		    Return True
		  ElseIf(itemArr(last)="rar") Then
		    System.DebugLog(App.commandRar.Replace("%",""""+modToInstall.NativePath+""""))
		    Utils.ShellCommand(App.commandRar.Replace("%",""""+modToInstall.NativePath+""""), False, False)
		    Return True
		  Else
		    
		    If(Not batchmode) Then
		      Utils.ErrorHandler(3,"Unsupported archive format",_
		      "Please extract manually and archive as a zip file")
		    End
		    
		    Return False
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSettings(rawSettings As String)
		  
		  If(App.savedSettings<>Nil) Then
		    Var settingsContent() As String= rawSettings.Split(EndOfLine)
		    Var splitLine() As String
		    If(settingsContent.Count>0) Then
		      For Each line As String In settingsContent
		        If(line.Trim<> "") Then
		          splitLine= line.Split("|")
		          
		          If(splitLine(0)="BaseDir") Then
		            App.BaseDir= New folderItem(splitLine(1))
		          ElseIf(splitLine(0)="skyrimData") Then
		            App.skyrimData= New folderItem(splitLine(1))
		          End
		        end
		      Next
		    End
		  Else
		    Utils.ErrorHandler(3,"Something went wrong!","The")
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateLoadouts()
		  For Each item As FolderItem In App.configsFolder.Children
		    If(item.DisplayName="settings.ini") Then
		      Continue
		    Else
		      MainScreen.pop_SavedLoadouts.AddRow(item.Name.Replace(".txt",""))
		      
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadMods()
		  //Enabled    ID    Mod Name    Load Order
		  MainScreen.lsb_ModOrderList.RemoveAllRows
		  App.manualItemList= Utils.ReadFile(App.manualModsFile).Split(EndOfLine)
		  
		  Var modID As Integer= 0
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
		      If(modline.Left(1)="*") Then
		        MainScreen.lsb_ModOrderList.AddRow("Y",modID.ToString,_
		        modline.Trim.Replace("*",""),loadedOrder.ToString)
		        addedNames.add(modline.Trim.Replace("*",""))
		      Else
		        MainScreen.lsb_ModOrderList.AddRow(" ",modID.ToString,_
		        modline.Trim,loadedOrder.ToString)
		        addedNames.add(modline.Trim)
		      End
		      loadedOrder= loadedOrder+1
		      modID= modID+1
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
		      MainScreen.lsb_ModOrderList.AddRow(" ",modID.ToString,_
		      newNames(v).Trim,loadedOrder.ToString)
		      loadedOrder= loadedOrder+1
		      modID= modID+1
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
		  // ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local
		  // /Skyrim Special Edition
		  
		  App.BaseDir= SpecialFolder.UserHome.child(".local").child("share").child("Steam")_
		  .child("steamapps").child("compatdata").child("489830").child("pfx").child("drive_c")_
		  .child("users").child("steamuser").child("AppData").child("Local").child("Skyrim Special Edition")
		  
		  // ~/.local/share/Steam/steamapps/common/Skyrim Special Edition/Data
		  App.skyrimData= SpecialFolder.UserHome.child(".local").child("share").child("Steam")_
		  .child("steamapps").child("common").child("Skyrim Special Edition").child("Data")
		  
		  App.configsFolder= Utils.CreateFolderStructure(SpecialFolder.UserHome,_
		  ".config/AlwaysOfflineSoftware/SkyrimLinuxModder/")
		  
		  App.command7Zip= """"+SpecialFolder.CurrentWorkingDirectory.NativePath _
		  + "SkyrimLinuxModder Resources/7zzs"" x % -o" + """"+App.skyrimData.NativePath+""" -y"
		  App.commandRar= App.command7Zip
		  
		  App.savedSettings= app.configsFolder.child("settings.ini")
		  
		  If(Not App.savedSettings.Exists) Then
		    Utils.WriteFile(App.savedSettings,"", True)
		  End
		  
		  If(App.savedSettings.Exists) Then
		    Var rawSettings As String= Utils.ReadFile(App.savedSettings)
		    If(rawSettings.Trim<> "") Then
		      SkyrimModHandler.LoadSettings(rawSettings)
		    End
		  End
		  
		  App.modIDMap= New Dictionary
		  
		  
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
