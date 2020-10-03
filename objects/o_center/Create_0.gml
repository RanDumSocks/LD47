spawnEnemy(50, 0, o_enemyBase, id)
spawnEnemy(150, 0, o_enemyBase, id)
spawnEnemy(250, 0, o_enemyBase, id)
spawnEnemy(350, 0, o_enemyBase, id)
spawnEnemy(450, 0, o_enemyBase, id)

// ---------------------------------------------------------------------------------------------------
#region Rotation Vars
// ---------------------------------------------------------------------------------------------------

rot = 0
rotVel = 0

#endregion
// ---------------------------------------------------------------------------------------------------

rotate = function(clockwise) {
   if (!clockwise) {
      rotVel += global.second * 5
   } else {
      rotVel -= global.second * 5
   }
}