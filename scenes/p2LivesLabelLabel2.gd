extends Label

func _process(delta):
	self.text = "P2 Lives: " + str(GameState.p2lives)
