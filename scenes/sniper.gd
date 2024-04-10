extends Node2D
const bulletPath = preload('res://scenes/Bullet.tscn')
@onready var sniper_graphic = $SniperGraphic
var gun_posession




func _on_gun_box_body_entered(body):
	if (body.name == "Player1"||body.name == "Player2"):
		queue_free()
		
	
	
	
func _process(delta):

	
	if GameState.gunPosession == "Player 1":
		
		if GameState.p1direction == false:
			sniper_graphic.flip_h = true
		elif GameState.p1direction:
			sniper_graphic.flip_h = false
			
		
		if (GameState.p1alive == true && GameState.p1HasGun == true):
			self.position.x = GameState.p1PosX
			self.position.y = GameState.p1PosY + 15
		if GameState.p1alive == false:
			queue_free()
		if Input.is_action_just_pressed('p1Shoot'):
			shoot()


func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	if sniper_graphic.flip_h == true:
		bullet.position.y = sniper_graphic.position.y - 5
	elif sniper_graphic.flip_h == false:
		bullet.position.y = sniper_graphic.position.y + 5

