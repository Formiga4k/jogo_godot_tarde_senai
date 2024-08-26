extends CanvasLayer

@onready var level = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		visible = true
		get_tree().paused = true
		
func _on_continuar_pressed():
	get_tree().paused = false
	visible = false


func _on_sair_do_jogo_pressed():
	get_tree().quit()

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://SceneMundo/mundo.tscn")
