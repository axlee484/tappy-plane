extends ParallaxBackground

@export var SPEED = 120

func _ready() -> void:
	GameManager.plane_died.connect(_on_plane_died)

func _process(delta: float) -> void:
	scroll_offset.x += SPEED*delta* -1
	
func _on_plane_died():
	set_process(false)
