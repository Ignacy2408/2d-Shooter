extends Area2D

var thisBox = ""


func _on_body_entered(body):


	if thisBox == "Pos0":
		GameState.Box0Free = true
	elif thisBox == "Pos1":
		GameState.Box1Free = true
	elif thisBox == "Pos2":
		GameState.Box2Free = true
	elif thisBox == "Pos3":
		GameState.Box3Free = true
		
	if body.name == "Player1":
		GameState.p1entered = true
		GameState.p1NeedsGun = true
		print("P1 has Gun")
		print(GameState.p1HasGun)
		queue_free()
		
		

	if body.name == "Player2":
		GameState.p2entered = true
		GameState.p2NeedsGun = true
		queue_free()



