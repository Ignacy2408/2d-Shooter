extends Node2D

const ItemboxPath = preload('res://scenes/items.tscn')
@export var underBoundry = 10
@export var upperBoundry = 20

var randTimeSpawn = randi()%(upperBoundry-(underBoundry-1))+ underBoundry
var randPos = randi()%(3-(0-1))+0



#positionen:
#169, 124	978, 125
#195, 459	959, 460



# Called when the node enters the scene tree for the first time.
func _ready():

	$ItemBoxTimer.wait_time = 0.01
	$ItemBoxTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randTimeSpawn = randi()%(upperBoundry-(underBoundry-1))+ underBoundry
	randPos = randi()%(3-(0-1))+0
	if Input.is_action_just_pressed("testBox"):
		var Itembox = ItemboxPath.instantiate()
		get_parent().add_child(Itembox)
		if GameState.gameState == 0||GameState.gameState == 2||GameState.gameState == 3:
			$ItemBoxTimer.wait_time = randTimeSpawn
			$ItemBoxTimer.start()
		


func _on_item_box_timer_timeout():
	var Itembox = ItemboxPath.instantiate()
	Itembox.position.x = -1500
	Itembox.position.y = -1500
	
	#get_parent().add_child(box)
	
	
	if randPos == 0 && GameState.ItemBox0Free:
		Itembox.position.x = 400
		Itembox.position.y = 360
		Itembox.thisBox = "ItemPos0"
		GameState.ItemBox0Free = false
		print("ItemPos0")
	elif randPos == 1 && GameState.ItemBox1Free:
		Itembox.position.x = 760
		Itembox.position.y = 360
		Itembox.thisBox = "ItemPos1"
		GameState.ItemBox1Free = false
		print("ItemPos1")
	elif randPos == 2 && GameState.ItemBox2Free:
		Itembox.position.x = 1050
		Itembox.position.y = 120
		Itembox.thisBox = "ItemPos2"
		GameState.ItemBox2Free = false
		print("ItemPos2")
	elif randPos == 3 && GameState.ItemBox3Free:
		Itembox.position.x = 100
		Itembox.position.y = 120
		Itembox.thisBox = "ItemPos3"
		GameState.ItemBox3Free = false
		print("ItemPos3")
	else:
		Itembox.queue_free()
	self.add_child(Itembox)
	
	
	
	

	
	
	
	$ItemBoxTimer.wait_time = randTimeSpawn
	$ItemBoxTimer.start()
	
	


