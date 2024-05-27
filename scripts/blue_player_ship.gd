extends CharacterBody2D


const SPEED = 300.0
var thrust_amount: float = 400.0
#var velocity: Vector2 = Vector2.ZERO
var rotation_speed: float = 3.0
var thrust_acceleration: float = 5.0
var desired_direction: Vector2 = Vector2.ZERO
@onready var sprite = $Sprite2D


func _ready():
	set_physics_process(true)

func _process(delta):
	handle_input()
	#position += velocity * delta
	if desired_direction != Vector2.ZERO:
		var thrust = desired_direction * thrust_amount * delta
		velocity += thrust
		#velocity = velocity.lerp(desired_direction * thrust_amount, thrust_acceleration * delta)
	#move_and_slide()
	position += velocity * delta
	
		#var target_rotation = velocity.angle()
		#rotation + lerp_angle(rotation, target_rotation, rotation_speed * delta)
	#position += new_velocity * delta
	
	if velocity.length() > 0:
		var target_rotation = velocity.angle()
		rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
	#if sprite:
		#sprite.rotation = rotation


func apply_thrust(direction: Vector2):
	#velocity += direction.normalized() * thrust_amount * get_physics_process_delta_time()
	desired_direction = direction.normalized()


func handle_input():
	var direction: Vector2 = Vector2.ZERO
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if direction != Vector2.ZERO:
		apply_thrust(direction)
