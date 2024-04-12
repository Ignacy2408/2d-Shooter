extends Node2D

@export var player2_tscn: PackedScene 
@export var sniper_tscn: PackedScene



func _on_gun_box_body_entered(body):
	pass





func _process(_delta):
	var new_player2 = player2_tscn.instantiate()
	if (GameState.p2alive == false && GameState.p2lives > 0):
		self.add_child(new_player2)
		new_player2.position.x = 562
		new_player2.position.y = -115
		GameState.p2alive = true
	if GameState.p2entered == true && GameState.p2HasGun == true:
		GameState.gunPosession = ""
		var new_p2Gun = sniper_tscn.instantiate()
		self.add_child(new_p2Gun)
		new_p2Gun.position.x = GameState.p2PosX
		new_p2Gun.position.y = GameState.p2PosY
		new_p2Gun.thisSniper = "Player 2"
		
		
		GameState.p2entered = false
		
		
