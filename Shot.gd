extends Area2D

#移動方向
var velocity = Vector2()

#開始
func start(x, y, deg, speed):
	position = Vector2(x, y)
	velocity.x = speed * cos(deg2rad(deg))
	velocity.y = speed * -sin(deg2rad(deg))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):	
	#弾の移動
	position += velocity * delta

func _on_Shot_area_entered(area):
	if "Enemy" in area.name: #敵キャラに弾が当たれば
		area.destroy() #敵を爆殺
		queue_free() #弾も消える
