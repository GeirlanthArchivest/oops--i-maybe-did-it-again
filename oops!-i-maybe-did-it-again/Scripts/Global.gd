extends Node

var node_creation_parent = null
var player = null
var numOfBuildings = []
var win:bool
var scene_to_change_too = ""
var missile_speed:int
var level_time:float
var missile_time:float

func scene_change():
	get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
