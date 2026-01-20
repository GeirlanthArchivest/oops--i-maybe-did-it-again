extends Sprite2D

var speed = 100
#var velocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 1 * speed * delta
