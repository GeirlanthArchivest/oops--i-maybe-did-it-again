extends Sprite2D

var growth_speed = 1

func _ready() -> void:
	$"Explosion Despawn Timer".wait_time = Global.explosion_despawn_time
	$"Explosion Despawn Timer".start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale.y += 1 * growth_speed * delta
	scale.x += 1 * growth_speed * delta

func _on_explosion_despawn_timer_timeout() -> void:
	queue_free()
