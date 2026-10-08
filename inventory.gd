extends Node

class_name Inventory

@onready var inventory_ui: InventoryUI = $"../InventoryUI"
# this prepresent the items corrently in the inventory
@export var items: Arrey[InventoryItem] = []


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_inventory"):
		inventory_ui.toggle()


@warning_ignore("unused_parameter")
func add_item(iteam: InventoryItem, stacks: int):
	if stacks && item.max_stacks > 1:
		add_stackable_item_to_inventory(item, stacks)



func add_stackable_item_to_inventory(item: InventoryItem, stacks: int):
	# is item already in inventory
	# We have to reveres search 
	var item_index = -1
	for i in items.size():
		if items[i] != null and items[i].name == item.name:
			item_index = i
	
	if item_index != -1:
		# add stacks to found item
		
		var inventory_item = item[item_index]
		# can we add current stacks to items in inventory
		if inventory_item.stacks + stacks <= item.max_stacks:
			inventory_item.stacks += stacks
			items[item_index] = inventory_item
			# TODO: update the player_ui
		else:
			var stacks_diff = inventory_item.stacks + stacks - item.max_stacks
			var additional_inventory_item = inventory_item.duplicate(true)
			inventory_item.stacks = item.max_stacks
			# TODO: update the player ui
			additional_inventory_item.stacks = stacks_diff
			items.append(additional_inventory_item)
			# TODO: update player ui
	else:
		item.stacks = stacks
		items.append(item)
		# TODO: update the player ui
