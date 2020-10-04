var difficulty = (1/8) * (sqr(oc_gameLoop.level) - oc_gameLoop.level + (300 * ((power(2, oc_gameLoop.level/7) - power(2, 1/7)) / (power(2, 1/7) - 1))))
var maxR = (o_ring.circleSize - 1) * room_height
debugMsg(difficulty)

// maxR * sqrt(random(1))

while (difficulty >= 0) {
   var type = irandom(1)
   var r = maxR * sqrt(random(1))
   var t = random(2 * pi)
   if (type == 0) {
      spawnEnemy(r, t, o_enemyBase, id)
      difficulty -= 1
   } else if (type == 1) {
      spawnEnemy(r, t, o_rotEnem, id)
      difficulty -= 2
   }
}

// ---------------------------------------------------------------------------------------------------
#region Rotation Vars
// ---------------------------------------------------------------------------------------------------

rot = 0
rotVel = 0

#endregion
// ---------------------------------------------------------------------------------------------------

rotate = function(clockwise) {
   if (!clockwise) {
      rotVel += global.second * 15
   } else {
      rotVel -= global.second * 15
   }
}