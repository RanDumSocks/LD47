if ((ref_center.ring.circleSize * room_width) + (sprite_height / 2) > pos[0]) {
   o_ring.color = [255, 0, 0]
   o_ring.wob(1)
   var change = o_ring.subScore(points * 2)

   var obj = instance_create_layer(0, y, "gui", o_enemyPts)
   obj.draw_x = x
   obj.draw_y = y
   obj.drawString = change
   obj.strokeCol = c_red

   instance_destroy()
}