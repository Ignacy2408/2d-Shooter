extends Node2D

const boxPath = preload('res://scenes/gun_box.tscn')
@export var underBoundry = 2
@export var upperBoundry = 8

var randTimeSpawn = randi()%(upperBoundry-(underBoundry-1))+ underBoundry
var randPos = randi()%(3-(0-1))+0



#positionen:
#169, 124	978, 125
#195, 459	959, 460



# Called when the node enters the scene tree for the first time.
func _ready():

	$BoxSpawnTimer.wait_time = 0.01
	$BoxSpawnTimer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randTimeSpawn = randi()%(upperBoundry-(underBoundry-1))+ underBoundry
	randPos = randi()%(3-(0-1))+0
	if Input.is_action_just_pressed("testBox"):
		var box = boxPath.instantiate()
		get_parent().add_child(box)
		if GameState.gameState == 0||GameState.gameState == 2||GameState.gameState == 3:
			$BoxSpawnTimer.wait_time = randTimeSpawn
			$BoxSpawnTimer.start()
		


func _on_box_spawn_timer_timeout():
	var box = boxPath.instantiate()
	box.position.x = -1500
	box.position.y = -1500
	
	#get_parent().add_child(box)
	
	
	if randPos == 0 && GameState.Box0Free:
		if GameState.m1 == true:
			box.position.x = 169
			box.position.y = 125
		elif GameState.m2 == true:
			box.position.x = 1030
			box.position.y = 220
		elif GameState.m3 == true:
			box.position.x = 150
			box.position.y = 315
		elif GameState.m4 == true:
			box.position.x = 260
			box.position.y = 265
		
		box.thisBox = "Pos0"
		GameState.Box0Free = false
		print("Pos0")
	elif randPos == 1 && GameState.Box1Free:
		if GameState.m1 == true:
			box.position.x = 978
			box.position.y = 125
		elif GameState.m2 == true:
			box.position.x = 120
			box.position.y = 220
		elif GameState.m3 == true:
			box.position.x = 1000
			box.position.y = 315
		elif GameState.m4 == true:
			box.position.x = 890
			box.position.y = 265
		
		box.thisBox = "Pos1"
		GameState.Box1Free = false
		print("Pos1")
	elif randPos == 2 && GameState.Box2Free:
		if GameState.m1 == true:
			box.position.x = 195
			box.position.y = 460
		elif GameState.m2 == true:
			box.position.x = 745
			box.position.y = 555
		elif GameState.m3 == true:
			box.position.x = 790
			box.position.y = 505
		elif GameState.m4 == true:
			box.position.x = 360
			box.position.y = 555
		
		box.thisBox = "Pos2"
		GameState.Box2Free = false
		print("Pos2")
	elif randPos == 3 && GameState.Box3Free:
		if GameState.m1 == true:
			box.position.x = 959
			box.position.y = 460
		elif GameState.m2 == true:
			box.position.x = 420
			box.position.y = 555
		elif GameState.m3 == true:
			box.position.x = 370
			box.position.y = 505
		elif GameState.m4 == true:
			box.position.x = 800
			box.position.y = 555
		
		box.thisBox = "Pos3"
		GameState.Box3Free = false
		print("Pos3")
	else:
		box.queue_free()
	self.add_child(box)
	box.name = box.name + "GunBox"
	
	
	
	$BoxSpawnTimer.wait_time = randTimeSpawn
	$BoxSpawnTimer.start()
	
	
