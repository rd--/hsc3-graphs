-- control ; ir and kr and tr controls ; setting amp also triggers an envelope
let phase1 = control IR "phase1" 0
    phase2 = control IR "phase2" (pi / 4)
    freq1 = control KR "freq1" 450
    freq2 = control KR "freq2" 900
    amp1 = tr_control "amp1" 0
    amp2 = tr_control "amp2" 0
    env = decay2 (impulse KR 1 0 * 0.1 + mce2 amp1 amp2) 0.01 0.2
in sinOsc AR (mce2 freq1 freq2) (mce2 phase1 phase2) * env
