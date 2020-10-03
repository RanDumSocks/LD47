// ---------------------------------------------------------------------------------------------------
#region Init vars
// ---------------------------------------------------------------------------------------------------

ringSurf	= surface_create(room_width, room_height)

circleSize     = 0.5

lineWidth      = 0.004
defaultColor   = [255, 255, 255]		// READ-ONLY, default grid color
color          = defaultColor
radius         = 50
wobble         = 1
origin         = [0.5, 3.5]
surfTex        = surface_get_texture(ringSurf)
uvs            = texture_get_uvs(surfTex)



#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Shader Uniforms
// ---------------------------------------------------------------------------------------------------

uni_uvs			 = shader_get_uniform(sdr_ring, "spriteUV")
uni_lineWidth	 = shader_get_uniform(sdr_ring, "lineWidth")
uni_color		 = shader_get_uniform(sdr_ring, "customColor")
uni_radius		 = shader_get_uniform(sdr_ring, "radius")
uni_origin		 = shader_get_uniform(sdr_ring, "origin")
uni_ratio		 = shader_get_uniform(sdr_ring, "ratio")
uni_wobble		 = shader_get_uniform(sdr_ring, "wobble")
uni_period		 = shader_get_uniform(sdr_ring, "period")

#endregion
// ---------------------------------------------------------------------------------------------------

wob = function(amt) {
   wobble += amt
}