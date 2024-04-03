##extends Button


##export var action: String = "ui_up"

##func _ready():
	##set_process_unhandled_key_input(false)
	##display_key()

##func display_key():
	##text = "%s" % InputMap.get_action_list(action)[0].as_text()






##func _on_toggled(toggled_on):
	##set_process_unhandeld_key_input(button_pressed)
	##if button_pressed:
		##text = "..."
	##else: 
		##display_key()

##func _unhandeled_key_input(event):
	##temap_key(event)
	##pressed = false

##func remap_key(event):
	##InputMap.action_erase_events(action)
	##InputMap.action_add_event(action, event)
	
	##text = "%s" % event.as_text()
