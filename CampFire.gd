extends Node2D

@onready var light = $"../Day"
@onready var rain = $"../Background/ParallaxLayer/Rain"
@onready var thunder = $"../Villager/RainAndThunder"
var cloudy = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact1"):
		cloudy = not cloudy
		if cloudy:
			rain.emitting = false
			thunder.stop()
		else:
			rain.emitting = true
			thunder.play()



func _on_area_2d_body_entered(body):
	print('camp')
	
