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
			
			#弾の移動量の測定
			shot.start(0, 0, 90, 1000)
			
			#ルートノードの取得
			add_child(shot)
