extends Node2D

@export var player1_tscn: PackedScene 
@export var guns_tscn: PackedScene

func _on_gun_box_body_entered(body):
	pass




func _process(_delta):
	if (GameState.p1alive == false && GameState.p1lives > 0):
		var new_player1 = player1_tscn.instantiate()
		self.add_child(new_player1)
		new_player1.position.x = 562
		new_player1.position.y = -115
		GameState.p1alive = true
		
#	if (GameState.p1HasGun == false && GameState.p1entered == true):
#		var new_p1Gun = guns_tscn.instantiate()
#		self.add_child(new_p1Gun)
		



