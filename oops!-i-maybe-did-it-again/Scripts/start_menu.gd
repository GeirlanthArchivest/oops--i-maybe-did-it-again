extends Control

func _ready() -> void:
	$Difficulty.visible = false
	$StartMenu.visible = true

func _on_startbutton_pressed() -> void:
	$StartMenu.visible = false
	$Difficulty.visible = true

func _on_quitbutton_pressed() -> void:
	get_tree().quit()

func _on_easy_pressed() -> void:
	Global.level_time = 90
	Global.missile_speed = 150
	Global.missile_time = 1.0
	start()

func _on_medium_pressed() -> void:
	Global.level_time = 60
	Global.missile_speed = 250
	Global.missile_time = 0.5
	start()

func _on_hard_pressed() -> void:
	Global.level_time = 30
	Global.missile_speed = 500
	Global.missile_time = 0.1
	start()
	
func _on_back_pressed() -> void:
	$Difficulty.visible = false
	$StartMenu.visible = true

func start():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
