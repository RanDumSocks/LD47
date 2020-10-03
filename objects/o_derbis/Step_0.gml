// ---------------------------------------------------------------------------------------------------
#region Position translation
// ---------------------------------------------------------------------------------------------------

x = (pos[0] * cos(pos[1] + ref_center.rot)) + ref_center.x
y = (pos[0] * sin(pos[1] + ref_center.rot)) + ref_center.y

pos[0] += posDir[0] * global.second * 50
pos[1] += posDir[1] * global.second

posDir[0] += smoothVar(posDir[0], 0, 0.4)
posDir[1] += smoothVar(posDir[1], 0, 0.4)

#endregion
// ---------------------------------------------------------------------------------------------------


image_alpha -= global.second

if (image_alpha <= 0 || ref_center.ring.circleSize * room_width < pos[0]) {
   instance_destroy()  
}

