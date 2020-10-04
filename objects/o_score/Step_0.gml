dispScore += smoothVar(dispScore, o_ring.plrScore, 0.2)
draw_y += smoothVar(draw_y, targetDraw_y, 0.2)

if (dispScore >= 0) {
   drawString = floor(dispScore)
   strokeCol = c_white
} else {
   drawString = "-" + string(ceil(-dispScore))
   strokeCol = c_red
}


event_inherited();

