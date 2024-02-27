extends Label



func _process(delta):
	self.text = "P1 Lives: " + str(GameState.p1lives)
