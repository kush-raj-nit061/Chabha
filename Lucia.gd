extends CharacterBody2D
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var hit_info = move_and_slide()
	
func damage(value):
	$AnimationPlayer.play("chabhaAnimation2")
	if(health<=0):
		print("died")
		return
	health-=value
	


func _on_area_2d_body_entered(body):
	damage(10)
	print("damage")
	body.queue_free()
	pass # Replace with function body.
