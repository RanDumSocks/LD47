if ((ref_center.ring.circleSize * room_width) > pos[0]) {
   instance_destroy()
   instance_destroy(other)
   
   var change = o_ring.addScore(points)

   var obj = instance_create_layer(0, y, "gui", o_enemyPts)
   obj.draw_x = x
   obj.draw_y = y
   obj.drawString = change
}

 /*
with (o_enemyBase) {
   var dist = distance_to_point(other.x, other.y)
   var dr = pos[0] - other.pos[0]
   if (abs(pos[1] - other.pos[1]) < pi) {
      var dt = pos[1] - other.pos[1]
   } else {
      dt = 0
   }
   
   
   if (dr > 0) {
      posDir[0] = 50 / sqr(dr + abs(dt * 50))
   } else {
      posDir[0] = -50 / sqr(dr + abs(dt * 50))
   }
   
   /*
   if (pos[0] > other.pos[0]) {
      posDir[0] = sqrt(power(ur, 2) + power(vr, 2) + ((ur * vr) * ((cos(ut)*cos(vt)) + (sin(ut)*sin(vt))))) / 1000
   } else {
      posDir[0] = -sqrt(power(ur, 2) + power(vr, 2) + ((ur * vr) * ((cos(ut)*cos(vt)) + (sin(ut)*sin(vt))))) / 1000
   }*/
   
   /*
   if (pos[1] > other.pos[1]) {
      if (xChange < 0) {
         posDir[1] = 0.001 / power(arctan(yChange / xChange) + pi, 2)
      } else if (yChange < 0) {
         posDir[1] = 0.001 / power(arctan(yChange / xChange) + (2*pi), 2)
      } else {
         posDir[1] = 0.001 / power(arctan(yChange / xChange), 2)
      }
   } else {
      if (xChange < 0) {
         posDir[1] = -0.001 / power(arctan(yChange / xChange) + pi, 2)
      } else if (yChange < 0) {
         posDir[1] = -0.001 / power(arctan(yChange / xChange) + (2*pi), 2)
      } else {
         posDir[1] = -0.001 / power(arctan(yChange / xChange), 2)
      }
   }
   
}*/
