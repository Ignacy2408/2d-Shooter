extends Node2D

@export var player1_tscn: PackedScene 
@export var weapon_tscn: PackedScene





func _on_gun_box_body_entered(body):
	pass





func _process(_delta):
	
	
	#P1
	var new_player1 = player1_tscn.instantiate()
	if (GameState.p1alive == false && GameState.p1lives > 0):
		
		self.add_child(new_player1)
		new_player1.position.x = 562
		new_player1.position.y = -115
		GameState.p1alive = true
	if GameState.p1entered == true && GameState.p1NeedsGun == true:
		
		var randNumb = randi()%(3-(0-1))+0
		var new_p1Gun = weapon_tscn.instantiate()
		self.add_child(new_p1Gun)
		GameState.p1NeedsGun = false
		GameState.p1HasGun = true
		new_p1Gun.position.x = GameState.p1PosX
		new_p1Gun.position.y = GameState.p1PosY - 900
		new_p1Gun.thisGun = "Player 1"
		
		
		if randNumb == 0:
			new_p1Gun.gunType = "Sniper"
			new_p1Gun.YOffset = 16
			new_p1Gun.XOffset = 0
		elif randNumb == 1:
			new_p1Gun.gunType = "AR"
			new_p1Gun.YOffset = 18
			new_p1Gun.XOffset = 0
		elif randNumb == 2:
			new_p1Gun.gunType = "SMG"
			new_p1Gun.YOffset = 18
			new_p1Gun.XOffset = 0
		elif randNumb == 3:
			new_p1Gun.gunType = "Pistol"
			new_p1Gun.YOffset = 18
			new_p1Gun.XOffset = 20
			
		print(new_p1Gun.gunType)
		
		
		GameState.p1entered = false
		
		

		

		
#	if (GameState.p1HasGun == false && GameState.p1entered == true):
#		var new_p1Gun = guns_tscn.instantiate()
#		self.add_child(new_p1Gun)
		



