extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("down_press")):
		$".".position.y+=2
	if(Input.is_action_pressed("right_press")):
		$".".position.x+=2
	if(Input.is_action_pressed("up_press")):
		$".".position.y-=2
	if(Input.is_action_pressed("left_press")):
		$".".position.x-=2

	
