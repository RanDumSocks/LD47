// ---------------------------------------------------------------------------------------------------
#region Draw Shader
// ---------------------------------------------------------------------------------------------------

draw_set_alpha(1)
if (!surface_exists(ringSurf)){
	ringSurf = surface_create(room_width, room_height)
   surfTex  = surface_get_texture(ringSurf)
   uvs      = texture_get_uvs(surfTex)
}

surface_set_target(ringSurf)
draw_clear_alpha(c_white, 0)
surface_reset_target()

shader_set(sdr_ring)

shader_set_uniform_f(uni_uvs, uvs[0], uvs[1], uvs[2], uvs[3])
shader_set_uniform_f(uni_lineWidth, lineWidth)
shader_set_uniform_f(uni_color, color[0], color[1], color[2])
shader_set_uniform_f(uni_radius, radius)
shader_set_uniform_f(uni_origin, origin[0], origin[1])
shader_set_uniform_f(uni_ratio, room_width / room_height)
shader_set_uniform_f(uni_wobble, log10(wobble) / 100)
shader_set_uniform_f(uni_period, global.secondsPassed * 10)

draw_surface(ringSurf, 0, 0)

shader_reset()

#endregion
// ---------------------------------------------------------------------------------------------------