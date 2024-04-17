extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		
	
	if Input.is_action_just_pressed("inGameMenu"):
		$GUI/inGameMenu.visible = true
		Engine.time_scale = 0



func _ready():
	Signals.connect("con", con)

func con():
	$GUI/inGameMenu.visible = false
	Engine.time_scale = 1
