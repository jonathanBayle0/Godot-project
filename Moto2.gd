extends VehicleBody3D

func _physics_process(delta):
	steering = Input.get_axis("right", "left") * 0.4
	engine_force = Input.get_axis("forward", "back") * 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Avancement du véhicule
	if Input.is_action_pressed("ui_up"):
		engine_force = 60
	
	# Recule du véhicule
	if Input.is_action_pressed("ui_down"):
		translate(-transform.basis.z * 0.4)
		
	if Input.is_action_pressed("ui_right"):
		apply_torque_impulse(Vector3(-1,0,0))
	
	if Input.is_action_pressed("ui_left"):
		apply_torque_impulse(Vector3(1, 0, 0))

