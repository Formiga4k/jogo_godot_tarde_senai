extends Area2D


@onready var control = $"../../HUD/Control"



func _on_body_entered(body):
	if body.name == "Luiza":
		control.segundos += 5
		await $CollisionShape2D.call_deferred("queue_free")
		queue_free()
