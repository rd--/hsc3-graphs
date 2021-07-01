-- pitch
let x = mouseX kr 220 660 Linear 0.1
    y = mouseY kr 0.05 0.25 Linear 0.1
    s = sinOsc ar x 0 * y
    a = amplitude kr s 0.05 0.05
    f = pitch s 440 60 4000 100 16 7 0.02 0.5 1 0
in mce [s, sinOsc ar (mceChannel 0 f / 2) 0 * a]
