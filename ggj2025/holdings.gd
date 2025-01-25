extends Node
@export var inheritance = 19 # starting value i
var networth = 0
var liquid = inheritance
var holdings = {}
var stock_holdings = 100
signal liquid_assets
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_buy_button_pressed(i) -> void:
	pass # Replace with function body.


func _on_sell_button_pressed() -> void:
	pass # Replace with function body.
