extends CharacterBody2D

@export var bullet_speed = 500
var right = true
func _ready(): 
	pass

func _process(delta):
	if right == true:
		self.position.x +=  bullet_speed * delta
	elif right == false:
		self.position.x += -1 * bullet_speed * delta
