/*for (var i = 0; i < 50 * oc_gameLoop.level; i++) {
   spawnEnemy(random(250), random(2 * pi), o_enemyBase, id)
}

for (var i = 0; i < 20 * oc_gameLoop.level; i++) {
   spawnEnemy(random(250), random(2 * pi), o_rotEnem, id)
}*/

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