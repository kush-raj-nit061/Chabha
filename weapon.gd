extends Node2D

const bullet_path = preload("res://bullet.tscn")
@onready var marker_2d = $CharacterBody2D/Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_accept")):
		shoot()
	


func shoot():
	var new_bullet = bullet_path.instantiate()
	
	#new_bullet.velocity = Vector2(1,0)
	$".".add_child(new_bullet)
	new_bullet.position = marker_2d.global_position
