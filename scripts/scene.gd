extends Node

# Set some variables up
var websocket
var message = ''


func _ready():
	set_process(true)

	websocket = preload('res://scripts/websocket.gd').new(self)
	websocket.start('echo.websocket.org', 80)
	websocket.set_receiver(self, '_on_message_received')


func _process(delta):
	get_node('message').set_text('Server says: "' + str(message) + '"' if message else '')


func _on_message_received(msg):
	print(msg)
	message = msg


func _on_button_pressed():
	message = ''
	websocket.send('Hi server')
	print('cl')
