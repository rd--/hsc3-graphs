-- rotate2 ; rotation of stereo sound, via LFO
let x = pinkNoise 'α' AR
    y = lfTri AR 800 0 * lfPulse KR 3 0 0.3
in rotate2 x y (lfSaw KR 0.1 0) * 0.1
