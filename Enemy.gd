extends Area2D

func _ready():
	pass # Replace with function body.

func destroy():
	#消去
	queue_free()

func _on_Enemy_area_entered(area):
	if area.name == "Player":
		area.hit(1) #Playerに１ダメージ
		destroy()#ぶつかることにより、消える
