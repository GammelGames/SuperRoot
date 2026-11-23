extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Player/Camera
@onready var current_level = $CurrentLevel

#Lädt das erste Level
var level_01 = preload("res://Scenes/Levels/level_01.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level(level_01)
	
	
	


#Lädt ein neues Level
func load_level(level):
	var new_level = level.instantiate()
	current_level.add_child(new_level)
	
	#Spawnpoint im gleichen Level suchen
	var spawn_point: Marker2D = new_level.get_node("Gameplay/SpawnPoint")
	
	#Player an den Spawnpoint setzen
	player.global_position = spawn_point.global_position
	
	#Kamera und Follower setzen
	camera.reset_smoothing()
	$FollowerNode.snap_to_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
