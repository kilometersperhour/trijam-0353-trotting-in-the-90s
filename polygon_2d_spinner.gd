extends Polygon2D

var wedge_count : float = 7
var wedge_center : Array = [0,0]

var wedge_radius : float = 15
var wedge_width : float = 1 / wedge_count

class Wedge:
	var count : float
	var radius : float
	var width : float
	var rot : float
	var origin : Array
	var leading_pt : Array
	var lagging_pt : Array

# class Spinner
# it's just <wedge.count> new wedges
# each rotated at 1/<wedge.count> * n about origin where n is wedge iteration
# var wedgeStorage : Array (of wedges?)
# 

# for an isosceles triangle "pointed straight down" 
# bottom point at origin, [top-left point], [top-right point]
# this should be a function but I'll figure that out later
var simple_wedge : Array = [
	[0,0],#wedge_center, #
	[wedge_radius * sin(PI * -wedge_width),-wedge_radius * cos(PI * wedge_width)], #
	[wedge_radius * sin(PI * wedge_width),-wedge_radius * cos(PI * wedge_width)] #

]
#simple_wedge.

# https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html#example-1-drawing-a-custom-shape
var my_wedge : PackedVector2Array
var mine_wedge = Wedge.new()

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array
	

func _ready():
	my_wedge = float_array_to_Vector2Array(simple_wedge);
	mine_wedge.count = 7
	mine_wedge.origin = [0,0]

	mine_wedge.radius = 15
	mine_wedge.width = 1 / mine_wedge.count

	
func _draw():
	# We are going to paint with this color.
	var my_wedge_color : Color = Color.from_rgba8(184, 52, 192, 255)

	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(my_wedge, [ my_wedge_color ])
# end borrowed code

func compute_triangle():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
