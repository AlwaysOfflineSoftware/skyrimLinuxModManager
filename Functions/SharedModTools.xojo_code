#tag Module
Protected Module SharedModTools
	#tag Method, Flags = &h0
		Sub BackupOriginal()
		  If(App.manualModsFile.Exists) Then
		    App.manualModsFile.CopyTo(App.BaseDir.child("Plugins.txt.bak"))
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadModLoadout(loadoutName as String)
		  app.configsFolder.child(loadoutName+".txt").CopyTo(App.BaseDir)
		  
		  Var loadout As folderitem= App.BaseDir.child(loadoutName+".txt")
		  App.BaseDir.Child("Plugins.txt").Remove
		  loadout.Name = "Plugins.txt"
		  
		  SkyrimModHandler.ReloadMods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSettings(rawSettings As String)
		  
		  If(App.savedSettings<>Nil) Then
		    Var settingsContent() As String= rawSettings.Split(EndOfLine)
		    If(settingsContent.Count>2) Then
		      If(Utils.ValidatePath(settingsContent(0))) Then
		        App.BaseDir= New FolderItem(settingsContent(0))
		      End
		      If(Utils.ValidatePath(settingsContent(1))) Then
		        App.skyrimData= New FolderItem(settingsContent(1))
		      End
		      App.launchCommand= SharedModTools.PrivilegeCommandCheck(settingsContent(2))
		    Else
		      Utils.GeneratePopup(3,"Something went wrong!","settings file will be reset")
		      App.savedSettings.Remove
		    End
		  End
		  
		  Exception err As RuntimeException
		    Utils.GeneratePopup(3,"Something went wrong!","settings file will be reset")
		    App.savedSettings.Remove
		    Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveModOrder(MoveUP as boolean)
		  If(MainScreen.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		    Var modListBox As DesktopListBox= MainScreen.lsb_ModOrderList
		    Var OldRowNum As String= modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ORDER)
		    Var selectedRowNum As Integer=_
		    modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ORDER).ToInteger
		    Var Min As Integer= 0
		    
		    If(MoveUP) Then
		      Var selectedRowMinus As Integer= selectedRowNum-1
		      Var selectedRowMoved As String= selectedRowMinus.ToString
		      
		      // System.DebugLog(selectedRowMoved)
		      If(selectedRowNum<>0) Then
		        modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ORDER)=_
		        selectedRowMoved
		        
		        modListBox.CellTextAt(modListBox.SelectedRowIndex-1,App.COL_ORDER)=_
		        OldRowNum
		      End
		    Else
		      Var selectedRowPlus As Integer= selectedRowNum+1
		      Var selectedRowMoved As String= selectedRowPlus.ToString
		      
		      // System.DebugLog(modListBox.RowCount.ToString + "= " + selectedRowNum.ToString)
		      If(selectedRowNum<>modListBox.RowCount-2) Then
		        modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ORDER)=_
		        selectedRowMoved
		        
		        modListBox.CellTextAt(modListBox.SelectedRowIndex+1,App.COL_ORDER)=_
		        OldRowNum
		      End
		    End
		    
		    modListBox.SortingColumn=App.COL_ORDER
		    modListBox.Sort
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveModTo(orderToChange as Integer, top as Boolean)
		  Var modListBox As DesktopListBox= MainScreen.lsb_ModOrderList
		  Var modplace As Integer
		  Var actualOrder As Integer= orderToChange-1
		  
		  // System.DebugLog(actualOrder.toString)
		  
		  If(top) Then
		    
		    For rowNum As Integer= 0 To modListBox.RowCount-1
		      If(modListBox.CellTextAt(rowNum,App.COL_ID)= "-1") Then
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= "-1"
		      ElseIf(modListBox.CellTextAt(rowNum,App.COL_ORDER)= actualOrder.ToString) Then
		        // System.DebugLog(modListBox.CellTextAt(rowNum,App.COL_NAME))
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= "0"
		      Else
		        modplace= modListBox.CellTextAt(rowNum,App.COL_ORDER).ToInteger +1
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= modplace.ToString
		      End
		    Next
		    
		  Else //Move to bottom
		    Var listBottom As Integer=modListBox.RowCount-2
		    
		    For rowNum As Integer= 0 To modListBox.RowCount-1
		      If(modListBox.CellTextAt(rowNum,App.COL_ID)= "-1") Then
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= "-1"
		      ElseIf(modListBox.CellTextAt(rowNum,App.COL_ORDER)= actualOrder.ToString) Then
		        // System.DebugLog(modListBox.CellTextAt(rowNum,App.COL_NAME))
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= listBottom.ToString
		      Else
		        modplace= modListBox.CellTextAt(rowNum,App.COL_ORDER).ToInteger-1
		        modListBox.CellTextAt(rowNum,App.COL_ORDER)= modplace.ToString
		      End
		    Next
		    
		  End
		  
		  modListBox.SortingColumn=App.COL_ORDER
		  modListBox.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateLoadouts()
		  MainScreen.pop_SavedLoadouts.RemoveAllRows
		  MainScreen.pop_SavedLoadouts.AddRow("<new>")
		  
		  For Each item As FolderItem In App.configsFolder.Children
		    If(item.DisplayName="settings.ini" Or item.DisplayName="dependancies.ini") Then
		      Continue
		    Else
		      MainScreen.pop_SavedLoadouts.AddRow(item.Name.Replace(".txt",""))
		      
		    End
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivilegeCommandCheck(riskyLaunchCommand as String) As String
		  Var tempLaunchCommand As String= riskyLaunchCommand
		  
		  // System.DebugLog(tempLaunchCommand)
		  If(tempLaunchCommand.Trim<>"") Then
		    If(tempLaunchCommand.Lowercase.Contains("sudo") Or _
		      tempLaunchCommand.Lowercase.Contains("pkexec")) Then
		      Utils.GeneratePopup(1,"Privilege Escalation Detected!!!", _
		      "You should never need to run a videogame as an admin!")
		      Return ""
		    Else
		      Return tempLaunchCommand.Trim
		    End
		  Else
		    Return ""
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RevertToOriginal()
		  If(App.BaseDir.child("Plugins.txt.bak").Exists) Then
		    App.manualModsFile.Remove
		    App.BaseDir.child("Plugins.txt.bak").CopyTo(App.BaseDir.child("Plugins.txt"))
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveModLoadout(loadoutName as String)
		  Var modListBox As DesktopListBox= MainScreen.lsb_ModOrderList
		  Var enabledToFile As String
		  Var cleanLoadoutName As String = loadoutName.ReplaceAll(".txt","")
		  
		  Utils.WriteFile(App.configsFolder.child(cleanLoadoutName+".txt"),_
		  "# This file is used by Skyrim to keep track of your downloaded content.",True)
		  Utils.WriteFile(App.configsFolder.child(cleanLoadoutName+".txt"),_
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
		      
		      Utils.WriteFile(App.configsFolder.child(cleanLoadoutName+".txt"),_
		      enabledToFile,False)
		    End
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveSettings()
		  Utils.WriteFile(App.savedSettings,App.BaseDir.NativePath, True)
		  Utils.WriteFile(App.savedSettings,App.skyrimData.NativePath+ EndOfLine, False)
		  Utils.WriteFile(App.savedSettings,App.launchCommand+ EndOfLine, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleAllMods(activate as boolean)
		  For row As Integer=0 To MainScreen.lsb_ModOrderList.LastRowIndex
		    If(activate) Then
		      MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ENABLED)="Y"
		    Else
		      MainScreen.lsb_ModOrderList.CellTextAt(row,App.COL_ENABLED)=" "
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleMod()
		  Var modListBox As DesktopListBox= MainScreen.lsb_ModOrderList
		  
		  If(modListBox.SelectedRowIndex<>-1) Then
		    If(modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ID)<>"-1" And _
		      modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ID)<>"tmp") Then
		      
		      If(modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ENABLED)="Y") Then
		        modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ENABLED)=" "
		      Else
		        modListBox.CellTextAt(modListBox.SelectedRowIndex,App.COL_ENABLED)="Y"
		      End
		      
		    End
		  End
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
