extends Area2D


@export var bullet_speed = 500
var right = true
var direction = Vector2.ZERO
var thisBullet
var dir = 1
var knockback_strength = 800
func _ready(): 
	self.name = name + "Bullet"

func _process(delta):
	
	

	if right == true:
		self.position.x +=  bullet_speed * delta
		dir = 1

	elif right == false:
		self.position.x += -1 * bullet_speed * delta
		dir = -1
		
	


func _on_area_entered(area):
	pass # Replace with function body.


func _on_body_entered(body):
	if thisBullet == "Player 1":
		#print("p1Bullet")p
		pass
	if thisBullet == "Player 1" && "Player2" in body.name:
		
		body.recieve_knockback(dir ,knockback_strength)
		
		print("p2Hit")
		queue_free()
		
	elif thisBullet == "Player 2" && "Player1" in body.name:
		body.recieve_knockback(dir,knockback_strength)
		queue_free()
		

	
		
