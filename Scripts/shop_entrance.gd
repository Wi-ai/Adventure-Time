extends Area2D

func _on_area_entered(area: Area2D) -> void:
	TransitionChangeManager.player_spawn_position = Vector2(0,0)
	TransitionChangeManager.change_scene("res://Scene/shop_scene.tscn")
