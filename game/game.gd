extends Node2D
@onready var upper_pipe = $PipesContainer/UpperPosition
@onready var lower_pipe = $PipesContainer/UpperPosition
@onready var upper_pos = $PipesContainer/UpperPosition
@onready var lower_pos = $PipesContainer/LowerPosition
@onready var pipes_container = $PipesContainer
@export var pipes_scene: PackedScene
@onready var  engine_sound = $SoundContainer/EngineSound
@onready var game_over_sound = $SoundContainer/GameOverSound
@onready var timer = $PipesContainer/Timer

func _ready() -> void:
	GameManager.plane_died.connect(_on_plane_died)
	spawn_pipes()
	



func spawn_pipes():
	var pipe_x = upper_pos.position.x
	var pipe_y = randf_range(upper_pos.position.y, lower_pos.position.y) 
	var new_pipes = pipes_scene.instantiate()
	new_pipes.position = Vector2(pipe_x,pipe_y)
	pipes_container.add_child(new_pipes)
	

func _on_timer_timeout() -> void:
	spawn_pipes()

func stop_pipes():
	timer.stop()
	for pipe in pipes_container.get_children():
		pipe.set_process(false)


func _on_plane_died() -> void:
	stop_pipes()
	engine_sound.stop()
	game_over_sound.play()
	
