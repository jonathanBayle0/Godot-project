extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rejouer_button_pressed():
	# Remise à zero du chronomètre et changement de scène
	Global.temps_debut = 0
	get_tree().change_scene_to_file("res://principale.tscn")


func _on_quitter_button_pressed():
	get_tree().quit()
