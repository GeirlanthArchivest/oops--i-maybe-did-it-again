extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.win:
		$"Win Screen".visible = true
	else:
		$"Lose Screen".visible = true
