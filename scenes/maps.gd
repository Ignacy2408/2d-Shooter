extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		
	if GameState.gameOver == 0||GameState.gameOver == 2||GameState.gameOver == 3:
		GameState.p1lives = GameState.p1lives
		GameState.p2lives = GameState.p2lives
		
		
	
	if Input.is_action_just_pressed("inGameMenu"):
		$GUI/inGameMenu.visible = true
		Engine.time_scale = 0
		
	if GameState.p1lives == 0:
		
		if GameState.gameOver == 0:
			$GameOverLabel.visible = true
			$p2Wins.visible = true
			$p1Wins.visible = false
			$GameOverTimer.start()
			print("timer start")
			GameState.gameOver = 3
		
	elif GameState.p2lives == 0:
		if GameState.gameOver == 2:
			$GameOverLabel.visible = true
			$p1Wins.visible = true
			$p2Wins.visible = false
			$GameOverTimer.start()
			print("timer start")
			GameState.gameOver = 3
		print(GameState.gameOver)
		
		



func _ready():
	Signals.connect("con", con)

func con():
	$GUI/inGameMenu.visible = false
	Engine.time_scale = 1


func _on_game_over_timer_timeout():
	print("timer stop")
	GameState.start_over()
	$GameOverLabel.visible = false
	$p1Wins.visible = false
	$p2Wins.visible = false
