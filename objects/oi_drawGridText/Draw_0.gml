draw_set_font(drawFont);
draw_set_alpha(1);

// ---------------------------------------------------------------------------------------------------
#region Number Formatting
// ---------------------------------------------------------------------------------------------------

if (is_real(drawString)) {
	if (frac(drawString) == 0) {
		drawString	= formatNumber(drawString);
		stringWidth = string_width_ext(drawString, lineSep, lineBreak) * drawScale;
		if (centered) {
			centerAdj_x = stringWidth / 2;
			scaleAdj_x	= (stringWidth / 2) * abs(scale - 1);
		}
	}
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Adjust Alpha
// ---------------------------------------------------------------------------------------------------

if (alpha > 1) {
	alpha = 1;	
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Draw Text
// ---------------------------------------------------------------------------------------------------

if (surface_exists(drawSurface)) {
	
	if (surface_get_width(drawSurface) != ceil(stringWidth + (strokeWidth * 2)) ||
			surface_get_height(drawSurface) != ceil(stringHeight + (strokeWidth * 2)) ||
			drawString != prevDrawString ||
			strokeCol != prevStrokeCol ||
			fontSize != prevFontSize) {
		if (surface_get_width(drawSurface) != ceil(stringWidth + (strokeWidth * 2)) ||
				surface_get_height(drawSurface) != ceil(stringHeight + (strokeWidth * 2))) {
			surface_resize(drawSurface,
						   ceil(stringWidth + (strokeWidth * 2)),
						   ceil(stringHeight + (strokeWidth * 2)));
		}
		surface_set_target(drawSurface);
	
		if (centered) {
			draw_set_halign(fa_center);
		}
	
		if (drawString != prevDrawString) {
			prevDrawString = drawString;
		}
		
		if (strokeCol != prevStrokeCol) {
			prevStrokeCol = strokeCol;
		}
		
		if (fontSize != prevFontSize) {
			prevFontSize = fontSize;	
		}
		draw_clear_alpha(c_black, 0.0);
		draw_set_color(textColor);
		if (!customLines) {
			draw_text_ext_transformed(strokeWidth + centerAdj_x,
									  strokeWidth,
									  string_hash_to_newline(drawString),
									  string_height(drawString) + strokeWidth,
									  lineBreak,
									  drawScale,
									  drawScale,
									  0);
		} else {
			draw_text_ext_transformed(strokeWidth + centerAdj_x,
									  strokeWidth,
									  string_hash_to_newline(drawString),
									  string_height("x") + lineSep,
									  lineBreak,
									  drawScale,
									  drawScale,
									  0);	
		}
		draw_set_halign(fa_left);
		surface_reset_target();
	}
	
	surfTex = surface_get_texture(drawSurface);
	tex_w = texture_get_texel_width(surfTex);
	tex_h = texture_get_texel_height(surfTex);
	if (strokeWidth > 0) {
		shader_set(sdr_outline);
		shader_set_uniform_f(uni_fade, alpha);
		shader_set_uniform_f(uni_checks, strokeRes);
		shader_set_uniform_f(uni_stroke, strokeWidth);
		shader_set_uniform_f(uni_texelW, tex_w);
		shader_set_uniform_f(uni_texelH, tex_h);
		shader_set_uniform_f(uni_strokeCol,
							 color_get_red(strokeCol) / 255,
							 color_get_green(strokeCol) / 255,
							 color_get_blue(strokeCol) / 255);
	}
	if (centered) {
		draw_surface_ext(drawSurface,
						 draw_x - lengthdir_x(centerAdj_x, rot) + lengthdir_y(centerAdj_y, rot) +
							scaleAdj_x,
						 draw_y - lengthdir_y(centerAdj_y, rot - 90) - lengthdir_y(centerAdj_x, rot) +
							scaleAdj_y - strokeWidth,
						 scale,
						 scale,
						 rot,
						 c_white,
						 alpha);
	} else {
		
		draw_surface_ext(drawSurface,
						 draw_x - lengthdir_x(centerAdj_x, rot) + lengthdir_y(centerAdj_y, rot),
						 draw_y - lengthdir_y(centerAdj_y, rot - 90) - lengthdir_y(centerAdj_x, rot) -
							strokeWidth,
						 scale,
						 scale,
						 rot,
						 c_white,
						 alpha);
	}
	shader_reset();
	
} else {
	drawSurface = surface_create(ceil(stringWidth + strokeWidth), ceil(stringHeight + strokeWidth));
}

#endregion
// ---------------------------------------------------------------------------------------------------