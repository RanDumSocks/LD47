function spawnEnemy(posR, posT, object, centerObj){
   var obj = instance_create_layer(0, 0, "Instances", object)
   obj.pos = [posR, posT]
   obj.ref_center = centerObj
}