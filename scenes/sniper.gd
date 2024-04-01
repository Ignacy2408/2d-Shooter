extends Node2D

@onready var sniper_graphic = $SniperGraphic


func _on_gun_box_body_entered(body):
	if (body.name == "Player1"||body.name == "Player2"):
		queue_free()
		
	
	
	
func _process(delta):
	
	if GameState.p1alive == false:
		queue_free()
		
	if GameState.p1direction == false:
		sniper_graphic.flip_h = true
	elif GameState.p1direction:
		sniper_graphic.flip_h = false
	
		

