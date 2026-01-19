extends Label

var minutes:int

var seconds:int

var time:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = round($Timer.time_left)
	
	minutes = time/60
	seconds = fmod(time,60)
	
	$".".text = str(minutes) + ":" + str(seconds)
	pass
