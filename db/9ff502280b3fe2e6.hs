-- peakFollower ; a little decay
let d = dust 'α' AR 20 * line KR 0 1 4 DoNothing
in sinOsc AR (peakFollower d 0.999 * 1500 + 200) 0 * 0.1
