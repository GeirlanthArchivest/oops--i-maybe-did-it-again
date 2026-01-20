extends Node2D

var building = preload("res://Scenes/building.tscn")
@onready var camera = $Camera2D

func _ready():
	Global.node_creation_parent = self
	
func _exit_tree():
	Global.node_creation_parent = null

func _process(delta: float) -> void:
	camera.position = Global.player.global_position
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
