var difficulty = (1/8) * (sqr(oc_gameLoop.level) - oc_gameLoop.level + (150 * ((power(2, oc_gameLoop.level/7) - power(2, 1/7)) / (power(2, 1/7) - 1))))
debugMsg(difficulty)
var maxR = (o_ring.circleSize - 1) * room_height

for (var i = 0; i < 50 * oc_gameLoop.level; i++) {
   spawnEnemy(random(maxR), random(2 * pi), o_enemyBase, id)
}

for (var i = 0; i < 20 * oc_gameLoop.level; i++) {
   spawnEnemy(random(maxR), random(2 * pi), o_rotEnem, id)
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