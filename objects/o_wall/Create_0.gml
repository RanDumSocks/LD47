// Inherit the parent event
event_inherited();

points = 4

life = 4

image_alpha = 0

init = function(length) {
   for (var i = 0; i < length; i++) {
      var enm = spawnEnemy(pos[0] + ((i + 1) * sprite_height), pos[1], o_wall, ref_center)
      enm.init(0)
   }
}

spawnDerbis = function(amt) {
   for (var i = irandom(amt); i >= 0; i--) {
      var derb = instance_create_layer(0, 0, "Instances", o_derbis)
      derb.pos[0] = pos[0]
      derb.pos[1] = pos[1]
      derb.ref_center = ref_center
      derb.init()
   }
}