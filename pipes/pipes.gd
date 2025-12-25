extends Node2D

@export var PIPES_SPEED = 150;
@onready var upper_pipe = $UpperPipe
@onready var lower_pipe = $LowerPipe
@onready var score_sound = $ScoreSound
var has_passed = false

func _ready() -> void:
	upper_pipe.body_entered.connect(_on_plane_collision)
	lower_pipe.body_entered.connect(_on_plane_collision)


func _process(delta: float) -> void:
	position.x -= PIPES_SPEED*delta
	
func _on_screen_exited() -> void:
	queue_free()

func _on_plane_collision(body):
	if not GameManager.is_plane_alive:
		return
	if body.is_in_group(GameManager.GROUP_PLANE):
		#print("collison") 
		body.die()


func _on_passed_pipe(body: Node2D) -> void:
	if not body.is_in_group(GameManager.GROUP_PLANE):
		return
	
	if has_passed:
		return
	GameManager.scored.emit()
	score_sound.play()
	has_passed = true
