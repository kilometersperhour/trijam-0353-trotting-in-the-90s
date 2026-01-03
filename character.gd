extends Node2D



# reference points so this scene knows where to put the legs
var leg_points: Array[Node]

# get leg scene so we can instance it
const leg_scene = preload("res://leg.tscn")

# assign keys to legs
var keys

@onready var main_body = $CharacterBody

# use a global node to store highscores
@onready var globals = get_node("/root/Globals")


func setup_random():
	keys = ["F", "G", "H", "J", "K", "L"]
	
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
	# how randomness would work
	
	for p: Node2D in leg_points:
		# uh return if you usen all the keys already
		if len(keys) == 0:
			break
			
		
		if randf() > 0.5:
			
			#
			var instance: Leg = leg_scene.instantiate()
			instance.key_button = keys.pop_front()
			instance.setup_random()
			p.add_child(instance)

			
			if randf() < 0.15:
				var e: Leg = leg_scene.instantiate()
				e.node_a = "../LegBody"
				e.node_b = "LegBody"
				e.position.y = (instance.leg_length) - 3.0 #radius
				e.key_button = keys.pop_front()
				e.setup_random()
				instance.add_child(e)
				
			
			
		
		

signal ready_to_reset

func _ready() -> void:
	setup_random()


func _on_button_pressed() -> void:
	ready_to_reset.emit()
	get_tree().reload_current_scene()
	


func _on_killzone_body_entered(body: Node2D) -> void:
	if body == main_body:
		# have to defer removing the bodies because
		# we're inside a physics proccess....
		#call_deferred(_on_button_pressed)
		_on_button_pressed.call_deferred()
		
		#_on_button_pressed()
	
