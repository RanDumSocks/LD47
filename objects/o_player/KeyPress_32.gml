ring.wob(0.1)

y_offset += 5

var obj = instance_create_layer(x, y + sprite_height, "Instances", o_bullet)
obj.ring = ring

audio_play_sound(snd_shoot, 1, false)