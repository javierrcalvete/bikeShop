extends Area2D
@onready var game_manager = %GameManager

var wheel_in_position = false

var selected = false

func _ready():
	$Label.hide()
	

# variable para saber si se selecciono el collision shape, escucha solos los del collision
func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and game_manager.is_mouse_busy == false \
		and wheel_in_position == false:
		
		selected = true
		game_manager.is_mouse_busy = true
		
		
# lerp agarra 2 valores y lo interpola con la velocidad del 3 valor
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

# generic input events on scripts, captura todos los input events
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			game_manager.is_mouse_busy = false
			
func release_left_mouse_button():
	var a = InputEventMouseButton.new()
	a.set_button_index(1)
	a.set_pressed(false)
	Input.parse_input_event(a)


func _on_mouse_entered():
	if !wheel_in_position:
		$Label.show()

func _on_mouse_exited():
	$Label.hide()


# makes saddle stay in place on the bike
func _on_area_entered(area):
	
	
	if area.name == "BackWheelArea2D2":
		self.global_position = area.global_position #area of saddleBikeCollision on bike
		print(self.global_position)
		wheel_in_position = true
		release_left_mouse_button()
		game_manager.add_score()
		
		#self.position=bike_saddle_area
		

