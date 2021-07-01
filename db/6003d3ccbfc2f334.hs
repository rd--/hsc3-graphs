-- rotate2 ; rotation of stereo sound, via mouse ; rotateStereo is MCE form
let x = mix (lfSaw ar (mce [198..201]) 0) * 0.25
    y = sinOsc ar 900 0 * lfPulse kr 3 0 0.3
    p = mouseX kr 0 2 Linear 0.2
in rotateStereo (mce2 x y) p * 0.1
