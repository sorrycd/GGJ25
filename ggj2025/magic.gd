extends Node
var magicmeter = 0
var magic_rate = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_global_timer_timeout() -> void:
	magicmeter += magic_rate
	pass # Replace with function body.
