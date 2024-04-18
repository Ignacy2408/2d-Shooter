extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -750.0
@onready var sprite_2d = $Frog_Character
@export var changeSpeed = 150
var alive = true;
var current_weapon: Node2D
#@onready var weapons: Node2D = get_node("Weapons/Sniper")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _ready() -> void:
#	current_weapon = weapons.get_child(0)


func _physics_process(delta):
	
	#Animaitons
	
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else: 
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("p2Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p2Left", "p2Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, changeSpeed)

	move_and_slide()
	
	#var isLeft = velocity.x < 0
	#sprite_2d.flip_h = isLeft
	
	if (velocity.x < 0):
		sprite_2d.flip_h = true
	elif (velocity.x > 0): 
		sprite_2d.flip_h = false
		
		
func _process(delta):
	
	GameState.p2PosX = self.position.x
	GameState.p2PosY = self.position.y
	
	if self.position.y > 750 || self.position.x > 1500 || self.position.x < -500:
		GameState.p2alive = false
		GameState.p2HasGun = false
		GameState.p2lives -= 1
		print(GameState.p2lives)
		queue_free()
	if (velocity.x < 0):
		GameState.p2direction = false
	elif (velocity.x > 0): 
		GameState.p2direction = true
	
