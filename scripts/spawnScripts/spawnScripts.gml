function spawnEnemy(posR, posT, object, centerObj){
   var obj = instance_create_layer(-1000, -1000, "Instances", object)
   obj.pos = [posR, posT]
   obj.ref_center = centerObj
   obj.init()
   return obj
}