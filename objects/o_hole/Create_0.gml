// ---------------------------------------------------------------------------------------------------
#region Wobble Variables
// ---------------------------------------------------------------------------------------------------

humps			= 3;
globalOffset	= 0;

wobHeight		= 0.06;
wobSize			= 2.5;
wobOffset		= 0.0;
wobTime			= 7;
wobTimeMul		= 1;
wobHeightMul	= 20;
wobOffsetMax	= 0;

wobHeight1		= 0.06;
wobSize1		= 2.5;
wobOffset1		= 2;
wobTime1		= 7;
wobTimeMul1		= 1;
wobHeightMul1	= 15;
wobOffsetMax1	= 0;

wobHeight2		= 0.06;
wobSize2		= 2.5;
wobOffset2		= 2;
wobTime2		= 7;
wobTimeMul2		= 1;
wobHeightMul2	= 15;
wobOffsetMax2	= 0;

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Shader Uniforms
// ---------------------------------------------------------------------------------------------------

uvs = sprite_get_uvs(sp_QED, 0);
uni_uvs			= shader_get_uniform(sdr_QEDHole, "spriteUV");

uni_wobHeight	= shader_get_uniform(sdr_QEDHole, "wobHeight");
uni_wobSize		= shader_get_uniform(sdr_QEDHole, "wobSize");
uni_wobOffset	= shader_get_uniform(sdr_QEDHole, "wobOffset");

uni_wobHeight1	= shader_get_uniform(sdr_QEDHole, "wobHeight1");
uni_wobSize1	= shader_get_uniform(sdr_QEDHole, "wobSize1");
uni_wobOffset1	= shader_get_uniform(sdr_QEDHole, "wobOffset1");

uni_wobHeight2	= shader_get_uniform(sdr_QEDHole, "wobHeight2");
uni_wobSize2	= shader_get_uniform(sdr_QEDHole, "wobSize2");
uni_wobOffset2	= shader_get_uniform(sdr_QEDHole, "wobOffset2");

#endregion
// ---------------------------------------------------------------------------------------------------