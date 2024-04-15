extends Node2D



func _on_continue_button_pressed():
	Signale.emit_signal("continueButton")


func _on_settings_button_pressed():
	$InputSettings.visible = true
	$Panel.visible = false


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_back_button_pressed():
	$InputSettings.visible = false
	$Panel.visible = true
	
