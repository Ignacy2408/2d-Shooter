extends CharacterBody2D


var SPEED = 400.0
const JUMP_VELOCITY = -750.0
@onready var sprite_2d = $Frog_Character
@export var changeSpeed = 150
var alive = true;
var current_weapon: Node2D
var recieves_knockback = false
var second_jump = false
var third_jump = false
var jump_item = false
var shild = false
var knockback = 0
var knockback_direction = 1
#@onready var weapons: Node2D = get_node("Weapons/Sniper")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _ready() -> void:
#	current_weapon = weapons.get_child(0)

func _ready():
	$KnockbackTimer.wait_time = 0.5
	
	$SpeedItemP1.wait_time = 3
	$JumpItemP1.wait_time = 10
	$Shild.wait_time = 10
	
	Signals.connect("p1Speed", p1Speed)
	Signals.connect("p1Jump", p1Jump)
	Signals.connect("p1Shild", p1Shild)
	

func p1Speed():
	SPEED = 800
	$SpeedItemP1.start()

func p1Jump():
	jump_item = true
	third_jump = true
	$JumpItemP1.start()

func p1Shild():
	shild = true
	$Shild.start()

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
		if Input.is_action_just_pressed("p1Jump") && second_jump == true:
			velocity.y = JUMP_VELOCITY
			second_jump = false
		elif Input.is_action_just_pressed("p1Jump") && third_jump == true:
			velocity.y = JUMP_VELOCITY
			third_jump = false
		

	# Handle jump.
	if Input.is_action_just_pressed("p1Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		second_jump = true
		if jump_item == true:
			third_jump = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p1Left", "p1Right")
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
	
	
	
	
	
	
	GameState.p1PosX = self.position.x
	GameState.p1PosY = self.position.y
	
	if self.position.y > 750 || self.position.x > 1500 || self.position.x < -500:
		GameState.p1alive = false
		GameState.p1HasGun = false
		GameState.p1NeedsGun = false
		if GameState.p1lives == 1:
			GameState.gameState = 0
		GameState.p1lives -= 1
		print(GameState.p1lives)
		
		queue_free()
	if (velocity.x < 0):
		GameState.p1direction = false
	elif (velocity.x > 0): 
		GameState.p1direction = true
		
	if recieves_knockback == true:
		if shild == true:
			position.x += knockback * delta * 0.75
		else:
			wposition.x += knockback * delta
		knockback -= 20 * knockback_direction
		
	
	
func recieve_knockback(direction: int ,knockback_strength: int):
	
	knockback_direction = direction
	print(direction)
	if shild == true:
		knockback = knockback_direction * knockback_strength * 0.75
	else:
		knockback = knockback_direction * knockback_strength
	recieves_knockback = true
	print(recieves_knockback)
	$KnockbackTimer.start()
	


func _on_knockback_timer_timeout():
	recieves_knockback = false
	


func _on_speed_item_p_1_timeout():
	SPEED = 400


func _on_jump_item_p_1_timeout():
	jump_item = false
	third_jump = false
	


func _on_shild_timeout():
	shild = false
