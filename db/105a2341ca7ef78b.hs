-- peakFollower ; no decay
let d = dustId 'α' ar 20 * line kr 0 1 4 DoNothing
in sinOsc ar (peakFollower d 1 * 1500 + 200) 0 * 0.1
