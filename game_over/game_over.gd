extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var can_press_space = false

func  _ready() -> void:
	can_press_space = false
	GameManager.plane_died.connect(_on_game_over)

func _process(_delta: float) -> void:
	if can_press_space:
		if Input.is_action_just_pressed("space"):
			GameManager.load_main_scene()

func _on_game_over():
	show()
	timer.start()


func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
	can_press_space = true
