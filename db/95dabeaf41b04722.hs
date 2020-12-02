-- rObxdFilter ; multimode selects the filter mode, the range is (0,1), there are four modes.
let cutoff = mouseX KR 110.0 (110.0 * 16) Exponential 0.2
    multimode = mouseY KR 0.0 1.0 Linear 0.2
    fourpole = 1.0
in X.rObxdFilter (pinkNoise 'α' AR * 0.5) cutoff 0.0 multimode 0.0 fourpole
