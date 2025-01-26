extends Node
@export var inheritance = 19 # starting value i
var networth = 0
var liquid = inheritance
var stock_holdings = 100
var stockprice = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func _on_stockprice_market_changed(i) -> void:
	stockprice = i[-1]
	print('help',i[-1])
	print('holdings',stockprice)
signal sell_asset_data
signal buy_asset_data
func _on_buy_button_pressed() -> void:
	print('BUYBUYBUY')
	if liquid > stockprice:
		stock_holdings += 1
		liquid -= stockprice
		sell_asset_data.emit([stock_holdings,liquid])
	pass # Replace with function body.


func _on_sell_button_pressed() -> void:
	if stock_holdings > 0:
		stock_holdings -=1
		liquid += stockprice
		#print('StockPrice:',stockprice)
		sell_asset_data.emit([stock_holdings,liquid])
	pass # Replace with function body.
