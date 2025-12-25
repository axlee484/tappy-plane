extends Control
@onready var scorelabel = $MarginContainer/ScoreLabel
func _ready() -> void:
	GameManager.scored.connect(_on_scored)

func _on_scored():
	scorelabel.text = str(GameManager.score)
	
	
