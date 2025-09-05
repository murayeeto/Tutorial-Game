extends NodeState

@export var player: CharacterBody2D
@export var animated_spirte_2d: AnimatedSprite2D

var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if Input.is_action_pressed("walk_left"):
		print_debug("fucking stupid ass engine")
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO
		
	if direction == Vector2.UP:
		animated_spirte_2d.play("Idle_back")
	elif direction == Vector2.DOWN:
		animated_spirte_2d.play("Idle_front")
	elif direction == Vector2.LEFT:
		animated_spirte_2d.play("Idle_left")
	elif direction == Vector2.RIGHT:
		animated_spirte_2d.play("Idle_right")
	else:
		animated_spirte_2d.play("Idle_front")

func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
