extends Area2D


var do_grab_thing: bool = false

# grab and drop with left click
func _physics_process(delta):
    if(do_grab_thing):
        # print('grabed stuff')
        global_position = get_global_mouse_position()
    # else:
        # print('not grabed stuff')

func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            # print('click!')
            do_grab_thing = true

        elif event.button_index == MOUSE_BUTTON_LEFT:
            # print('unclicked!')
            do_grab_thing = false

