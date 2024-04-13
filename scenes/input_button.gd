extends Button


@onready var input_button_scene = preload("res://scenes/input_button.tscn")

@onready var action_list = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList


var is_remapping = false
var action_to_remap = null
var remapping_button = null

var input_actions = {
	"p1Jump": "P1 Jump",
	"p1Left": "P1 Left",
	"p1Right": "P1 Right",
	"p1shoot": "P1 Shoot",
	"p2Jump": "P2 Jump",
	"p2Left": "P2 Left",
	"p2Right": "P2 Right",
	"p2Shoot": "P2 Shoot",
	"Quit": "Quit",
}

func _ready():
	_create_action_list()


func _create_action_list():
	InputMap.load_from_project_settings()
	for item in action_list.get_children():
		item.queue_free()
	
	for action in input_actions:
		var button = input_button_scene.instantiate()
		var action_label = button.find_child("LabelAction")
		var input_label = button.find_child("LabelInput")
		
		action_label.text = input_actions[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			input_label.text = events[0].as_text()
		else:
			input_label.text = ""
		
		action_list.add_child(button)
	

