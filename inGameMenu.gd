extends Node2D



func _on_continue_button_pressed():
	Signals.emit_signal("con")



func _on_settings_button_pressed():
	$InputSettings.visible = true
	$Panel.visible = false


func _on_exit_button_pressed():
	Signals.emit_signal("con")
	GameState.start_over()




func _on_back_button_pressed():
	$InputSettings.visible = false
	$Panel.visible = true
	
