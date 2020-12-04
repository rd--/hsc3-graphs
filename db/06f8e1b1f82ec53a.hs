-- envGate ; default arguments, as used by envGate_def
let k = control KR
    e = envGate 1 (k "gate" 1) (k "fadeTime" 0.02) RemoveSynth EnvSin
in lpf (saw AR 200) 600 * 0.1 * e
