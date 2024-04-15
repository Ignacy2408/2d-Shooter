extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		
	
	if Input.is_action_just_pressed("inGameMenu"):
		$GUI/inGameMenu.visible = true
		Engine.time_scale = 0



#func _ready():
#	var ka = get_node("/root/main")
#	ka.connect("continue1", self, "_on_continue1")

func _on_continue1():
	$GUI/inGameMenu.visible = false
	Engine.time_scale = 1
