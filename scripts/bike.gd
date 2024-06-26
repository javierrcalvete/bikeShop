extends Node2D
@onready var game_manager = %GameManager
@onready var handleBar_area = $HandleBarArea2D

var name_bikePart_grabbed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_manager.is_mouse_busy:
		handleBar_area.visible = true
	else:
		handleBar_area.visible = false
