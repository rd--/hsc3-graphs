-- ramp ; control inputs
let db = control kr "db" (-60)
    dur = control kr "dur" 0.1
in sinOsc ar 110 0 * ramp (dbAmp db) dur
