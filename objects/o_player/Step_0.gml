if (keyboard_check(ord("W"))) {
   ring.changeSize(-global.second / 15)
} else if (keyboard_check(ord("S"))) {
   ring.changeSize(global.second / 15)
} else {
   ring.changeSize(0)
}

if (keyboard_check(ord("D"))) {
   ring.ref_center.rotate(false)
}

if (keyboard_check(ord("A"))) {
   ring.ref_center.rotate(true)
}