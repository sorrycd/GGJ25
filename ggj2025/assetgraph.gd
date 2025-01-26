extends Control

# Graph configuration
@export var line_color: Color = Color.BLUE
@export var line_width: float = 2.0
@export var background_color: Color = Color.WHITE
@export var grid_color: Color = Color.LIGHT_GRAY

# Data management
var data_points: Array[float] = []

func _draw():
	# Background
	draw_rect(Rect2(Vector2.ZERO, size), background_color, true)
	
	# Draw grid
	_draw_grid()
	
	# If no data, exit
	if data_points.is_empty():
		return
	
	# Find min and max values for scaling
	var min_val = data_points.min()
	var max_val = data_points.max()
	
	# Prevent division by zero
	if min_val == max_val:
		min_val -= 1
		max_val += 1
	
	# Calculate scaling factors
	var graph_height = size.y * 0.8
	var graph_width = size.x * 0.9
	var x_step = graph_width / (data_points.size() - 1)
	var y_scale = graph_height / (max_val - min_val)
	
	# Draw line graph
	var points: PackedVector2Array = []
	for i in data_points.size():
		var x = i * x_step
		var y = size.y - ((data_points[i] - min_val) * y_scale)
		points.append(Vector2(x, y))
	
	# Draw the actual line
	draw_polyline(points, line_color, line_width)

func _draw_grid():
	# Vertical lines
	for i in 5:
		var x = size.x * (i / 4.0)
		draw_line(Vector2(x, 0), Vector2(x, size.y), grid_color, 1.0)
	
	# Horizontal lines
	for i in 5:
		var y = size.y * (i / 4.0)
		draw_line(Vector2(0, y), Vector2(size.x, y), grid_color, 1.0)

func add_data_point(value: float):
	data_points.append(value)
	queue_redraw()

func clear_data():
	data_points.clear()
	queue_redraw()

# Example usage
func _ready():
	pass
	# Populate with sample data
var holding_a = 0
var holding_b = 0
func _on_holdings_sell_asset_data(i) -> void:
	holding_a = i[0]



func _on_global_timer_timeout() -> void:
	add_data_point(holding_a)
	pass # Replace with function body.
