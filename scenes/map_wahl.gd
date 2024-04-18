extends Node2D



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func _on_map_1_button_pressed():
	Signals.emit_signal("map1")
	get_tree().change_scene_to_file("res://scenes/maps.tscn")



func _on_map_2s_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps.tscn")
	Signals.emit_signal("map2")


func _on_map_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps3.tscn")
	Signals.emit_signal("map3")


func _on_map_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/maps4.tscn")
	Signals.emit_signal("map4")

