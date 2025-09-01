extends Node

@export var enemy_to_spawn: PackedScene

@onready var spawn_area_size = $spawnArea/CollisionShape2D.shape.extents
@onready var origin = $spawnArea/CollisionShape2D.global_position

@onready var spawn_start = origin - spawn_area_size
@onready var spawn_end = origin + spawn_area_size

func _ready():
	pass

func _process(delta):
	pass

func _on_spawn_timer_timeout() -> void:
	var enemy_pos_x = randf_range(spawn_start.x, spawn_end.x)
	var enemy_pos_y = randf_range(spawn_start.y, spawn_end.y)
	
	var enemy = enemy_to_spawn.instantiate()
	enemy.position = Vector2(enemy_pos_x, enemy_pos_y)
	call_deferred("add_child", enemy)
	
