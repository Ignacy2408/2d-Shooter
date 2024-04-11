extends Node2D

const boxPath = preload('res://scenes/gun_box.tscn')


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("testBox"):
		var box = boxPath.instantiate()
		get_parent().add_child(box)
		
