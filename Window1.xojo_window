#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   623495167
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin CodeBase.Controls.StatusIndicatorControl StatusIndicator
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BorderColor     =   &c00000000
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      IndicatorColor  =   &c00000000
      InitialParent   =   ""
      Left            =   550
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      UseFocusRing    =   True
      Visible         =   True
      Width           =   30
   End
   Begin PopupMenu StatusMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   325
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   213
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events StatusMenu
	#tag Event
		Sub Open()
		  Me.AddRow "Connected"
		  Me.AddRow "Disconnected"
		  Me.AddRow "Active"
		  Me.AddRow "Inactive"
		  Me.AddRow "Error"
		  Me.AddRow "Ready"
		  
		  Me.ListIndex = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "Connected"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_CONNECTED
		  Case "Disconnected"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_DISCONNECTED
		  Case "Active"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_ACTIVE
		  Case "Inactive"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_INACTIVE
		  Case "Error"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_ERROR
		  Case "Ready"
		    StatusIndicator.SetStatus StatusIndicator.STATUS_READY
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
