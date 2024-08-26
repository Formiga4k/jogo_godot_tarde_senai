extends Area2D

var melancia = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Luiza":
		$AnimM.play("collect")
		await $Collision.call_deferred("queue_free") 
		Global.melancia += melancia
	
	


func _on_anim_m_animation_finished():
	queue_free()
