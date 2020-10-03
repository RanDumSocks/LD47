blurAmount			= 20
blurDirection		= 0
xPrev				   = x
yPrev				   = y
glowAlpha			= 0
speedMult         = 1

particleSurf = surface_create(sprite_width + (2 * blurAmount), sprite_height + (2 * blurAmount));

// ---------------------------------------------------------------------------------------------------
#region Shader Uniforms
// ---------------------------------------------------------------------------------------------------

uni_blurDirection = shader_get_uniform(sdr_motionBlur, "direction")
uni_blurAmount = shader_get_uniform(sdr_motionBlur, "amount")
uni_texelWidth = shader_get_uniform(sdr_motionBlur, "texelWidth")
uni_texelHeight = shader_get_uniform(sdr_motionBlur, "texelHeight")

#endregion
// ---------------------------------------------------------------------------------------------------
