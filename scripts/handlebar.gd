extends Area2D
@onready var game_manager = %GameManager
#@onready var polygon2d = $HandleBarArea2D/Polygon2D

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
		game_manager.name_bikePart_grabbed = str(self.name)
		#print(game_manager.name_bikePart_grabbed)
		
		
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
			if wheel_in_position:
				call_for_score()
				self.process_mode = Node.PROCESS_MODE_DISABLED #makes the handlebar not clickleabale
			
#func release_left_mouse_button():
	#var a = InputEventMouseButton.new()
	#a.set_button_index(1)
	#a.set_pressed(false)
	#Input.parse_input_event(a)


func _on_mouse_entered():
	if !wheel_in_position:
		$Label.show()

func _on_mouse_exited():
	$Label.hide()

func call_for_score():
	#if wheel_in_position and game_manager.is_mouse_busy ==false :
		game_manager.add_score()

# makes saddle stay in place on the bike
func _on_area_entered(area):
	
	
	if area.name == "HandleBarArea2D":
		
		#self.global_position = Vector2(10,-16)#area of saddleBikeCollision on bike
		#release_left_mouse_button()
		print(self.global_position)
		wheel_in_position = true
		#call_for_score()
	
		#game_manager.add_score()
		
		#self.position=bike_saddle_area
		

func _on_area_exited(area):
	wheel_in_position = false
