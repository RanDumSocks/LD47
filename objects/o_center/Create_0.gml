var difficulty = (1/8) * (sqr(oc_gameLoop.level) - oc_gameLoop.level + (900 * ((power(2, oc_gameLoop.level/7) - power(2, 1/7)) / (power(2, 1/7) - 1))))
var maxR = (o_ring.circleSize - 1) * room_height
debugMsg(difficulty)

// maxR * sqrt(random(1))

var typeChances = [3, 2, 1]
var typeCTotal = 0
for (var i = 0; i < array_length(typeChances); i++) {
   typeCTotal += typeChances[i]
}

while (difficulty >= 0) {
   var type = irandom(typeCTotal - 1)
   
   var r = maxR * sqrt(random(1))
   var t = random(2 * pi)
   
   /*
   if (type <= typeChances[x]) {
      
   } else { type -= typeChances[x] }
   */
   
   if (type < typeChances[0]) {
      spawnEnemy(r, t, o_enemyBase, id)
      difficulty -= 1
      continue
   } else { type -= typeChances[0] }
   
   if (type < typeChances[1]) {
      spawnEnemy(r, t, o_rotEnem, id)
      difficulty -= 2
      continue
   } else { type -= typeChances[1] }
      
   if (type < typeChances[2]) {
      debugMsg("test")
      var length = irandom(9) + 3
      var enm = spawnEnemy(r, t, o_wall, id)
      enm.init(length)
      difficulty -= length / 3
      continue
   } else { type -= typeChances[2] }
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