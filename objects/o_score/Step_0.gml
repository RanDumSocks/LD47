dispScore += smoothVar(dispScore, o_ring.plrScore, 0.2)
draw_y += smoothVar(draw_y, targetDraw_y, 0.2)

drawString = floor(dispScore)

event_inherited();

