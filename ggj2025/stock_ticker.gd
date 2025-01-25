extends Node

# Stock data structure
class StockData:
	var symbol: String
	var price: float
	var change: float
	
	func _init(sym: String, curr_price: float, price_change: float):
		symbol = sym
		price = curr_price
		change = price_change

# Stock ticker configuration
@export var update_interval: float = 5.0  # Update every 5 seconds
@export var scroll_speed: float = 100.0  # Pixels per second
var stocks: Array[StockData] = []

# Internal references
var label: Label
var tween: Tween

func _ready():
	label = Label.new()
	add_child(label)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Initial stock data population
	_update_ticker_text()
	
	# Start update timer
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = update_interval
	timer.connect("timeout", _update_ticker_text)
	timer.start()

func _update_ticker_text():
	var ticker_text = ""
	for stock in stocks:
		var color = "green" if stock.change >= 0 else "red"
		ticker_text += "{symbol}: ${price} ({change:+.2f}%) | ".format({
			"symbol": stock.symbol,
			"price": stock.price,
			"change": stock.change
		})
	
	label.text = ticker_text
	
	# Animate scrolling
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(label, "position:x", -label.size.x, label.size.x / scroll_speed)
	tween.play()

# Example usage
func _on_game_start():
	stocks = [
		StockData.new("WHEAT", 45.50, 1.2),
		StockData.new("WOOL", 32.75, -0.5),
		StockData.new("IRON", 67.25, 2.3)
	]
