extends Camera2D
#
func _process(delta: float) -> void:
	global_position.x += 150 * delta
