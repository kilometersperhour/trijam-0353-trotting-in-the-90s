extends Control

var time: float = 0
@onready var label = $Label

func _process(delta: float) -> void:
	time += delta
	label.text = str(floorf(time))
	
	
	# this is reset when the scene is reset.
