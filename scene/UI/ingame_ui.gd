extends Control

@export var player: CharacterBody2D
@export var UI_layer: CanvasLayer

@onready var inventory = preload("res://scene/inventory.tscn")
@onready var gemslabel = $"Collections/MarginContainer/Collections-Grid/Gems-Label"
@onready var coinslabel = $"Collections/MarginContainer/Collections-Grid/Coins-Label"
@onready var keyslabel = $"Collections/MarginContainer/Collections-Grid/Keys-Label"
@onready var healthcontainer = $"Health/MarginContainer/VBoxContainer/HealthBar-Container"

var healthScene = preload("res://scene/UI/heart.tscn")
var inventory_access = false
var instance

func update_collections():
	if player != null:
		gemslabel.text = str(player.get_gems())
		coinslabel.text = str(player.get_coins())
		keyslabel.text = str(player.get_keys())
		
func update_health():
	var current_hearts = healthcontainer.get_child_count()
	var current_health = 0
	if player != null:
		current_health = player.get_health()
	
	if current_health / 2 > current_hearts:
		var diff = current_health / 2 - current_hearts
		for x in range(0,diff):
			var inst = healthScene.instantiate()
			healthcontainer.add_child(inst)
	elif current_health / 2 < current_hearts:
		var diff = current_health / 2 - current_hearts
		for x in range(diff,0):
			var node = healthcontainer.get_child(x)
			healthcontainer.remove_child(node)
			node.queue_free()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	update_health()
	update_collections()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not inventory_access and Input.is_action_just_pressed("inventory"):
		instance = inventory.instantiate()
		UI_layer.add_child(instance)
		inventory_access = true
	elif inventory_access and Input.is_action_just_pressed("inventory"):
		inventory_access = false
		instance.queue_free()
		
	update_health()
	update_collections()
