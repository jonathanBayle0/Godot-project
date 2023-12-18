extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 2000
const forceMagnitude = 500.0



var start_pos = position
var start_rotation = rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Incrémentation du chronomètre
	Global.temps_debut += delta 
	
	%Camera3D.position = position + Vector3(30,20,-20)
	if Input.is_action_pressed("reset"):
		position = start_pos
		rotation = start_rotation
		engine_force = 0
		linear_velocity = Vector3(0,0,0)
		
	if Input.is_action_pressed("ui_left"):
		# Inclinez l'avant de la voiture vers le haut
#		rotation = rotation + Vector3(-0.01, 0, 0)
		rotate_x(deg_to_rad(0.5))
	# Ajustez l'angle selon votre préférence
	elif Input.is_action_pressed("ui_right"):
		# Inclinez l'avant de la voiture vers le haut
		rotate_x(deg_to_rad(-0.5))
	else:
		engine_force = Input.get_axis("ui_up", "ui_down") * ENGINE_POWER
		


func restart():
	position = start_pos
	rotation = start_rotation
	engine_force = 0
	linear_velocity = Vector3(0,0,0)


func _on_out_of_bound_area_body_entered(body):
	if body.is_in_group("voiture"):
		restart()
