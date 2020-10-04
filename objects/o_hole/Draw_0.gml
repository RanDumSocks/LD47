// ---------------------------------------------------------------------------------------------------
#region Wobble Shader
// ---------------------------------------------------------------------------------------------------

shader_set(sdr_QEDHole);
shader_set_uniform_f(uni_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);

shader_set_uniform_f(uni_wobHeight, wobHeight);
shader_set_uniform_f(uni_wobSize, wobSize);
shader_set_uniform_f(uni_wobOffset, wobOffset + globalOffset);

shader_set_uniform_f(uni_wobHeight1, wobHeight1);
shader_set_uniform_f(uni_wobSize1, wobSize1);
shader_set_uniform_f(uni_wobOffset1, wobOffset1 + globalOffset);

shader_set_uniform_f(uni_wobHeight2, wobHeight2);
shader_set_uniform_f(uni_wobSize2, wobSize2);
shader_set_uniform_f(uni_wobOffset2, wobOffset2 + globalOffset);

draw_self();
shader_reset();

#endregion
// ---------------------------------------------------------------------------------------------------