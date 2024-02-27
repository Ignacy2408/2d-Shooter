extends Node2D



func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
