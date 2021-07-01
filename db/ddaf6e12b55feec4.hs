-- bPeakEQ ; parametric
let hf z = bPeakEQ
           z
           (control_m kr "hfFreq" 4000 (800,20000,"exp"))
           (control_m kr "hfRQ" 1 (0.01,2,"lin"))
           (control_m kr "hfGain" 0 (-15,15,"lin"))
    mf z = bPeakEQ
           z
           (control_m kr "mfFreq" 1000 (200,5000,"exp"))
           (control_m kr "mfRQ" 1 (0.01,2,"lin"))
           (control_m kr "mfGain" 0 (-15,15,"lin"))
    lf z = bPeakEQ
           z
           (control_m kr "lfFreq" 100 (20,500,"exp"))
           (control_m kr "lfRQ" 1 (0.01,2,"lin"))
           (control_m kr "lfGain" 0 (-15,15,"lin"))
    sig = pinkNoiseId 'α' ar * 0.1
in hf (mf (lf sig))
