-- poll
let t = impulse kr 10 0
    l = line kr 0 1 1 RemoveSynth
in poll t l 0 (label "polling...")
