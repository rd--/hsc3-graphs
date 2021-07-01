-- peakFollower ; follow a sine lfo, decay controlled by mouse x
let dcy = mouseX kr 0 1.1 Linear 0.2 `min` 1
    sig = sinOsc kr 0.2 0
in sinOsc ar (mce2 sig (peakFollower sig dcy) * 200 + 500) 0 * 0.1
