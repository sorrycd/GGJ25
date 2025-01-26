extends Node
var rng = RandomNumberGenerator.new()# number of stocks
var effects
@export var price = 5
@export var stockname = '$WHT'
var stock = [price]
@export var fluxlower = -10 # TODO adjust flux per stock
@export var fluxupper = 10
var popfactor = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func marketflux(): # calling this function generates a random number
	# TODO: add 'springyness' to markets
	var randomnumber = rng.randi_range(fluxlower,fluxupper)
	return randomnumber
signal market_changed
signal buy_price
@export var graph_length = 24
signal bubblefactor
func bubble():
	var bubble_length = abs(marketflux())
	bubblefactor.emit(bubble_length)
var bf = 1
func _on_timer_timeout() -> void: #
	var mf = marketflux()
	price = abs((stock[-1]+mf)+bf)*popfactor
	
	buy_price.emit(price)
	stock.append(price)
	market_changed.emit(stock)
	#print(stock)
	if len(stock) > graph_length:
		stock.pop_at(0)
	market_changed.emit(stock)
	popfactor = 1
var mana = 4
signal mana_charge
func _on_orb_pressed() -> void:
	print('debug')
	if mana == 4:
		mana = 0
		mana_charge.emit(mana)
		
		bubble()
	pass # Replace with function body.



func _on_mana_charge_timeout() -> void:
	if mana <4:
		mana += 1
		print('mana = ',mana)
		mana_charge.emit(mana)
	pass # Replace with function body.

var bubbleon = 0

func _on_bubble_length_bubble_in_progress() -> void:
	bubbleon = 1
	bf = 10
	print('bubble in progress!')
	pass # Replace with function body.

func _on_bubble_length_timeout() -> void:
	print('pop alert!')
	popfactor = 0
	bf = 0
	bubbleon = 0
	print('price',price)
	pass # Replace with function body.
func unpop():
	popfactor = 1
