extends Area2D

var health:int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass


func _on_body_entered(body: Node2D):
	if (body.is_in_group("bullet")):
		if health <= 0:
			print("dead!")
			queue_free()
		else:
			print("hit!")
			health -= 2
