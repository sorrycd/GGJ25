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
signal sell_asset_data
	
func _on_stockprice_market_changed(i) -> void:
	stockprice = i[-1]
	#print('help',i[-1])
	#print('holdings',stockprice)
	sell_asset_data.emit([stock_holdings,liquid])

func _on_buy_button_pressed() -> void:
	#print('BUYBUYBUY')
	if liquid > stockprice:
		stock_holdings += 1
		liquid -= stockprice
		sell_asset_data.emit([stock_holdings,liquid]) #emits the players holdings
	pass # Replace with function body.

func _on_sell_button_pressed() -> void:
	if stock_holdings > 0:
		stock_holdings -=1
		liquid += stockprice
		#print('StockPrice:',stockprice)
		sell_asset_data.emit([stock_holdings,liquid]) # emits the players holdings
	if liquid > 5000:
		get_tree().change_scene_to_file("res://win_screen/win_screen.tscn")
	pass # Replace with function body. (edited)



func _on_texture_button_pressed() -> void:
	pass # Replace with function body.


func _on_texture_button_2_pressed() -> void:
	pass # Replace with function body.
