extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Avancement du véhicule
	if Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector3(0,1,0))
	
	# Recule du véhicule
	if Input.is_action_pressed("ui_down"):
		translate(-transform.basis.z * 0.4)
		
	if Input.is_action_pressed("ui_right"):
		apply_torque_impulse(Vector3(-1,0,0))
	
	if Input.is_action_pressed("ui_left"):
		apply_torque_impulse(Vector3(1, 0, 0))
