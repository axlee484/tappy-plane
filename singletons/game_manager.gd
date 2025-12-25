extends Node

signal plane_died
var is_plane_alive = false

signal scored
var score = 0
var high_score = 0

const GROUP_PLANE = "plane"

var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/main.tscn")

func _ready() -> void:
	is_plane_alive = false
	plane_died.connect(_on_plane_died)
	scored.connect(_on_scored)

func load_game_scene():
	score = 0
	is_plane_alive = true
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene():
	is_plane_alive = false
	get_tree().change_scene_to_packed(main_scene)

func _on_plane_died():
	is_plane_alive = false
	if score > high_score:
		high_score = score

func _on_scored():
	score+=1
	#print(score)
	
	
