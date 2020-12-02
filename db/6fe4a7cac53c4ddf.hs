-- rotate2 ; rotation of stereo sound, via mouse ; rotateStereo is MCE form
let x = mix (lfSaw AR (mce [198..201]) 0) * 0.25
    y = sinOsc AR 900 0 * lfPulse KR 3 0 0.3
    p = mouseX KR 0 2 Linear 0.2
in rotateStereo (mce2 x y) p * 0.1
