-- peakFollower ; mouse x controls decay
let dcy = mouseX kr 0.99 1.00001 Linear 0.2 `min` 1
    d = dustId 'α' ar 20
in sinOsc ar (peakFollower d dcy * 1500 + 200) 0 * 0.1
