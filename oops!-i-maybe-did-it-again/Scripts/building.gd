extends Sprite2D

var health:int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass

func _on_hitbox_area_entered(area: Area2D):
	if area.is_in_group("Enemy Damager"):
		area.get_parent().queue_free()
		if health >0:
			health -= 2
		else:
			queue_free()
