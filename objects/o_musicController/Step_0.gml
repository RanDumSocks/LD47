if (!audio_is_playing(mus_intro) && !playing) {
   audio_play_sound(mus_main, 0, true)
   playing = true
}