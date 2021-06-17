extends Area2D

#移動方向
var velocity = Vector2()

func _ready():
	#お試しなので一旦マジックナンバーを使用
	position = Vector2(580, 50)
	velocity.x = 200 * cos(deg2rad(90))
	velocity.y = 200 * -sin(deg2rad(90))
	pass # Replace with function body.

func _physics_process(delta):		
	#敵の移動
	position -= velocity * delta	

func destroy():
	#消去
	queue_free()

func _on_Enemy_area_entered(area):
	if area.name == "Player":
		area.hit(1) #Playerに１ダメージ
