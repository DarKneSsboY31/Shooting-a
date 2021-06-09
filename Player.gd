extends Area2D

#弾のシーンを事前に読み込み
const Shot = preload("res://Shot.tscn")

#弾発射のラグ
var cnt = 0

func _ready():
	pass #Replace with function body.

func _process(delta):
	#移動速度
	var speed = 200 * delta
	
	#移動
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1 #右
	if Input.is_action_pressed("left"):
		velocity.x -= 1 #左
	if Input.is_action_pressed("up"):
		velocity.y -= 1 #上
	if Input.is_action_pressed("down"):
		velocity.y += 1 #下
	position += velocity.normalized() * speed
	
	#Spaceキー押下で弾を発射
	if Input.is_action_pressed("ui_select"):
		cnt += delta
		if cnt > 0.1:
			#カウントリセット
			cnt -= 0.1
			
			#弾生成
			var shot = Shot.instance()
			var shot2 = Shot.instance()
			var shot3 = Shot.instance()
			var shot4 = Shot.instance()
			
			#弾用の位置
			var shotPosition = position
			
			#弾の移動量の測定
			shot.start(shotPosition.x + 50, shotPosition.y, 90, 1000)
			shot2.start(shotPosition.x - 50, shotPosition.y, 90, 1000)
			shot3.start(shotPosition.x + 100, shotPosition.y + 50, 90, 1000)
			shot4.start(shotPosition.x - 100, shotPosition.y + 50, 90, 1000)
			
			#ルートノードの取得、ルートノードへ設定
			var node = get_owner()
			node.add_child(shot)
			node.add_child(shot2)
			node.add_child(shot3)
			node.add_child(shot4)
