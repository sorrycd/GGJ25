extends Label

@export var scroll_speed = 100.0  # Pixels per second
@export var news_items = ["Local priest scries the orb, the results may shock you",

"Gnomish influences in the monarchy source of concern to serfs",

"Arcane crystals found east of the river, elves in the area to be relocated",

"Local druid chooses to stay as a Nutria",

"Plague inoculations may be worse than the plague itself",

"Elf from Norvendar made it past the ice wall stating, \"I am going to freeze to death\"",

"Rangers deplete local goodberry supply",

"The Grove infiltrated by gnomes, no one really knows why they are there but they’re not bothering anyone",

"Mithril prices sky rocket amidst dwarf and elf tension",

"Ambassador from dark elf kingdom referred to as \"underscum\" by the king, blightweave deal falls through",

"Goblins escape fissure predicting surge in dungeon squatting",

"Maldavius Figtree shot dead in the ruins of Mauradon with a Wand of Blasting",

"Unexpected explosion at the fireball factory hundreds dead.",

"The Barrens prospected for resources, found barren",

"Gnoll attacks up in the deadwoods to the surprise of no one",

"Snake oil miracle cure scandal, alchemist’s guild forced to cut positions",

"Local blacksmiths selling swords without hilts due to iron costs, hand injuries up 100%",

"Wages plummet due to new wave of necromantic labour practices",

"Ice elemental sues after spilling hot coffee in lap",

"Ogre of Thalendor falls up stairs in gravity defying incident",

"Cloudkill incident at the Ziggurat, crown refuses to disclose casualties",

"Horse carriage rams through gizmo and gadget market at unscrupulous speeds",

"Specters of the damned to be rebranded as \"souls of the departed\" in an attempt to curb stigma",

"Golem rights activists at several dwarven mines protest unfair power core distribution",

"Orc warchief Deathfist People-Eater turns a new leaf, opting for more sustainable warmongering practices in his latest campaign",

"The Council of Seven has fallen.",

"Ectoplasm recently harvested from ghosts recalled due to impurities of the soul",

"Archwizard Kalimdreath investigated over alleged improper disposal of a homunculus",

"Happy Root farmers left reeling over the spreading of Fungus of Despair",

"Local wizard creates time paradox. Local wizard creates time paradox. Local wizard crea",

"Assassination attempt on the king thwarted by court jester using a comically large hammer",

"Priestess of the moon converts to the sun over unanswered prayers",

"Thieves guild to host charity auction event",

"Small woodland fae creatures to be grinded down into dust",

"Enchanted forest to be firestormed for new high rise wizard towers",

"Profane flame referendum this Thursday",

"Adventurers protest rising cost of healing potions by dying",

"Advancements in orb facial recognition still unable to identify the Headless Horseman",

"The Mad King of the North to host gala celebrating different cultures",

"Local man sees vision from Kalamfrix, God of Deceit and Deception, says something really good is about to happen",

"Doppelgangers from the shadow realm form opposition party",

"Plaguerats designated as a potential source of the plague via the Kingdom Health Organization",


]

var current_text = ""
var text_width = 0
var viewport_width = 0

func _ready():
	viewport_width = get_viewport_rect().size.x
	
	# Initial setup
	current_text = news_items[0]
	text = current_text
	text_width = size.x
	
	# Position text just off screen to the right
	position.x = viewport_width

func _process(delta):
	# Move text left
	position.x -= scroll_speed * delta
	
	# Reset text when it moves completely off screen
	if position.x < -text_width:
		position.x = viewport_width
		
		# Cycle to next news item
		news_items.push_back(news_items.pop_front())
		current_text = news_items[0]
		text = current_text
		text_width = size.x
