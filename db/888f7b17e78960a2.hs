-- rObxdFilter ; controls
let k = control KR
    c1 = k "cutoff" 440.0
    c2 = k "resonance" 0.0
    c3 = k "multimode" 0.5
    c4 = k "bandpass" 0.0
    c5 = k "fourpole" 0.0
in X.rObxdFilter (pinkNoise 'α' AR * 0.5) c1 c2 c3 c4 c5
