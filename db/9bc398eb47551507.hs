-- runningSum
let z = soundIn 0
    a = runningSum z 40
in sinOsc ar 440 0 * a * 0.1
