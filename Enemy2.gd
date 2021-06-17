#Enemy.gdを継承
#ほぼ同じ挙動を行う
#下に行くスピードのみ変更
extends "res://Enemy.gd"

#加速に必要な数値(フィーリング)
var dashSpeed = 0.001
var plusSpeed = 0.03

func _ready():
	#お試しなので一旦マジックナンバーを使用
	position = Vector2(800, 50)
	velocity.x = 200 * cos(deg2rad(90))
	velocity.y = 200 * -sin(deg2rad(90))
	pass # Replace with function body.

func _physics_process(delta):		
	#敵の移動
	#加速していくタイプ
	position -= velocity * (delta * dashSpeed)
	dashSpeed = dashSpeed + plusSpeed


func _on_ZakoEnemy2_area_entered(area):
	if area.name == "Player":
		area.hit(1) #Playerに１ダメージ
