drawString = "×" + string(o_ring.plrMult)
draw_y = sibling.draw_y + sibling.stringHeight - 17

alpha += smoothVar(alpha, targetAlpha, 0.2)

comboLine += smoothVar(comboLine, (o_ring.killCombo % 10) * comboExt, 0.2)

event_inherited();

