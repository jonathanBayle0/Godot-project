extends VehicleBody3D

var velocity = Vector2()
var acceleration = 500
var friction = 400
var max_speed = 200

func _process(delta):
	# Contrôles de déplacement
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	# Appliquer la friction
	velocity = velocity.slide(friction * delta)

	# Appliquer l'accélération
	velocity.x += acceleration * delta

	# Limiter la vitesse maximale
	velocity.x = clamp(velocity.x, -max_speed, max_speed)

	# Déplacer le joueur
	move_and_slide()

	# Appliquer la rotation en fonction de la pente (facultatif)
	var slope_angle = get_floor_angle()
	rotation = lerp(rotation, slope_angle, 0.1)

