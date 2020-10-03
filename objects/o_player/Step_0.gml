if (keyboard_check(ord("W"))) {
   ring.changeSize(-global.second / 30)
}

if (keyboard_check(ord("D"))) {
   ring.ref_center.rotate(false)
}

if (keyboard_check(ord("A"))) {
   ring.ref_center.rotate(true)
}