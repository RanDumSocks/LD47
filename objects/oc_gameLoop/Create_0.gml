// 0 - intro
// 1 - gameplay
// 2 - endscreen
state = 0

level = 1

totalScore = 0

changeState = function(toState) {
   if (state == 0 && toState == 1) {
      instance_create_layer(0, 0, "Instances", o_ring)
   }
   debugMsg("Changing state to: " + string(toState))
   state = toState
}