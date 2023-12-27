extends Node2D

const bullet_path = preload("res://bullet.tscn")
@onready var marker_2d = $CharacterBody2D/Marker2D
@onready var sprite_2d = $CharacterBody2D/Sprite2D
@onready var weapon = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_accept")):
		shoot()

func shoot():
	var new_bullet = bullet_path.instantiate()
	$".".get_parent().get_parent().get_parent().get_parent().add_child(new_bullet)
	new_bullet.rotation = weapon.global_rotation
	new_bullet.global_position = marker_2d.global_position
	var angle = weapon.global_rotation
	new_bullet.velocity = Vector2(cos(angle),sin(angle))
	
	
