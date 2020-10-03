if (keyboard_check(ord("W"))) {
   ring.changeSize(-global.second / 15)
   if (ring.circleSize > 0) {
      ring.addScore(global.second * 5)
   }
} else {
   ring.changeSize(0)
}

if (keyboard_check(ord("D"))) {
   ring.ref_center.rotate(false)
}

if (keyboard_check(ord("A"))) {
   ring.ref_center.rotate(true)
}

y_offset += smoothVar(y_offset, 0, 0.2)

if (ring.circleSize < 0.5) {
   y = (room_height - ((0.5 - ring.circleSize) * room_height)) + y_offset
} else {
   y = room_height + y_offset  
}