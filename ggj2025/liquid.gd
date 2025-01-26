extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_holdings_sell_asset_data(liquid) -> void:
	text = 'bank: ' + str(liquid[1])
	pass # Replace with function body.
