extends Node2D

var building = preload("res://Scenes/building.tscn")
var missile_path = preload("res://Scenes/missile.tscn")
@onready var camera = $Camera2D

func _ready():
	Global.node_creation_parent = self
	
func _exit_tree():
	Global.node_creation_parent = null

func _process(_delta: float) -> void:
	camera.position = Global.player.global_position
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

func _on_missile_timer_timeout() -> void:
	var missile = missile_path.instantiate()
	add_child(missile)
	
	var area = $Camera2D/SpawnArea
	var random_offset = Vector2(randf_range(0, area.size.x), randf_range(0, area.size.y))
	missile.global_position = area.global_position + random_offset
	
	#
	#var nodes = get_tree().get_nodes_in_group("spawn")
	#var node = nodes[randi() % nodes.size()]
	#
	#$Spawn.position = node.position
	#print($Spawn.position)
