fontSize += smoothVar(fontSize, min(targetSize, alpha * targetSize), 0.2)
//strokeWidth += smoothVar(strokeWidth, targetStroke, 0.2)
strokeWidth = 1

fakeAlpha -= global.second * 2
alpha = fakeAlpha

rot += rotVel

draw_x += posVel[0] * global.second
draw_y += posVel[1] * global.second

posVel[1] += 200 * global.second

if (alpha <= 0) {
   instance_destroy()  
}

event_inherited();
