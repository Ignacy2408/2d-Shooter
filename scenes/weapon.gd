extends Node2D
const bulletPath = preload('res://scenes/Bullet.tscn')

@onready var sniper_graphic = $SniperGraphic
@onready var ar_graphic = $ARGraphic
@onready var smg_graphic = $SMGGraphic
@onready var pistol_graphic = $PistolGraphic

var gun_posession
var p1ReadyToShoot = true
var p2ReadyToShoot = true
@onready var thisGun = ""
@onready var gunType = ""

var XOffset = 0
var YOffset = 0
var gunDirection = 1



func _on_gun_box_body_entered(body):
	if body.name == "Player 1":
		if thisGun == "Player 1":
			queue_free()
	elif body.name == "Player 2":
		if thisGun == "Player 2":
			queue_free()
		
	
	
	
func _process(delta):


	if gunType == "Sniper":
		sniper_graphic.visible = true
		ar_graphic.visible = false
		smg_graphic.visible = false
		pistol_graphic.visible = false
		$p1ReloadTimer.wait_time = 0.7
	elif gunType == "AR":
		sniper_graphic.visible = false
		ar_graphic.visible = true
		smg_graphic.visible = false
		pistol_graphic.visible = false
		$p1ReloadTimer.wait_time = 0.3
	elif gunType == "SMG":
		sniper_graphic.visible = false
		ar_graphic.visible = false
		smg_graphic.visible = true
		pistol_graphic.visible = false
		$p1ReloadTimer.wait_time = 0.1
	elif gunType == "Pistol":
		sniper_graphic.visible = false
		ar_graphic.visible = false
		smg_graphic.visible = false
		pistol_graphic.visible = true
		$p1ReloadTimer.wait_time = 0.4

#P1
	if thisGun == "Player 1":
		
		if Input.is_action_just_pressed('p1Shoot') && p1ReadyToShoot == true:
			p1ReadyToShoot = false
			shoot("p1")
			$p1ReloadTimer.start()
			
		if GameState.p1direction == false:
			sniper_graphic.flip_h = true
			ar_graphic.flip_h = true
			smg_graphic.flip_h = true
			pistol_graphic.flip_h = true
			gunDirection = -1
		elif GameState.p1direction:
			sniper_graphic.flip_h = false
			ar_graphic.flip_h = false
			smg_graphic.flip_h = false
			pistol_graphic.flip_h = false
			gunDirection = 1
		
		if (GameState.p1alive == true && GameState.p1HasGun == true):
			self.position.x = GameState.p1PosX + (XOffset*gunDirection)
			self.position.y = GameState.p1PosY + YOffset
		if GameState.p1alive == false:
			queue_free()
#P2
	elif thisGun == "Player 2":
		
		if Input.is_action_just_pressed('p2Shoot') && p2ReadyToShoot == true:
			p2ReadyToShoot = false
			shoot("p2")
			$p2ReloadTimer.start()
		if GameState.p2direction == false:
			sniper_graphic.flip_h = true
			ar_graphic.flip_h = true
			smg_graphic.flip_h = true
			pistol_graphic.flip_h = true
			gunDirection = -1
		elif GameState.p2direction:
			sniper_graphic.flip_h = false
			ar_graphic.flip_h = false
			smg_graphic.flip_h = false
			pistol_graphic.flip_h = false
			gunDirection = 1
			
		
		if (GameState.p2alive == true && GameState.p2HasGun == true):
			self.position.x = GameState.p2PosX + (XOffset*gunDirection)
			self.position.y = GameState.p2PosY + YOffset
		if GameState.p2alive == false:
			queue_free()



func shoot(playerType):
#P1
	var bullet = bulletPath.instantiate()
	if playerType == "p1":
		bullet.position.y = GameState.p1PosY + YOffset - 5
		
		if GameState.p1direction == true:
			bullet.position.x = GameState.p1PosX + 30
			bullet.right = true
		
		elif GameState.p1direction == false:
		
			bullet.position.x = GameState.p1PosX - 30
			bullet.right = false
#P2
	elif playerType == "p2":
		bullet.position.y = GameState.p2PosY + YOffset - 5
		if GameState.p2direction == true:
			bullet.position.x = GameState.p2PosX + 30
			bullet.right = true
		
		elif GameState.p2direction == false:
		
			bullet.position.x = GameState.p2PosX - 30
			bullet.right = false
	get_parent().add_child(bullet)



func _on_reload_timer_timeout():
	if thisGun == "Player 1":
		p1ReadyToShoot = true



func _on_p_2_reload_timer_timeout():
	if thisGun == "Player 2":
		p2ReadyToShoot = true


func _on_area_2d_area_entered(area):
	if area.name == "GunBox"|| area.name == "GunBox2":
		queue_free()
