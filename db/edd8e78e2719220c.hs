-- peakFollower ; follow a sine lfo, decay controlled by mouse x
let dcy = mouseX KR 0 1.1 Linear 0.2 `min` 1
    sig = sinOsc KR 0.2 0
in sinOsc AR (mce2 sig (peakFollower sig dcy) * 200 + 500) 0 * 0.1
