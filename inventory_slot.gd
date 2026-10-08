extends VBoxContainer

class_name InventorySlot

var is_empty = true
var is_selected = false

@export var single_butten_press = false
@export var starting_texture: Texture
@export var start_label: String

@onready var texture_rect: TextureRect = $NinePatchRect/MenuButton/CenterContainer/TextureRect
@onready var name_label: Label = $NameLabel
@onready var stacks_label: Label = $NinePatchRect/StacksLabel
@onready var on_click_button: Button = $NinePatchRect/OnClickButton
@onready var price_label: Label = $PriceLabel
@onready var menu_button: MenuButton = $NinePatchRect/MenuButton

var slot_to_equip = "NotEquipable"

func _ready() -> void:
	
	if starting_texture != null:
		texture_rect.texture = starting_texture
	
	if start_label != null:
		name_label.text = start_label
	
	menu_button.disabled = single_butten_press
	on_click_button.disabled = !single_butten_press
	
	on_click_button.visible = single_butten_press
	
	var popup_menu = menu_button.get_popup()
	popup_menu.id_pressed.connect(on_popup_menu_item_pressed)
	


func on_popup_menu_item_pressed(id: int):
	print_debug(id)
