extends Sprite2D

var health:int

var max_health = 20
var minimum_health = 5
var building_health

# Called when the node enters the scene tree for the first time.
func _ready():
	building_health = randf_range(minimum_health, max_health)
	health = building_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass

func _on_hitbox_area_entered(area: Area2D):
	if area.is_in_group("Enemy Damager"):
		area.get_parent().queue_free()
		if health >0:
			health -= 2
		else:
			var index = Global.numOfBuildings.find(self,0)
			Global.numOfBuildings.remove_at(index)
			print(Global.numOfBuildings)
			queue_free()
