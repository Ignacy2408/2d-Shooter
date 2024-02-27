extends Node2D

@export var player1_tscn: PackedScene 



func _process(_delta):
	if (GameState.p1alive == false && GameState.p1lives > 0):
		var new_player1 = player1_tscn.instantiate()
		self.add_child(new_player1)
		GameState.p1alive = true
