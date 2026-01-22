extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.win:
		$"Win Screen".visible = true
	else:
		$"Lose Screen".visible = true

func _on_lose_home_button_pressed() -> void:
	home()

func _on_lose_restart_button_pressed() -> void:
	restart()

func _on_win_home_button_pressed() -> void:
	home()

func _on_win_restart_button_pressed() -> void:
	restart()

func restart():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")

func home():
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
