extends Node2D

# get joints
@onready var joint1 = $PinJoint2D_Right
@onready var joint2 = $PinJoint2D_Left

# get bodies
@onready var body1 = $PinJoint2D_Right/RigidBody2D2
@onready var body2 = $PinJoint2D_Left/RigidBody2D2


func _ready() -> void:
	joint1.motor_enabled = true
	joint2.motor_enabled = true


const STIFFNESS = 0.8

var target1: int = -20
var target2: int = 20


func _process(delta: float) -> void:
	joint1.motor_target_velocity = (target1-body1.rotation_degrees) * STIFFNESS
	joint2.motor_target_velocity = (target2-body2.rotation_degrees) * STIFFNESS



func _input(event: InputEvent) -> void:
	# switch angles on key presses
	
	if event.is_pressed():
		if event.as_text() == "A":
			if target2 < 0:
				target2 = 20
			else:
				target2 = -20
		
		if event.as_text() == "S":
			if target1 < 0:
				target1 = 20
			else:
				target1 = -20

	
	
	
