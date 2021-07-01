-- control ; ir and kr and tr controls ; setting amp also triggers an envelope
let phase1 = control ir "phase1" 0
    phase2 = control ir "phase2" (pi / 4)
    freq1 = control kr "freq1" 450
    freq2 = control kr "freq2" 900
    amp1 = trigControl "amp1" 0
    amp2 = trigControl "amp2" 0
    env = decay2 (impulse kr 1 0 * 0.1 + mce2 amp1 amp2) 0.01 0.2
in sinOsc ar (mce2 freq1 freq2) (mce2 phase1 phase2) * env
