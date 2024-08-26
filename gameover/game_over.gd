extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sair_pressed():
	get_tree().quit()


func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://title_screen/title_screen.tscn")
