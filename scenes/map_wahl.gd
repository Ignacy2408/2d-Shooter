extends Node2D



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func _on_map_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps.tscn")


func _on_map_2s_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps2.tscn")
