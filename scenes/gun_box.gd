extends Area2D



func _on_body_entered(body):
	if (body.name == "Player1"||body.name == "Player2"):
		queue_free()
	if body.name == "Player1":
		GameState.p1entered = true
	if body.name == "Player2":
		GameState.p2entered = true
