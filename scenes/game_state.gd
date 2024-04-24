extends Node

var p1alive = true
var p2alive = true
var p1lives = 10
var p2lives = 10
var p1HasGun = false
var p2HasGun = false
var p1entered = false
var p2entered = false
var p1direction = true
var p2direction = true
var p1PosX = 0
var p1PosY = 0
var p2PosX = 0
var p2PosY = 0
var gunPosession = ""
var gamePaused = false
var Box0Free = true
var Box1Free = true
var Box2Free = true
var Box3Free = true
var p1NeedsGun = false
var p2NeedsGun = false
var gameState = 1
var p1Winner = false
var p2Winner = false
func _process(_delta):
	pass
	
func start_over():
	print("start over")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	p1alive = true
	p2alive = true
	p1lives = 10
	p2lives = 10
	p1PosX = 500
	p1PosY = -115
	p2PosX = 600
	p2PosY = -115
	p1Winner = false
	p2Winner = false
	gameState = 1
