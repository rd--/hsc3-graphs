-- poll
let t = impulse KR 10 0
    l = line KR 0 1 1 RemoveSynth
in poll t l 0 (label "polling...")
