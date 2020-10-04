// 0 - intro
// 1 - gameplay
// 2 - endscreen
state = 0

level = 2

totalScore = 0

viewChange = 1

changeState = function(toState) {
   if (state == 0 && toState == 1) {
      instance_create_layer(0, 0, "Instances", o_ring)
   }
   debugMsg("Changing state to: " + string(toState))
   state = toState
}

if (os_get_config() == "dev") {
   changeState(1)
} else {
   instance_create_layer(0, 0, "Instances", o_hole)
}