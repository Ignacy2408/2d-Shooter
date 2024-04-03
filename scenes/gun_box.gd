extends Area2D



func _on_body_entered(body):

	if body.name == "Player1":
		GameState.p1entered = true
		GameState.p1HasGun = true
		print("P1 has Gun")
		print(GameState.p1HasGun)
		queue_free()
		

	if body.name == "Player2":
		GameState.p2entered = true
		GameState.p2HasGun = true
		queue_free()



