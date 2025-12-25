extends CharacterBody2D


#signal plane_died

@export var GRAVITY = 500
@export var TERMINAL_VELOCITY = 2000
@export var JUMP = -250

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:

	if Input.is_action_just_pressed("space"):
		fly()
	fall(delta)
	move_and_slide()

	if is_on_floor():
		die()


func die():
	animated_sprite.stop()
	GameManager.plane_died.emit()
	set_physics_process(false)

func fall(delta):
	velocity.y += GRAVITY * delta
	if velocity.y > TERMINAL_VELOCITY:
		velocity.y = TERMINAL_VELOCITY



func fly():
	velocity.y = JUMP
	animation_player.play("wobble")
