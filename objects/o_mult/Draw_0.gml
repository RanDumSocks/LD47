event_inherited();

draw_set_color(c_white)
draw_set_alpha(alpha)
draw_line_width(draw_x - comboLine,
                draw_y + lineOffset,
                draw_x + comboLine,
                draw_y + lineOffset,
                2)

draw_set_alpha(1)