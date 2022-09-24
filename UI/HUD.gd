extends Control

var lives_pos = Vector2.ZERO
var lives_index = 30
var live_index = 30
var var_scene = 0 

onready var Indicator = load("res://UI/Indicator.tscn")

func _ready():
	lives_pos.x = 20
	lives_pos.y = Global.VP.y -20
	update_score()
	update_time()
	update_lives()
	update_ammo()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_time():
	$Time.text = "Time Remaining: " + str(Global.time)

func update_ammo(): 
	$Ammo.text = "Ammo: " + str(Global.ammo)


func update_lives(): 
	lives_pos = Vector2(20, Global.VP.y -20)
	for child in $Indicator_Container.get_children():
		 child.queue_free()
	for i in range(Global.lives):
		var indicator = Indicator.instance()
		indicator.position = lives_pos + Vector2(lives_index*i, 0)
		$Indicator_Container.add_child(indicator)


func _on_Timer_timeout():
	Global.time -= 1
	update_time()
	if Global.time < 0: 
		var_scene = get_tree().change_scene("res://UI/End_Game.TSCN")
	else: 
		update_time()
