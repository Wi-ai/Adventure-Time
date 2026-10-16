extends Node

const PLAYER_SCENE = preload("uid://1b6h6y6ub3c5")
@onready var player_spawn_place_marker: Marker2D = $PlayerSpawnPlace

func _ready() -> void:
	TransitionChangeManager.transition_done.connect(on_transition_done)
	var player = PLAYER_SCENE.instantiate()
	self.add_child(player)
	
	if TransitionChangeManager.is_transitioning:
		player.set_physics_process(false)
		player.set_process_input(false)
	player.position = player_spawn_place_marker.position
	player.setup_test_inventory()

func on_transition_done():
	$Player.set_physics_process(true)
	$Player.set_process_input(true)


func _on_exit_area_body_entered(body: Node2D) -> void:
	TransitionChangeManager.change_scene("res://Scene/main.tscn")
