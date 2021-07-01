-- gVerb ; controls
let roomsize = control kr "roomsize" 10.0
    revtime = control kr "revtime" 3.0
    damping = control kr "damping" 0.5
    inputbw = control kr "inputbw" 0.5
    spread = control kr "spread" 15.0
    drylevel = control kr "drylevel" 1.0
    earlyreflevel = control kr "earlyreflevel" 0.7
    taillevel = control kr "taillevel" 0.5
    maxroomsize = control kr "maxroomsize" 300.0
in gVerb (soundIn 0) roomsize revtime damping inputbw spread drylevel earlyreflevel taillevel maxroomsize
