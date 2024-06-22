extends Area2D
#var node_name = self.name
#
#var do_grab_thing: bool = false
#var mouse_enter = false

## grab and drop with left click
#func _physics_process(delta):
	#if(do_grab_thing) and (mouse_enter):
		## print('grabed stuff')
		#global_position = get_global_mouse_position()
	#else:
		#mouse_enter = false
		## print('not grabed stuff')
#
#func _input(event):
	#if event is InputEventMouseButton:
		#
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			## print('click!')
			#do_grab_thing = true
#
		#elif event.button_index == MOUSE_BUTTON_LEFT:
			## print('unclicked!')
			#do_grab_thing = false

#func _on_mouse_entered():
	#mouse_enter = true
	#print("mouse entro")
	#return mouse_entered
func _ready():
	$Label.hide()


var selected = false

# variable para saber si se selecciono el collision shape, escucha solos los del collision
func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
		
# lerp agarra 2 valores y lo interpola con la velocidad del 3 valor
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

# generic input events on scripts, captura todos los input events
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false


func _on_mouse_entered():
	$Label.show()

func _on_mouse_exited():
	$Label.hide()
