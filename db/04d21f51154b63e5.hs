-- rotate2 ; rotation of stereo sound, via LFO
let x = pinkNoiseId 'α' ar
    y = lfTri ar 800 0 * lfPulse kr 3 0 0.3
in rotate2 x y (lfSaw kr 0.1 0) * 0.1
