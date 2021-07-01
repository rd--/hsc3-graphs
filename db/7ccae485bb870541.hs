-- diodeRingMod
let mf_sin = sinOsc ar
    mf_square f _ = X.blitB3Square ar f 0.99
    mf_ring_mod (lfo_ph,car_ph) car_freq lfo_type lfo_freq lfo_amp drive x_mix mod_sig =
      let range_2oct = range 0.25 2
          lfo = range_2oct (lfo_type lfo_freq lfo_ph * lfo_amp)
          car_sig = sinOsc ar (car_freq * lfo) car_ph
          mod_sig_post = mod_sig * drive
      in xFade2 mod_sig_post (X.diodeRingMod car_sig mod_sig_post) x_mix 1
    y = mouseY kr 0 1 Linear 0.2
    x = mouseX kr (-1) 1 Linear 0.2
in mf_ring_mod (0,0) 6.25 mf_sin 0.1 y 1 x (soundIn 0)
