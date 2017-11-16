#tag Class
Protected Class StatusIndicatorControl
Inherits Canvas
	#tag Event
		Sub Open()
		  'Set the properties we require for this control.
		  Self.Transparent = True
		  Self.EraseBackground = True
		  Self.DoubleBuffer = False
		  
		  Self.BorderColor = Self.BORDER_DEFAULT
		  
		  'We set the initial status to StatusType.Disconnected
		  Self.SetStatus Self.STATUS_DISCONNECTED
		  
		  'Call the open event again from the created "Event Definition"
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'First we draw the border, that counts for all drawings.
		  
		  'Set the border color
		  g.ForeColor = Self.mBorderColor 
		  
		  'Set the border Width
		  g.PenWidth = 1
		  
		  'Draw the border (oval line)
		  g.DrawOval 0,0,Self.Width,Self.Height 
		  
		  If Self.mUseCustomColor = True Then
		    'If the user wants to use a custom color we draw it here.
		    
		    g.ForeColor = Self.mIndicatorColor
		    
		  Else
		    'We don't use the custom color. Here we use the Connected and Disconnected colors
		    
		    Select Case mStatus
		    Case Self.STATUS_ACTIVE
		      
		      g.ForeColor = Self.COLOR_ACTIVE
		      
		    Case Self.STATUS_CONNECTED
		      
		      g.ForeColor = Self.COLOR_CONNECTED
		      
		    Case Self.STATUS_DISCONNECTED
		      
		      g.ForeColor = Self.COLOR_DISCONNECTED
		      
		    Case Self.STATUS_ERROR
		      
		      g.ForeColor = Self.COLOR_ERROR
		      
		    Case Self.STATUS_INACTIVE
		      
		      g.ForeColor = Self.COLOR_INACTIVE
		      
		    Case Self.STATUS_READY
		      
		      g.ForeColor = Self.COLOR_READY
		      
		    End Select
		    
		  End If
		  
		  'We draw the indicator (round/oval)
		  g.FillOval 1,1,Self.Width-2,Self.Height-2
		End Sub
	#tag EndEvent

	#tag Event
		Sub ScaleFactorChanged()
		  'The control has been resized or changed.
		  'Let the system redraw it once it's ready to do so.
		  Self.Invalidate(True)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetStatus(Status As Integer)
		  If Status < 0 Then
		    Self.mStatus = STATUS_DISCONNECTED
		  Elseif Status > 5 Then
		    Self.mStatus = STATUS_DISCONNECTED
		  Else
		    Self.mStatus = Status
		  End If
		  
		  Self.Invalidate(True)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mBorderColor <> value Then
			    
			    Self.mBorderColor = value
			    
			    Self.Invalidate(True)
			    
			  End If
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mIndicatorColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If Self.mIndicatorColor <> Value Then
			    'We only execute the below code if the value changed.
			    
			    'We set the IndicatorColor color to the user-defined color
			    Self.mIndicatorColor = value
			    
			    'We tell the system that it may redraw the canvas and erase the background once it's ready.
			    Self.Invalidate(True)
			    
			  End If
			End Set
		#tag EndSetter
		IndicatorColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBorderColor As Color = &c999999
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndicatorColor As Color = &cFC6665
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUseCustomColor As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mUseCustomColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value <> Self.mUseCustomColor Then
			    'If the value has changed we do the following, othwerwise we do nothing.
			    
			    'We set the mUseCustomColor property
			    Self.mUseCustomColor = value
			    
			    'We tell the system that it may redraw the canvas and erase the background.
			    Self.Invalidate(True)
			    
			  End If
			End Set
		#tag EndSetter
		UseCustomColor As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = BORDER_DEFAULT, Type = Color, Dynamic = False, Default = \"&cB3B3B3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = COLOR_ACTIVE, Type = Color, Dynamic = False, Default = \"&c0F7FFE", Scope = Private
	#tag EndConstant

	#tag Constant, Name = COLOR_CONNECTED, Type = Color, Dynamic = False, Default = \"&c66FF66", Scope = Private
	#tag EndConstant

	#tag Constant, Name = COLOR_DISCONNECTED, Type = Color, Dynamic = False, Default = \"&cFC6665", Scope = Private
	#tag EndConstant

	#tag Constant, Name = COLOR_ERROR, Type = Color, Dynamic = False, Default = \"&cFB0106", Scope = Private
	#tag EndConstant

	#tag Constant, Name = COLOR_INACTIVE, Type = Color, Dynamic = False, Default = \"&cFDCC65", Scope = Private
	#tag EndConstant

	#tag Constant, Name = COLOR_READY, Type = Color, Dynamic = False, Default = \"&c107F01", Scope = Private
	#tag EndConstant

	#tag Constant, Name = STATUS_ACTIVE, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STATUS_CONNECTED, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STATUS_DISCONNECTED, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STATUS_ERROR, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STATUS_INACTIVE, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STATUS_READY, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="30"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndicatorColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Group="Behavior"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseCustomColor"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="30"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
