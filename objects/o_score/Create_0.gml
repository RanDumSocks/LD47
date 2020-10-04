event_inherited();

draw_x = room_width / 2
draw_y = -150
targetDraw_y = 30
fontSize	= 50
centered	= true
hoverable	= false

dispScore = 0

var obj = instance_create_layer(x, y, "gui", o_mult)
obj.sibling = id