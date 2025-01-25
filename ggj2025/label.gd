extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_stockprice_buy_price(price) -> void:
	print('recieved',price)
	$Label.set_text(str(price))
