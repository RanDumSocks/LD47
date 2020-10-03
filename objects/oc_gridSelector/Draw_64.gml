// ---------------------------------------------------------------------------------------------------
#region Draw Shader
// ---------------------------------------------------------------------------------------------------

draw_set_alpha(1);
if (!surface_exists(gridSelectorSurf)){
	gridSelectorSurf = surface_create(window_get_width(), window_get_height());
}

shader_set(sdr_gridSelector);

shader_set_uniform_f(uni_displaySize, window_get_width(), window_get_height());
shader_set_uniform_f(uni_lineWidth, lineWidth);
shader_set_uniform_f(uni_fade, fade);
shader_set_uniform_f(uni_fadePadding, lineWidth + padding);
shader_set_uniform_f(uni_color, color[0], color[1], color[2])

shader_set_uniform_f_array(uni_point1, point1Grid);
shader_set_uniform_f_array(uni_point2, point2Grid);

draw_surface(gridSelectorSurf, 0, 0);

shader_reset();

#endregion
// ---------------------------------------------------------------------------------------------------