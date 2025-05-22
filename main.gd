extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var mouseVel = Input.get_last_mouse_screen_velocity()
	#var mouseSpeed = 0.000001
	#var lastVel = Vector2()
	#
	#if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		#mouseVel = Input.get_last_mouse_screen_velocity()-lastVel
		#$CameraPivot_y.rotate_y(mouseVel.y * mouseSpeed)
		#$CameraPivot_y/CameraPivot_x.rotate_x(mouseVel.x * mouseSpeed)
		#print(mouseVel)
		#lastVel = Input.get_last_mouse_screen_velocity()
	#else:
		##print($CameraPivot_y.rotation.y)
		#pass
	
	
	
	var speed = 50
	if Input.is_action_pressed("ui_left"):
		$CameraPivot_y.rotate_y(speed * PI/180 * delta)
	
	if Input.is_action_pressed("ui_right"):
		$CameraPivot_y.rotate_y(-speed * PI/180 * delta)
		
	if Input.is_action_pressed("ui_up"):
		if($CameraPivot_y/CameraPivot_x.rotation.x >= -145 * PI/180):
			$CameraPivot_y/CameraPivot_x.rotate_x(-speed * PI/180 * delta)
	
	if Input.is_action_pressed("ui_down"):
		if($CameraPivot_y/CameraPivot_x.rotation.x <= -35 * PI/180):
			$CameraPivot_y/CameraPivot_x.rotate_x(speed * PI/180 * delta)
