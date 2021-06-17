extends Area2D

#弾のシーンを事前に読み込み
const Shot = preload("res://Shot.tscn")

#弾発射のラグ
var cnt = 0

func _ready():
	pass #Replace with function body.

func _process(delta):
	#移動速度
	var speedFast = 500
	var speedSlow = 200
	var speed = speedFast * delta
	if Input.is_action_pressed("shift"):
		#Shiftキー押下時は低速
		speed = speedSlow * delta
	
	#移動
	var velocityPower = 1
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += velocityPower #右
	if Input.is_action_pressed("left"):
		velocity.x -= velocityPower #左
	if Input.is_action_pressed("up"):
		velocity.y -= velocityPower #上
	if Input.is_action_pressed("down"):
		velocity.y += velocityPower #下
	position += velocity.normalized() * speed
	
	#Spaceキー押下で弾を発射
	if Input.is_action_pressed("ui_select"):
		cnt += delta
		var coolTime = 0.1
		if cnt > coolTime:
			#カウントリセット
			cnt -= coolTime
			
			#弾生成
			var shot = Shot.instance()
			var shot2 = Shot.instance()
			var shot3 = Shot.instance()
			var shot4 = Shot.instance()
			
			#弾用の位置
			var shotPosition = position
			
			#ルートノードの取得、ルートノードへ設定
			var node = get_owner()
			node.add_child(shot)
			node.add_child(shot2)
			node.add_child(shot3)
			node.add_child(shot4)
			
			#弾の移動量の測定(位置の数字を変数化する必要あり 修正予定なのでそのまま)
			shot.start(shotPosition.x + 50, shotPosition.y, 90, 1000)
			shot2.start(shotPosition.x - 50, shotPosition.y, 90, 1000)
			shot3.start(shotPosition.x + 100, shotPosition.y + 50, 90, 1000)
			shot4.start(shotPosition.x - 100, shotPosition.y + 50, 90, 1000)

func hit(damage):
	#ダメージを受けたら消える処理
	#HPの設定などは後回し
	destory()
	
func destory():
	#削除
	queue_free()
