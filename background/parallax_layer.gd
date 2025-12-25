extends ParallaxLayer

@onready var bg = $Sprite2D

@export var texture: Texture
@export var scroll_scale= 0.0
@export var tx_x = 1920
@export var tx_y = 1080

func _ready() -> void:
	motion_scale.x = scroll_scale
	
	var scale_f =  get_viewport_rect().size.y / tx_y
	
	bg.texture = texture
	bg.scale = Vector2(scale_f,scale_f)
	motion_mirroring.x = tx_x * scale_f
