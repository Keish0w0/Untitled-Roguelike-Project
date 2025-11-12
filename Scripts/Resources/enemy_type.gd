extends Resource
class_name EnemyResource

@export var title: String
@export var texture: Texture2D
@export var health: float
@export var damage: float
@export var speed: float
@export var drops : Array[Pickups]

@export var type_id : int
@export var time_start : int
@export var time_end : int
@export var spawn_count : int
@export var spawn_delay : int
var spawn_delay_counter = 0
