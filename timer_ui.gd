extends Control

var time: float = 0
@onready var label = $Label

@onready var globals = $"/root/Globals"

func save_score():
	pass

func _process(delta: float) -> void:
	time += delta
	
	label.text = globals.text + str(floorf(time))
	
	
	# this is reset when the scene is reset.


func _on_character_ready_to_reset() -> void:
	save_score()
	globals.text += str(floorf(time)) + "\n"
