extends RigidBody3D

var speed = 10  # Réglez la vitesse de déplacement
var rotation_speed = 2  # Réglez la vitesse de rotation
var jump_force = 200  # Réglez la force de saut

func _process(delta):
	# Déplacement vers l'avant lorsque la touche "W" est enfoncée
	if Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector3(0, 0, -1))

	# Rotation vers la gauche lorsque la touche "A" est enfoncée
	if Input.is_action_pressed("ui_left"):
		rotate(Vector3(0, 1, 0), rotation_speed * delta)

	# Rotation vers la droite lorsque la touche "D" est enfoncée
	if Input.is_action_pressed("ui_right"):
		rotate(Vector3(0, 1, 0), -rotation_speed * delta)

	# Saut de la roue avant lorsque la touche "Space" est enfoncée
	if Input.is_action_pressed("forward"):
		apply_impulse(Vector3(0, 1, 0), Vector3(0, jump_force, 0))
