extends Node2D



func _on_quit_button_pressed():
	get_tree().quit()


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map_wahl.tscn")




func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings_scene.tscn")

signal continue1
