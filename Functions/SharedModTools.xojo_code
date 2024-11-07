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
		Sub PopulateLoadouts()
		  MainScreen.pop_SavedLoadouts.RemoveAllRows
		  MainScreen.pop_SavedLoadouts.AddRow("<new>")
		  
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
