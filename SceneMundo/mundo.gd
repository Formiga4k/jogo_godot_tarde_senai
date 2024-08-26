extends Node2D
@onready var player = $Luiza
@onready var control = $HUD/Control



# Called when the node enters the scene tree for the first time.
func _ready():
	player.dead.connect(game_over)
	control.tempo_acabou.connect(game_over)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func game_over():
	get_tree().change_scene_to_file("res://gameover/game_over.tscn")
	Global.melancia = 0
	player.vida = 3 
