extends Node2D

@onready var knocking = $Area2D/Knock
@onready var window_light = $"../Window"
var lights = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact2"):
		knocking.play()
		if lights:
			lights = true
			window_light.get_child(2).light_enabled = true

