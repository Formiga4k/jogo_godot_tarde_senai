extends Control
@onready var timer = $Container/Timer_countainer/Timer as Timer
@onready var pontos_counter = $Container/Melon_countainer/Melon as Label
@onready var timer_count = $Container/Timer_countainer/Timer_count as Label
@onready var player = $"../../Luiza"

signal tempo_acabou

@onready var vida_counter = $Container/Vida_container/Vida as Label
var minutos = 0
var segundos = 0
@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 59
# Called when the node enters the scene tree for the first time.
func _ready():
	pontos_counter.text = str( "Pontos: %04d" % Global.melancia)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	vida_counter.text = str("VIDA: 0%2d" % player.vida)
	
	minutos = min_padrao
	segundos = seg_padrao

func _process(delta):
	pontos_counter.text = str( "Pontos: %04d" % Global.melancia)
	vida_counter.text = str("VIDA: %02d" % player.vida)
	if minutos == 0 and segundos == 0:
		emit_signal("tempo_acabou")
		
func _on_timer_timeout():
	if segundos > 60:
		minutos += 1
		segundos %= 60
		 
	if segundos == 0:
		if minutos > 0:
			minutos -= 1
			segundos = 60
	segundos -= 1
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

