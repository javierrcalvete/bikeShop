extends Node

@onready var score_label = $ScoreLabel
@onready var habldeBarNode=$"../BikeParts/Handlebar"
var name_bikePart_grabbed
#@onready var mud = $Mud
# var for check if mouse is grabbing something
var is_mouse_busy = false
var score = 0
var clicks_mud = 0



func add_score():
	score +=20
	score_label.text = "Score " + str(score) + " %"

#func add_clicks():
	#clicks_mud += 1
	#print(clicks_mud)
	#if clicks_mud==10:
		#

# function grab and drop

