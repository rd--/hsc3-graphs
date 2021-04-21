-- ramp ; control inputs
let db = control KR "db" (-60)
    dur = control KR "dur" 0.1
in sinOsc AR 110 0 * ramp (dbAmp db) dur
