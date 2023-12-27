extends CharacterBody2D

var new_velocity = Vector2(1, 0)
var speed = 2000.0

# const SPEED = 300.0
# const JUMP_VELOCITY = -400.0
#
# # Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	
	


	# Add the gravity.
	# if not is_on_floor():
	#     velocity.y += gravity * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#     velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# var direction = Input.get_axis("ui_left", "ui_right")
	# if direction:
	#     velocity.x = direction * SPEED
	# else:
	#     velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_timer_timeout():
	queue_free() # Replace with function body.
