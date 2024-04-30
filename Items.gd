extends Node2D


var randItem = randi()%(3-(0-1))+0


func _ready():
	if randItem == 0:
		$CollisionShape2D/Shild.visible = true
		$CollisionShape2D/Speed.visible = false
		$CollisionShape2D/Heart.visible = false
		$CollisionShape2D/jump.visible = false
		GameState.Item = "Shild"
	if randItem == 1:
		$CollisionShape2D/Shild.visible = false
		$CollisionShape2D/Speed.visible = true
		$CollisionShape2D/Heart.visible = false
		$CollisionShape2D/jump.visible = false
		GameState.Item = "Speed"
	if randItem == 2:
		$CollisionShape2D/Shild.visible = false
		$CollisionShape2D/Speed.visible = false
		$CollisionShape2D/Heart.visible = true
		$CollisionShape2D/jump.visible = false
		GameState.Item = "Heart"
	if randItem == 3:
		$CollisionShape2D/Shild.visible = false
		$CollisionShape2D/Speed.visible = false
		$CollisionShape2D/Heart.visible = false
		$CollisionShape2D/jump.visible = true 
		GameState.Item = "jump"
	



var thisBox = ""

func _on_body_entered(body):



	if thisBox == "ItemPos0":
		GameState.ItemBox0Free = true
	elif thisBox == "ItemPos1":
		GameState.ItemBox1Free = true
	elif thisBox == "ItemPos2":
		GameState.ItemBox2Free = true
	elif thisBox == "ItemPos3":
		GameState.ItemBox3Free = true
		

	if randItem == 2:
		if body.name == "Player1":
			GameState.p1lives += 1
		elif body.name == "Player2":
			GameState.p2lives += 1

	print("Item aufgesammelt")

	if randItem == 1:
		if body.name == "Player1":
			Signals.emit_signal("p1Speed")
		elif body.name == "Player2":
			Signals.emit_signal("p2Speed")
	
	if randItem == 3:
		if body.name == "Player1":
			Signals.emit_signal("p1Jump")
		elif body.name == "Player2":
			Signals.emit_signal("p2Jump")
			
	
	if randItem == 0:
		if body.name == "Player1":
			Signals.emit_signal("p1Shild")
		elif body.name == "Player2":
			Signals.emit_signal("p2Shild")
			
	
	if body.name == "Player1" || "Player2":
		queue_free()
	
	







