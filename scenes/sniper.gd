extends Node2D
const bulletPath = preload('res://scenes/Bullet.tscn')

@onready var sniper_graphic = $SniperGraphic

var gun_posession
@onready var thisSniper = ""



func _on_gun_box_body_entered(body):
	if body.name == "Player 1":
		if thisSniper == "Player 1":
			queue_free()
	elif body.name == "Player 2":
		if thisSniper == "Player 2":
			queue_free()
		
	
	
	
func _process(delta):


#P1
	if thisSniper == "Player 1":
		
		if Input.is_action_just_pressed('p1Shoot'):
			shoot("p1")
		if GameState.p1direction == false:
			sniper_graphic.flip_h = true
		elif GameState.p1direction:
			sniper_graphic.flip_h = false
			
		
		if (GameState.p1alive == true && GameState.p1HasGun == true):
			self.position.x = GameState.p1PosX
			self.position.y = GameState.p1PosY + 15
		if GameState.p1alive == false:
			queue_free()
#P2
	elif thisSniper == "Player 2":
		
		if Input.is_action_just_pressed('p2Shoot'):
			shoot("p2")
		if GameState.p2direction == false:
			sniper_graphic.flip_h = true
		elif GameState.p2direction:
			sniper_graphic.flip_h = false
			
		
		if (GameState.p2alive == true && GameState.p2HasGun == true):
			self.position.x = GameState.p2PosX
			self.position.y = GameState.p2PosY + 15
		if GameState.p2alive == false:
			queue_free()



func shoot(playerType):
#P1
	var bullet = bulletPath.instantiate()
	if playerType == "p1":
		bullet.position.y = GameState.p1PosY + 10
		
		if GameState.p1direction == true:
			bullet.position.x = GameState.p1PosX + 30
			bullet.right = true
		
		elif GameState.p1direction == false:
		
			bullet.position.x = GameState.p1PosX - 30
			bullet.right = false
#P2
	elif playerType == "p2":
		bullet.position.y = GameState.p2PosY + 10
		if GameState.p2direction == true:
			bullet.position.x = GameState.p2PosX + 30
			bullet.right = true
		
		elif GameState.p2direction == false:
		
			bullet.position.x = GameState.p2PosX - 30
			bullet.right = false
	get_parent().add_child(bullet)

