extends CharacterBody2D


const SPEED = 300.0
const JUMP_FORCE = -370.0
var maxJump = 2
var countJump = 2
var is_takingDamage = false
var vida = 3
var vida_max = 3
@export var knockbackpower: int = 350

@onready var animation = $SpriteLuh as AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping = false

signal dead

func _physics_process(delta):
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("pulo") and countJump < maxJump:
		velocity.y = JUMP_FORCE
		is_jumping = true
		countJump += 1
	elif is_on_floor():
		countJump = 0
		is_jumping = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("esquerda", "direita")
	
	velocity.x = direction * SPEED
	if !is_takingDamage:
		if direction != 0:
			animation.play("run")
			animation.flip_h = (direction < 0) 
		
		elif is_jumping:  
			animation.play("jump")
			

		else:
			animation.play("idle")
		
		if velocity.y < 0:
			animation.play("jump")
		elif velocity.y > 0:
			animation.play("fall")

		move_and_slide()
	
func levouDano(dano):
	is_takingDamage = true
	velocity.x = -400
	vida -= dano
	$SpriteLuh.play("hit")
	await $SpriteLuh.animation_finished
	_knockback()
	is_takingDamage = false
	if vida <= 0: 
		emit_signal("dead")
		
func _knockback():
	var knockbackdirection = -velocity.normalized() * knockbackpower
	velocity = knockbackdirection
	move_and_slide()	
func _on_melancia_body_entered(body):
	pass # Replace with function body.
