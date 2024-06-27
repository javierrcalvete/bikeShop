extends Area2D

@onready var game_manager = %GameManager


var selected: bool = false

func _ready():
	$Label.hide()
	
	

# variable para saber si se selecciono el collision shape, escucha solos los del collision
func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and game_manager.is_mouse_busy == false:
		selected = true
		game_manager.is_mouse_busy = true
		game_manager.name_bikePart_grabbed = self.name
		
		
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




#func _on_area_entered(area):
	#if area.name == "Mud":
		#$Label.show()	


#func _on_area_exited(area):
	#$Label.hide()


func _on_mouse_entered():
	$Label.show()
	var hola: String = "hola"
	


func _on_mouse_exited():
	$Label.hide()
