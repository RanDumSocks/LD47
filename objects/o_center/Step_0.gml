y = room_height - (ring.origin[1] * room_height)
x = room_width / 2

if (!keyboard_check(ord("A")) && !keyboard_check(ord("D"))) {
   if (abs(rotVel) < global.second * 4) {
      rotVel = 0
   } else if (rotVel < 0) {
      rotVel += global.second * 3
   } else if (rotVel > 0) {
      rotVel -= global.second * 3
   }
} else if (rotVel > 1) {
   rotVel = 1
} else if (rotVel < -1) {
   rotVel = -1  
}

var rotAmt = (global.second * (1 / (ring.circleSize * 4)) * rotVel)
rot += rotAmt 
