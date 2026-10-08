extends CanvasLayer

class_name InventoryUI

@onready var grid_container: GridContainer = %GridContainer
const INVENTORY_SLOT_SCENE = preload("res://Scene/UI/inventory_slot.tscn")

@export var size = 8
@export var columns = 4

func _ready() -> void:
	grid_container.columns = columns
	
	for i in size:
		var inventory_slot = INVENTORY_SLOT_SCENE.instantiate()
		grid_container.add_child(inventory_slot)

func toggle():
	visible = !visible
