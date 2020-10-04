if (state == 1) {
   if (o_ring.circleSize < 0) {
      changeState(2)
   }
} else if (state == 0) {
   viewChange += (global.second * (viewChange / 2))
   camera_set_view_size(view_camera[0], room_width - viewChange, room_height - viewChange)
   camera_set_view_pos(view_camera[0], viewChange / 2, viewChange / 2)
   if (viewChange >= 350) {
      camera_set_view_size(view_camera[0], room_width, room_height)
      camera_set_view_pos(view_camera[0], 0, 0)
      instance_destroy(o_hole)
      changeState(1)
   }
}