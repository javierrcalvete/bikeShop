extends Node2D
@onready var game_manager = %GameManager
@onready var handleBar_area = $HandleBarArea2D
@onready var saddle_area = $SaddleBikeArea2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleBar_area.visible = false
	saddle_area.visible = false
	if game_manager.is_mouse_busy:
# when bikepart grabbed show where to put it with area
		print(game_manager.name_bikePart_grabbed)
		match game_manager.name_bikePart_grabbed: #HandleBar
			'Handlebar':
				handleBar_area.visible = true
			'Saddle':
				saddle_area.visible = true
				
			
