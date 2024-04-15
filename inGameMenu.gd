extends Node2D




func _on_continue_button_pressed():
	pass


func _on_settings_button_pressed():
	$InputSettings.visible = true


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_back_button_pressed():
	$InputSettings.visible = false
