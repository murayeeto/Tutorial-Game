extends Sprite2D
@onready var damage_component: DamageComponent = $Damage_Component
@onready var hurt_comp: HurtComponent = $HurtComp

var rock_scene = preload("res://Scenes/Objects/Rocks/pebble.tscn")

func _ready() -> void:
	hurt_comp.on_hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
	

func on_hurt(hit_damage:int) -> void:
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached() -> void:
	call_deferred("add_rock_scene")
	print("max damage reached")
	queue_free()

func add_rock_scene() -> void:
	var rock_scene = rock_scene.instantiate() as Node2D
	rock_scene.global_position = global_position
	get_parent().add_child(rock_scene)
