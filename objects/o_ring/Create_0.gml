// ---------------------------------------------------------------------------------------------------
#region Init vars
// ---------------------------------------------------------------------------------------------------

ringSurf	= surface_create(room_width, room_height)

circleSize     = 1
circleSizeDt   = 0

lineWidth      = 0.004
defaultColor   = [255, 255, 255]		// READ-ONLY, default grid color
color          = defaultColor
radius         = 50
wobble         = 1
origin         = [0.5, 3.5]
surfTex        = surface_get_texture(ringSurf)
uvs            = texture_get_uvs(surfTex)

ref_player = instance_create_layer(0, 0, "Instances", o_player)
ref_player.ring = id

ref_center = instance_create_layer(0, 0, "Instances", o_center)
ref_center.ring = id

instance_create_layer(0, 0, "Instances", oc_gridSelector)
instance_create_layer(0, 0, "Instances", o_score)

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

changeSize = function(amt) {
   circleSizeDt += smoothVar(circleSizeDt, amt, 0.2)
   circleSize += circleSizeDt
}