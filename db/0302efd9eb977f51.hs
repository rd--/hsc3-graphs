-- peakFollower ; mouse x controls decay
let dcy = mouseX KR 0.99 1.00001 Linear 0.2 `min` 1
    d = dust 'α' AR 20
in sinOsc AR (peakFollower d dcy * 1500 + 200) 0 * 0.1
