extends Control

func _on_startbutton_pressed() -> void:
	$StartMenu.visible = false
	$Difficulty.visible = true

func _on_quitbutton_pressed() -> void:
	get_tree().quit()

func _on_easy_pressed() -> void:
	Global.level_time = 130
	Global.missile_speed = 150
	Global.missile_time = 1.0

func _on_medium_pressed() -> void:
	Global.level_time = 60
	Global.missile_speed = 250
	Global.missile_time = 0.5

func _on_hard_pressed() -> void:
	Global.level_time = 60
	Global.missile_speed = 500
	Global.missile_time = 0.1
