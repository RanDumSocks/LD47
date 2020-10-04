dispScore += smoothVar(dispScore, o_ring.plrScore, 0.2)
draw_y += smoothVar(draw_y, targetDraw_y, 0.2)

if (dispScore >= 0) {
   drawString = floor(dispScore)
   strokeCol = c_white
} else {
   drawString = "-" + string(ceil(-dispScore))
   strokeCol = c_red
}

alpha += smoothVar(alpha, targetAlpha, 0.2)
if (alpha <= 0) {
   oc_gameLoop.nextLevel()
}


event_inherited();