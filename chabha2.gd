extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var left_toggle=true
var right_toggle=true
@onready var upper_hand = $Torso/UpperHand
@onready var upper_hand_2 = $Torso/UpperHand2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position = get_global_mouse_position()
	if(left_toggle):upper_hand.global_rotation = get_angle_to(mouse_position)-19.9
	
	if(right_toggle):upper_hand_2.global_rotation = get_angle_to(mouse_position)-19.9
	if(Input.is_action_just_pressed("ui_right")):
		left_toggle = !left_toggle
	if(Input.is_action_just_pressed("ui_left")):
		right_toggle =!right_toggle
	if(Input.is_action_pressed("left_press")):
		$".".position.x-=200*delta
		$Torso.scale.x = -1
		$AnimationPlayer.play("chabhaAnimation2")
	elif (Input.is_action_pressed("right_press")):
		$".".position.x+=200*delta
		$Torso.scale.x = 1
		$AnimationPlayer.play("chabhaAnimation2")
	else : $AnimationPlayer.play("RESET")

