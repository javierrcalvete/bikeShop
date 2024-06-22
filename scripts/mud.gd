extends Area2D


@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var timer = $Timer

var entro_limpiador = false
var mud_time_left
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# on left mouse clicks call func to add clicks
# func _input(event):

# 	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:

# 		if get_viewport_rect().has_point(to_local(event.position)):
# 			game_manager.add_clicks()
			

			
func delete_mud():
		queue_free()

# when Limpiador enter the area for the first time starts timer
func _on_area_entered(area):
	
	if area.name == "Limpiador" and entro_limpiador == false :
		print(entro_limpiador)
		entro_limpiador = true
		print("entro el body")
		timer.start()
		
	elif (entro_limpiador) and area.name == "Limpiador":
		timer.paused = false
	

func _on_area_exited(area):
	if area.name == "Limpiador":
		print("salio el body")
		mud_time_left = timer.get_time_left()
		print(mud_time_left)
		
		timer.paused= true

func _on_timer_timeout():
	delete_mud()


