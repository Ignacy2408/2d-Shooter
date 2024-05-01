extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Player 1
	Signals.connect("p1Jump", p1Jump)
	Signals.connect("p1Speed", p1Speed)
	Signals.connect("p1Shild", p1Shild)
	Signals.connect("p1Heart", p1Heart)
	$MarginContainer/HBoxContainer/HBoxContainer1/Heart/HeartVisible.wait_time = 3
	
	Signals.connect("p1JumpOver", p1JumpOver)
	Signals.connect("p1SpeedOver", p1SpeedOver)
	Signals.connect("p1ShildOver", p1ShildOver)
	
	
	#Player 2
	Signals.connect("p2Jump", p2Jump)
	Signals.connect("p2Speed", p2Speed)
	Signals.connect("p2Shild", p2Shild)
	Signals.connect("p2Heart", p2Heart)
	$MarginContainer/HBoxContainer/HBoxContainer2/Heart/HeartVisible2.wait_time = 3
	
	Signals.connect("p2JumpOver", p2JumpOver)
	Signals.connect("p2SpeedOver", p2SpeedOver)
	Signals.connect("p2ShildOver", p2ShildOver)

#Plyer 1
func p1Jump():
	$MarginContainer/HBoxContainer/HBoxContainer1/Jump.visible = true

func p1Speed():
	$MarginContainer/HBoxContainer/HBoxContainer1/Speed.visible = true

func p1Shild():
	$MarginContainer/HBoxContainer/HBoxContainer1/Shild.visible = true

func p1Heart():
	$MarginContainer/HBoxContainer/HBoxContainer1/Heart.visible = true
	$MarginContainer/HBoxContainer/HBoxContainer1/plus1.visible = true
	$MarginContainer/HBoxContainer/HBoxContainer1/Heart/HeartVisible.start()

func p1JumpOver():
	$MarginContainer/HBoxContainer/HBoxContainer1/Jump.visible = false

func p1SpeedOver():
	$MarginContainer/HBoxContainer/HBoxContainer1/Speed.visible = false

func p1ShildOver():
	$MarginContainer/HBoxContainer/HBoxContainer1/Shild.visible = false

#Player 2
func p2Jump():
	$MarginContainer/HBoxContainer/HBoxContainer2/Jump.visible = true

func p2Speed():
	$MarginContainer/HBoxContainer/HBoxContainer2/Speed.visible = true

func p2Shild():
	$MarginContainer/HBoxContainer/HBoxContainer2/Shild.visible = true

func p2Heart():
	$MarginContainer/HBoxContainer/HBoxContainer2/Heart.visible = true
	$MarginContainer/HBoxContainer/HBoxContainer2/plus1.visible = true
	$MarginContainer/HBoxContainer/HBoxContainer2/Heart/HeartVisible2.start()

func p2JumpOver():
	$MarginContainer/HBoxContainer/HBoxContainer2/Jump.visible = false

func p2SpeedOver():
	$MarginContainer/HBoxContainer/HBoxContainer2/Speed.visible = false

func p2ShildOver():
	$MarginContainer/HBoxContainer/HBoxContainer2/Shild.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_heart_visible_timeout():
	$MarginContainer/HBoxContainer/HBoxContainer1/Heart.visible = false
	$MarginContainer/HBoxContainer/HBoxContainer1/plus1.visible = false


func _on_heart_visible_2_timeout():
	$MarginContainer/HBoxContainer/HBoxContainer2/Heart.visible = false
	$MarginContainer/HBoxContainer/HBoxContainer2/plus1.visible = false
