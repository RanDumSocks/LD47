// ---------------------------------------------------------------------------------------------------
#region Adjust circle size
// ---------------------------------------------------------------------------------------------------

origin[1] = circleSize + 0.0
radius = circleSize

wobble += smoothVar(wobble, 1, 0.2)
if (wobble < 1) {
   wobble = 1  
}

#endregion
// ---------------------------------------------------------------------------------------------------