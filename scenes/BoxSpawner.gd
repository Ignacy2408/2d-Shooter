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
		box.position.x = 169
		box.position.y = 125
		box.thisBox = "Pos0"
		GameState.Box0Free = false
		print("Pos0")
	elif randPos == 1 && GameState.Box1Free:
		box.position.x = 978
		box.position.y = 125
		box.thisBox = "Pos1"
		GameState.Box1Free = false
		print("Pos1")
	elif randPos == 2 && GameState.Box2Free:
		box.position.x = 195
		box.position.y = 460
		box.thisBox = "Pos2"
		GameState.Box2Free = false
		print("Pos2")
	elif randPos == 3 && GameState.Box3Free:
		box.position.x = 959
		box.position.y = 460
		box.thisBox = "Pos3"
		GameState.Box3Free = false
		print("Pos3")
	else:
		box.queue_free()
	self.add_child(box)
	box.name = box.name + "GunBox"
	
	
	
	$BoxSpawnTimer.wait_time = randTimeSpawn
	$BoxSpawnTimer.start()
	
	
