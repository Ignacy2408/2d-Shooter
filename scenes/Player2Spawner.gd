extends Node2D

@export var player2_tscn: PackedScene 
@export var weapon_tscn: PackedScene



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
		
		
		var new_p2Gun = weapon_tscn.instantiate()
		self.add_child(new_p2Gun)
		var randNumb = randi()%(3-(0-1))+0
		
		new_p2Gun.position.x = GameState.p2PosX
		new_p2Gun.position.y = GameState.p2PosY - 900
		new_p2Gun.thisGun = "Player 2"
		
		if randNumb == 0:
			new_p2Gun.gunType = "Sniper"
			new_p2Gun.YOffset = 16
			new_p2Gun.XOffset = 0
		elif randNumb == 1:
			new_p2Gun.gunType = "AR"
			new_p2Gun.YOffset = 18
			new_p2Gun.XOffset = 0
		elif randNumb == 2:
			new_p2Gun.gunType = "SMG"
			new_p2Gun.YOffset = 18
			new_p2Gun.XOffset = 0
		elif randNumb == 3:
			new_p2Gun.gunType = "Pistol"
			new_p2Gun.YOffset = 18
			new_p2Gun.XOffset = 20
		print(new_p2Gun.gunType)
		
		
		GameState.p2entered = false
		
		
