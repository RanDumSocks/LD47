// ---------------------------------------------------------------------------------------------------
#region Adjust circle size
// ---------------------------------------------------------------------------------------------------

origin[1] = circleSize + 0.0
radius = circleSize

if (circleSize < 0.5) {
   origin[1] = circleSize * (0.5 / circleSize)
}

wobble += smoothVar(wobble, 1, 0.2)
if (wobble < 1) {
   wobble = 1  
}

changeSize(-global.second / 100)

if (circleSize <= -0.1) {
   circleSize = -0.1  
}

#endregion
// ---------------------------------------------------------------------------------------------------