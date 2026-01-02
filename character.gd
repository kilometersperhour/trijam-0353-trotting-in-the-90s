extends Node2D



# reference points so this scene knows where to put the legs
var leg_points: Array[Node]

# get leg scene so we can instance it
const leg_scene = preload("res://leg.tscn")

# assign keys to legs
var keys

@onready var main_body = $CharacterBody



func setup_random():
	keys = ["H", "J", "K", "L", ";"]
	
	# points are node order
	# in order from left to right

	leg_points = [
		get_child(1),
		get_child(2),
		get_child(3),
		get_child(4),
		get_child(5)
	]
	
	# i don't event know 
	for p: Node2D in leg_points:
		if randf() > 0.5:
			
			var instance: Leg = leg_scene.instantiate()
			instance.key_button = keys.pop_front()
			
			
			if randf() > 0.5:
				instance.leg_length = 16
			else:
				instance.leg_length = 25
			
			p.add_child(instance)
		
		



func _ready() -> void:
	setup_random()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	
