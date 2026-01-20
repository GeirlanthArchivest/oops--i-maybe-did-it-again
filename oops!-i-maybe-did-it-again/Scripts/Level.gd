extends Node2D

var building = preload("res://Scenes/building.tscn")
var area_to_instance = [100, 200, 300]

func _ready():
	Global.node_creation_parent = self
	
func _exit_tree():
	Global.node_creation_parent = null

func instance_buildings():
	pass

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
