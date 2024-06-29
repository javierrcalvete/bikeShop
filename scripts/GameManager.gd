extends Node

@onready var score_label : Label = $ScoreLabel
@onready var habldeBarNode : Node2D = $"../BikeParts/Handlebar"
@onready var menu : Control = $Menu
@onready var bike_parts : Node = $"../BikeParts"


var name_bikePart_grabbed
#@onready var mud = $Mud
# var for check if mouse is grabbing something
var is_mouse_busy : bool = false
var score : int = 0
var clicks_mud = 0

func _ready():
	if score <100:
		$Label.hide()
	
	

# toggle menu with escape
func _input(event: InputEvent):
	if (event.is_action_pressed("ui_cancel")):
		var menu_visible : bool = menu.visible
		menu.visible = !menu_visible
	


func add_score():
	score +=20
	score_label.text = "Score " + str(score) + " %"
	if score == 100:
		winning_scene()
	

#func add_clicks():
	#clicks_mud += 1
	#print(clicks_mud)
	#if clicks_mud==10:
		#

# function grab and drop

# change to winning condition scene

func winning_scene():
	bike_parts.queue_free()
	
	menu.visible = true
	$Label.show()
	
