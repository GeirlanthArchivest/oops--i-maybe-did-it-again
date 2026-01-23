extends Sprite2D

var speed = 250
var explosion = preload("res://Scenes/explosion.tscn")
#var velocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 1 * Global.missile_speed * delta

func _on_hitbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Floor"):
		Global.explosion_despawn_time = 1
		Global.instance_node(explosion, global_position, Global.node_creation_parent)
		queue_free()
	elif body.is_in_group("Player"):
		Global.explosion_despawn_time = 0.5
		Global.instance_node(explosion, global_position, Global.node_creation_parent)
		queue_free()
