extends NodeState

@export var player: Player
@export var animated_spirte_2d: AnimatedSprite2D


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
			
	if player.player_direction == Vector2.UP:
		animated_spirte_2d.play("Idle_back")
	elif player.player_direction == Vector2.DOWN:
		animated_spirte_2d.play("Idle_front")
	elif player.player_direction == Vector2.LEFT:
		animated_spirte_2d.play("Idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_spirte_2d.play("Idle_right")
	else:
		animated_spirte_2d.play("Idle_front")

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")
		
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
		
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_spirte_2d.stop
