extends Sprite2D

var health:int

var max_health = 20
var minimum_health = 5
var building_health

var building_texture1 = preload("res://Assets/Building 1.png")
var building_texture2 = preload("res://Assets/Building 2.png")
var building_texture3 = preload("res://Assets/Building 3.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	building_health = randf_range(minimum_health, max_health)
	health = building_health
	building_asset()

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
			queue_free()

func building_asset():
	var building_asset_pick = randi_range(-1,4)
	if building_asset_pick == 0:
		texture = building_texture1
		offset.y = -300
	elif building_asset_pick == 1:
		texture = building_texture2
		offset.y = -300
	elif building_asset_pick == 2:
		texture = building_texture3
		offset.y = -182
