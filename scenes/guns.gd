extends Node2D


func _process(_delta):
	pass


func _on_gun_box_body_entered(body):
	if (body.name == "Player1"||body.name == "Player2"):
		queue_free()
