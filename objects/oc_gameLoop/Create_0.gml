// 0 - intro
// 1 - gameplay
// 2 - endscreen
state = 0

level = global.level

totalScore = 0

viewChange = 1

changeState = function(toState) {
   if (state == 0 && toState == 1) {
      instance_create_layer(0, 0, "Instances", o_ring)
   }
   if (state == 1 && toState == 2) {
      o_score.final()
   }
   debugMsg("Changing state to: " + string(toState))
   state = toState
}

if (os_get_config() == "dev" || global.level >= 3) {
   changeState(1)
} else {
   instance_create_layer(0, 0, "Instances", o_hole)
}

nextLevel = function() {
   global.level += 1
   room_restart()
}