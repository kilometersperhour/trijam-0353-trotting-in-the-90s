extends PinJoint2D
class_name Leg

# get physical body node
@onready var leg_body = $LegBody

# set length of leg
@export var leg_length = 16


@onready var shape = $LegBody/CollisionShape2D

# which key activates this leg?
var key_button: String

# setup leg functions
var target_angle = 20
const STIFFNESS = 0.7

@onready var visual = $LegBody/Sprite2D


func _ready() -> void:
	#argh
	#argh
	motor_enabled = true
	shape.shape.height = leg_length
	shape.position.y = (shape.shape.height/2) - shape.shape.radius


func _process(delta: float) -> void:
	motor_target_velocity = (target_angle - leg_body.rotation_degrees) * STIFFNESS


# toggle
func _unhandled_input(event: InputEvent) -> void:
	if event.as_text() == key_button:
		if event.is_pressed():
			target_angle = 20
			visual.modulate = Color(Color.DARK_BLUE)
		elif event.is_released():
			target_angle = -20
			visual.modulate = Color.WHITE
