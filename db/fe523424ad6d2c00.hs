-- bPeakEQ ; parametric
let hf z = bPeakEQ
           z
           (control_m KR "hfFreq" 4000 (800,20000,"exp"))
           (control_m KR "hfRQ" 1 (0.01,2,"lin"))
           (control_m KR "hfGain" 0 (-15,15,"lin"))
    mf z = bPeakEQ
           z
           (control_m KR "mfFreq" 1000 (200,5000,"exp"))
           (control_m KR "mfRQ" 1 (0.01,2,"lin"))
           (control_m KR "mfGain" 0 (-15,15,"lin"))
    lf z = bPeakEQ
           z
           (control_m KR "lfFreq" 100 (20,500,"exp"))
           (control_m KR "lfRQ" 1 (0.01,2,"lin"))
           (control_m KR "lfGain" 0 (-15,15,"lin"))
    sig = pinkNoise 'α' AR * 0.1
in hf (mf (lf sig))
