extends Node2D

# learn to create a wedge class... yikes
var wedge_count = 7
var wedge_center : Array = [0,0]

var wedge_depth = 15
var wedge_width = 1/wedge_count

# for an iscoceles triangle "pointed straight down" 
# bottom point at origin, [top-left point], [top-right point]
# this should be a function but I'll figure that out later
var simple_wedge : Array = [
	wedge_center, 
	[wedge_center[0] + cos(0.5 * PI * wedge_width),wedge_center[1] + sin(0.5 * PI * wedge_width)],
	[-wedge_center[0] + cos(0.5 * PI * wedge_width),wedge_center[1] + sin(0.5 * PI * wedge_width)]
]

# https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html#example-1-drawing-a-custom-shape
var my_wedge : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array
	
func _ready():
	my_wedge = float_array_to_Vector2Array(simple_wedge);
	
func _draw():
	# We are going to paint with this color.
	var my_wedge_color : Color = Color.from_rgba8(101, 129, 226, 1)

	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(my_wedge, [ my_wedge_color ])
# end borrowed code

func compute_triangle():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	queue_redraw()
