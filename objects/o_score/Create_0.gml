event_inherited();

draw_x = room_width / 2
draw_y = -150
targetDraw_y = 30
fontSize	= 50
centered	= true
hoverable	= false

targetAlpha = 1

dispScore = 0

var obj = instance_create_layer(x, y, "gui", o_mult)
obj.sibling = id

final = function() {
    targetDraw_y = room_height / 2
    o_mult.targetAlpha = 0
    alarm_set(0, 3 / global.second)
}