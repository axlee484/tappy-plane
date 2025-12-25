extends Control
@onready var score_label = $MarginContainer/HBoxContainer/Score

func _ready() -> void:
	score_label.text = str(GameManager.high_score)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		GameManager.load_game_scene()
