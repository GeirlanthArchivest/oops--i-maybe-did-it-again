extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var bullet = preload("res://Scenes/bullet.tscn")
var can_shoot = true
var health:int
var max_health = 10

@onready var sprite = $Sprite2D

func _ready():
	Global.player = self
	health = max_health
	
func _exit_tree():
	Global.player = null

func _physics_process(delta: float) -> void:
	$ProgressBar.value = health
	
	#shooting stuff
	if Input.is_action_pressed("shoot")  and Global.node_creation_parent != null and can_shoot:
		fire()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction >0:
		sprite.flip_h = false
	elif direction <0:
		sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func fire():
	Global.instance_node(bullet, global_position, Global.node_creation_parent)
	$Fire_rate_timer.start()
	can_shoot = false

func _on_fire_rate_timer_timeout():
	can_shoot = true

func _on_hitbox_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Missile"):
		if health >0:
			health -= 2
			print(health)
		elif health <=0:
			Global.win = false
			Global.scene_change()
	
