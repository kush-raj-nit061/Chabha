
extends CharacterBody2D

var wheel_base = 70
var steering_angle = 15
var engine_power = 900
var friction = -55
var drag = -0.06
var braking = -450
var max_speed_reverse = 250
var slip_speed = 400
var traction_fast = 2.5
var traction_slow = 10
@onready var animated_sprite_2d = $AnimatedSprite2D
var acceleration = Vector2.ZERO
var steer_direction
var player_in_car = true
@onready var collision_shape_2d = $CollisionShape2D

func _physics_process(delta):
	acceleration = Vector2.ZERO
	apply_animation()
	if(player_in_car):
		get_input()
		calculate_steering(delta)
	apply_friction(delta)
	
	velocity += acceleration * delta
	move_and_slide()
	
func apply_friction(delta):
	if acceleration == Vector2.ZERO and velocity.length() < 50:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction * delta
	var drag_force = velocity * velocity.length() * drag * delta
	acceleration += drag_force + friction_force
	
func get_input():
	var turn = Input.get_axis("ui_left", "ui_right")
	steer_direction = turn * deg_to_rad(steering_angle)
	if Input.is_action_pressed("ui_up"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("ui_down"):
		acceleration = transform.x * braking
	
func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = rear_wheel.direction_to(front_wheel)
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = lerp(velocity, new_heading * velocity.length(), traction * delta)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
#	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
func apply_animation():
	animated_sprite_2d.global_rotation = 0
	if(rad_to_deg(global_rotation)<=-22.5 && rad_to_deg(global_rotation)>-67.5):
		animated_sprite_2d.play("up_right")
		collision_shape_2d.scale = Vector2(8.43,3.63)
		collision_shape_2d.global_rotation=deg_to_rad(-22.5)
		animated_sprite_2d.flip_h = false
	elif (rad_to_deg(global_rotation) <= -67.5 && rad_to_deg(global_rotation)>-112.5):
		animated_sprite_2d.play("up")
		collision_shape_2d.scale = Vector2(4.44,5.32)
		collision_shape_2d.global_rotation=deg_to_rad(-67.5)
		animated_sprite_2d.flip_h = false
	elif (rad_to_deg(global_rotation) <= -112.5 && rad_to_deg(global_rotation)>-157.5):
		animated_sprite_2d.play("up_right")
		collision_shape_2d.scale = Vector2(8.43,3.63)
		collision_shape_2d.global_rotation=deg_to_rad(-157.5)
		animated_sprite_2d.flip_h = true
	elif (rad_to_deg(global_rotation) <= -157.5 && rad_to_deg(global_rotation)>157.5):
		animated_sprite_2d.play("right")
		collision_shape_2d.scale = Vector2(9.72,3.88)
		collision_shape_2d.global_rotation=deg_to_rad(-157.5)
		animated_sprite_2d.flip_h = true
	elif (rad_to_deg(global_rotation) <= 157.5 && rad_to_deg(global_rotation)>112.5):
		animated_sprite_2d.play("down_right")
		collision_shape_2d.scale = Vector2(8.43,3.63)
		collision_shape_2d.global_rotation=deg_to_rad(157.5)
		animated_sprite_2d.flip_h = true
	elif (rad_to_deg(global_rotation) <= 112.5 && rad_to_deg(global_rotation)>67.5):
		animated_sprite_2d.play("down")
		collision_shape_2d.scale = Vector2(4.44,5.32)
		collision_shape_2d.global_rotation=deg_to_rad(112.5)
		animated_sprite_2d.flip_h = false
	elif (rad_to_deg(global_rotation) <= 67.5 && rad_to_deg(global_rotation)>22.5):
		animated_sprite_2d.play("down_right")
		collision_shape_2d.scale = Vector2(8.43,3.63)
		collision_shape_2d.global_rotation=deg_to_rad(22.5)
		animated_sprite_2d.flip_h = false
	else: 
		animated_sprite_2d.play("right")
		collision_shape_2d.scale = Vector2(9.72,3.88)
		collision_shape_2d.global_rotation=deg_to_rad(0)



func _on_area_2d_body_entered(body):
	
	if (Input.is_action_just_pressed("ui_accept")):
		print("Entered in car")
		player_in_car = true
		
