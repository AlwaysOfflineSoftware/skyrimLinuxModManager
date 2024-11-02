#tag Module
Protected Module SKSEHandler
	#tag Method, Flags = &h21
		Private Sub ClearPluginList()
		  SkseScreen.lsb_Plugins.RemoveAllRows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InstallSKSE(skseArchive as FolderItem, setAsDefault as Boolean)
		  Var archiveCommand As String= """"+SpecialFolder.Resources.NativePath _
		  + "7zzs"" x % -o" + """"+SpecialFolder.CurrentWorkingDirectory.NativePath+""" -y"
		  
		  If(skseArchive<> Nil) Then
		    If(skseArchive.Name.Contains(".zip")) Then
		      skseArchive.Unzip(App.SkyrimData)
		    ElseIf(skseArchive.Name.Contains(".7z")) Then
		      Utils.ShellCommand(archiveCommand.Replace("%",""""+skseArchive.NativePath+""""), False, False)
		    ElseIf(skseArchive.Name.Contains(".rar")) Then
		      Utils.ShellCommand(archiveCommand.Replace("%",""""+skseArchive.NativePath+""""), False, False)
		    Else
		      Utils.ErrorHandler(3,"Unsupported archive format",_
		      "Please extract manually and archive as a zip file")
		    End
		  End
		  
		  For Each item As folderitem In SpecialFolder.CurrentWorkingDirectory.Children
		    If(item.IsFolder And item.Name.Lowercase.Contains("skse")) Then
		      For Each subitem As folderitem In item.Children
		        subitem.MoveTo(App.skyrimData.Parent)
		      Next
		      item.Remove
		      Exit
		    End
		  Next
		  
		  Var sksePlugins As Folderitem
		  
		  If(setAsDefault) Then
		    If(App.skyrimData.Child("SKSE").Exists) Then
		      Utils.WriteFile(App.skyrimData.Child("SKSE").Child("SKSE.ini"),"[Loader]" +_
		      EndOfLine + "RuntimeName=SkyrimSE_SKSE.exe",True)
		    Else
		      sksePlugins= Utils.CreateFolderStructure(App.skyrimData,"/SKSE/Plugins/")
		      Utils.WriteFile(App.skyrimData.Child("SKSE").Child("SKSE.ini"),"[Loader]" +_
		      EndOfLine + "RuntimeName=SkyrimSE_SKSE.exe", True)
		    End
		    
		    App.skyrimData.Parent.Child("SkyrimSE.exe").CopyTo(App.skyrimData.Child("SKSE"))
		    App.skyrimData.Child("SKSE").Child("SkyrimSE.exe").Name= "SkyrimSE_SKSE.exe"
		    App.skyrimData.Child("SKSE").Child("SkyrimSE_SKSE.exe").MoveTo(App.skyrimData.Parent)
		    App.skyrimData.Parent.Child("SkyrimSE.exe").Name="SkyrimSE.exe.bak"
		    App.skyrimData.Parent.Child("skse64_loader.exe").Name="SkyrimSE.exe"
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPluginList()
		  Var pluginNames() As String= SKSEHandler.ScanPlugins
		  
		  ClearPluginList
		  
		  For Each plugin As String In pluginNames
		    SkseScreen.lsb_Plugins.AddRow(plugin.Replace(".dll","").Replace(".bin",""))
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePlugin(pluginName as String)
		  If(App.skyrimData.Child("SKSE").child("Plugins").Child(pluginName+".dll").Exists) Then
		    App.skyrimData.Child("SKSE").child("Plugins").Child(pluginName+".dll").Remove
		  ElseIf(App.skyrimData.Child("SKSE").child("Plugins").Child(pluginName+".bin").Exists) Then
		    App.skyrimData.Child("SKSE").child("Plugins").Child(pluginName+".bin").remove
		  End
		  LoadPluginList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ScanPlugins() As String()
		  Var skseNames() As String
		  
		  If(App.skseFolder.Exists) Then
		    If(App.skseFolder.Child("Plugins").Exists) Then
		      
		      
		      For Each item As folderitem In App.skseFolder.Child("Plugins").Children
		        If(Not item.IsFolder) Then
		          skseNames.Add(item.Name)
		        End
		      Next
		    End
		  End
		  Return skseNames
		End Function
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
