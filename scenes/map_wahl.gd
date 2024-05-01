extends Node2D



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_map_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps.tscn")
	GameState.m1 = true


func _on_map_2s_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps2.tscn")
	GameState.m2 = true

func _on_map_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps3.tscn")
	GameState.m3 = true

func _on_map_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps4.tscn")
	GameState.m4 = true
