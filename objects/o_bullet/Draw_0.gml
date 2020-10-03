// ---------------------------------------------------------------------------------------------------
#region Draw Setup
// ---------------------------------------------------------------------------------------------------

gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
draw_set_alpha(1)

var spriteHeight = sprite_get_height(sprite_index)
var spriteWidth = sprite_get_width(sprite_index)

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Draw Particle
// ---------------------------------------------------------------------------------------------------

if (surface_exists(particleSurf)) {
	// Surface manipulation
	if (surface_get_width(particleSurf) != spriteWidth + (2 * blurAmount) || 
	      surface_get_height(particleSurf) != spriteHeight + (2 * blurAmount)) {
		surface_resize(particleSurf, spriteWidth + (2 * blurAmount), spriteHeight + (2 * blurAmount));	
	}
	
	// Draw original sprite
	surface_set_target(particleSurf);
	draw_clear_alpha(c_black, 0.0);
	draw_sprite(sprite_index, image_index, surface_get_width(particleSurf) / 2,
				surface_get_height(particleSurf) / 2);
	gpu_set_blendmode(bm_normal);
	
	// Draw sprite glow
	draw_sprite_ext(sprite_index, 0, surface_get_width(particleSurf) / 2,
					surface_get_height(particleSurf) / 2, 1, 1, 0, c_white, glowAlpha);
	surface_reset_target();
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	
	// Motion Blur
	shader_set(sdr_motionBlur);
	shader_set_uniform_f(uni_blurDirection, blurDirection);
	shader_set_uniform_f(uni_blurAmount, blurAmount);
	var texel = surface_get_texture(particleSurf)
	shader_set_uniform_f(uni_texelWidth, texture_get_texel_width(texel));
	shader_set_uniform_f(uni_texelHeight, texture_get_texel_height(texel));
	
	draw_surface(particleSurf, x - (surface_get_width(particleSurf) / 2),
				 y - (surface_get_height(particleSurf) / 2));
	shader_reset();
} else {
	particleSurf = surface_create(spriteWidth + (2 * blurAmount), spriteHeight + (2 * blurAmount));
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Draw Reset
// ---------------------------------------------------------------------------------------------------

gpu_set_blendmode(bm_normal);

#endregion
// ---------------------------------------------------------------------------------------------------