extends Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal bubble_in_progress
func _on_stockprice_bubblefactor(i) -> void:
	start(i*1)
	print(wait_time)
	bubble_in_progress.emit()
	pass # Replace with function body.
