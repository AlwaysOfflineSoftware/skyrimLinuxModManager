#tag DesktopWindow
Begin DesktopWindow MainScreen
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   3
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1372590079
   MenuBarVisible  =   False
   MinimumHeight   =   400
   MinimumWidth    =   800
   Resizeable      =   True
   Title           =   "Skyrim Linux Modder"
   Type            =   0
   Visible         =   True
   Width           =   800
   Begin DesktopListBox lsb_ModOrderList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   True
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   5
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   15.0
      FontUnit        =   0
      GridLineStyle   =   1
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   326
      Index           =   -2147483648
      InitialValue    =   "Enabled	ID	Mod Name	Load Order	Depends On"
      Italic          =   False
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   661
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton btn_Apply
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Apply"
      Default         =   True
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Finalizes the load order"
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopImageViewer imv_LoadedGame
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   80
      Image           =   86487039
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   266
      Transparent     =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopButton btn_Refresh
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "pulls the load order from file"
      Top             =   58
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_Donate
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Donate"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_SaveLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save Preset"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   310
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Saves load order"
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin DesktopButton btn_LoadLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load Preset"
      Default         =   False
      Enabled         =   False
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   415
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Loads a preset (remember to apply)"
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin DesktopPopupMenu pop_SavedLoadouts
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      InitialValue    =   "<new>"
      Italic          =   False
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Selects a preset to load or create a new one"
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   173
   End
   Begin DesktopButton btn_DeleteLoadout
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete Preset"
      Default         =   False
      Enabled         =   False
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   520
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Deletes selected preset"
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   98
   End
   Begin DesktopSeparator sep_Line1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   26
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   630
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   358
      Transparent     =   False
      Visible         =   True
      Width           =   22
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopButton btn_Toggle
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Toggle"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Activate/Deactivate a mod"
      Top             =   228
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_PlaySkyrim
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Play Skyrim"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   670
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Coming Soon!"
      Top             =   358
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin DesktopButton btn_MoveUp
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Up"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Moves mod up the load order"
      Top             =   152
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_Install
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Install"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Left Click: Choose a zip file that contains a Skyrim mod to install\nRight Click: This will batch install all the mods from a directory set in the settings"
      Top             =   96
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_MoveDown
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Down"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Moves mod down the load order"
      Top             =   190
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopSeparator sep_Line2
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   14
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   21
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   17
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   132
      Transparent     =   False
      Visible         =   True
      Width           =   80
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var lsbWidth As Integer= Self.lsb_ModOrderList.Width
		  
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ENABLED).WidthActual=(lsbWidth*0.10)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ID).WidthActual=(lsbWidth*0.10)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_NAME).WidthActual=(lsbWidth*0.45)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_ORDER).WidthActual=(lsbWidth*0.15)
		  Self.lsb_ModOrderList.ColumnAttributesAt(App.COL_DEPENDS).WidthActual=(lsbWidth*0.15)
		  
		  
		  Utils.WriteFile(App.savedSettings,"BaseDir|"+_
		  App.BaseDir.NativePath, True)
		  Utils.WriteFile(App.savedSettings,"command7Zip|"+_
		  App.command7Zip+ EndOfLine, False)
		  Utils.WriteFile(App.savedSettings,"commandRar|"+_
		  App.commandRar+ EndOfLine, False)
		  Utils.WriteFile(App.savedSettings,"skyrimData|"+_
		  App.skyrimData.NativePath+ EndOfLine, False)
		  
		  SharedModTools.PopulateLoadouts
		  Self.pop_SavedLoadouts.SelectedRowIndex=0
		  
		  SkyrimModHandler.ReloadMods
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileSettings() As Boolean Handles FileSettings.Action
		  SettingsScreen.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSKSEManager() As Boolean Handles FileSKSEManager.Action
		  SkseScreen.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
		  AboutScreen.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpDonate() As Boolean Handles HelpDonate.Action
		  System.GotoURL("https://alwaysoffline.gumroad.com/l/Thanks")
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpLicense() As Boolean Handles HelpLicense.Action
		  LicenseScreen.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpNexusPage() As Boolean Handles HelpNexusPage.Action
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events lsb_ModOrderList
	#tag Event
		Sub DoublePressed()
		  SharedModTools.ToggleMod
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If(Me.CellTextAt(Me.SelectedRowIndex,App.COL_ENABLED)="Y") Then
		    base.AddMenu(New MenuItem("Disable"))
		  Else
		    base.AddMenu(New MenuItem("Activate"))
		  End
		  base.AddMenu(New MenuItem("Move To Top"))
		  base.AddMenu(New MenuItem("Move To Bottom"))
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Text
		  Case "Activate"
		    SharedModTools.ToggleMod
		  Case "Disable"
		    SharedModTools.ToggleMod
		  Case "Move To Top"
		    SharedModTools.MoveModTo(Me.SelectedRowIndex,True)
		  Case "Move To Bottom"
		    SharedModTools.MoveModTo(Me.SelectedRowIndex,False)
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function RowComparison(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Select Case column
		    
		  Case App.COL_ID 
		    If Me.CellTextAt(row1, column ).Val < Me.CellTextAt(row2, column).Val Then
		      result = -1
		    ElseIf Me.CellTextAt(row1, column).Val > Me.CellTextAt(row2, column).Val Then
		      result = 1
		    Else
		      result = 0
		    End If
		    Return True
		    
		    
		  Case APP.COL_ORDER 
		    If Me.CellTextAt(row1, column ).Val < Me.CellTextAt(row2, column).Val Then
		      result = -1
		    ElseIf Me.CellTextAt(row1, column).Val > Me.CellTextAt(row2, column).Val Then
		      result = 1
		    Else
		      result = 0
		    End If
		    Return True
		    
		  Else //some other column for which we let the listbox handle string comparison
		    Return False
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObjectOnRow(x As Integer, y As Integer, obj As DragItem, action As Integer, row As Integer, parentRow As Integer, location As DesktopListbox.DropLocations)
		  // System.DebugLog("Dropping Event")
		  
		  For rowNum As Integer= 0 To Me.RowCount-1
		    If(Me.CellTextAt(rowNum,App.COL_ID)= "-1") Then
		      Me.CellTextAt(rowNum,App.COL_ORDER)= "-1"
		    Else
		      Me.CellTextAt(rowNum,App.COL_ORDER)= rowNum.ToString
		    End
		  Next
		  
		  Me.SortingColumn=App.COL_ORDER
		  Me.Sort
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Apply
	#tag Event
		Sub Pressed()
		  SkyrimModHandler.ApplyLoadOrder
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Refresh
	#tag Event
		Sub Pressed()
		  SkyrimModHandler.ReloadMods
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Donate
	#tag Event
		Sub Pressed()
		  
		  System.GotoURL("https://alwaysoffline.gumroad.com/l/Thanks")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_SaveLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex=0) Then
		    SaveConfigScreen.Show
		  Else
		    SharedModTools.SaveModLoadout(Self.pop_SavedLoadouts.SelectedRowText)
		  End
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_LoadLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex<>0) Then
		    SharedModTools.LoadModLoadout(Self.pop_SavedLoadouts.SelectedRowText)
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pop_SavedLoadouts
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  If(Me.SelectedRowIndex=0) Then
		    Self.btn_LoadLoadout.Enabled= False
		    Self.btn_DeleteLoadout.Enabled= False
		  Else
		    Self.btn_LoadLoadout.Enabled= True
		    Self.btn_DeleteLoadout.Enabled= True
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_DeleteLoadout
	#tag Event
		Sub Pressed()
		  If(Self.pop_SavedLoadouts.SelectedRowIndex<>0) Then
		    App.configsFolder.Child(Self.pop_SavedLoadouts.SelectedRowText+".txt").Remove
		    Self.pop_SavedLoadouts.RemoveRowAt(Self.pop_SavedLoadouts.SelectedRowIndex)
		    Self.pop_SavedLoadouts.SelectedRowIndex= 0
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Toggle
	#tag Event
		Sub Pressed()
		  If(Self.lsb_ModOrderList.SelectedRowIndex<>-1) Then
		    SharedModTools.ToggleMod
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  base.AddMenu(New MenuItem("Toggle All OFF"))
		  base.AddMenu(New MenuItem("Toggle All ON"))
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Text
		  Case "Toggle All OFF"
		    SharedModTools.ToggleAllMods(False)
		  Case "Toggle All ON"
		    SharedModTools.ToggleAllMods(True)
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_PlaySkyrim
	#tag Event
		Sub Pressed()
		  Utils.ShellCommand("steam steam://rungameid/489830",False,True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_MoveUp
	#tag Event
		Sub Pressed()
		  SharedModTools.MoveModOrder(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_Install
	#tag Event
		Sub Pressed()
		  
		  Var selectedZipMod As FolderItem= Utils.SelectTargetDialog("home",False)
		  
		  If(selectedZipMod<>Nil) Then
		    Var installed As Boolean= SkyrimModHandler.InstallMod(selectedZipMod)
		    
		    If(installed) Then
		      Utils.GeneratePopup(1,selectedZipMod.Name + " was Installed!","(Probably)")
		    Else
		      Utils.GeneratePopup(3,selectedZipMod.Name + " Failed!",_
		      "Please check the file is an actual zip and ensure it is in a not privileged place!")
		    End
		  End
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  base.AddMenu(New MenuItem("Batch Install"))
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Text
		  Case "Batch Install"
		    Var zippedModsFolder As folderitem= Utils.SelectTargetDialog("home", True)
		    If(zippedModsFolder<>Nil) Then
		      SkyrimModHandler.BatchInstallMods(zippedModsFolder)
		    End
		  End Select
		  
		  Return True
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btn_MoveDown
	#tag Event
		Sub Pressed()
		  SharedModTools.MoveModOrder(False)
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
