if ((ref_center.ring.circleSize * room_width) > pos[0]) {
   instance_destroy(other)
   if (life <= 0) {
      instance_destroy()
   
      var change = o_ring.addScore(points)
      o_ring.addKill(id)

      var obj = instance_create_layer(0, y, "gui", o_enemyPts)
      obj.draw_x = x
      obj.draw_y = y
      obj.drawString = floor(change)
   } else {
      life -= 1
      spawnDerbis(4)
   }
}