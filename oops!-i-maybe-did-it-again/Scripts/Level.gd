extends Node2D

var building = preload("res://Scenes/building.tscn")
var missile_path = preload("res://Scenes/missile.tscn")
@onready var camera = $Camera2D


func _ready():
	Global.node_creation_parent = self
	Global.numOfBuildings = get_tree().get_nodes_in_group("building")
	$Camera2D/Timer/Timer.wait_time = Global.level_time
	$"Missile Timer".wait_time = Global.missile_time
	
func _exit_tree():
	Global.node_creation_parent = null

func _process(_delta: float) -> void:
	camera.position = Global.player.global_position
	if Global.numOfBuildings.is_empty():
		Global.win = true
		Global.scene_change()
	else:
		$Camera2D/Label.text = ("Remaining Buiildings:" + str(Global.numOfBuildings.size()))
	
func _on_timer_timeout() -> void:
	Global.win = false
	Global.scene_change()

func _on_missile_timer_timeout() -> void:
	var missile = missile_path.instantiate()
	add_child(missile)
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randf_range(0,nodes.size())]
	
	missile.global_position = node.global_position
