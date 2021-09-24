-- varSaw ; slow indeterminate modulation of width, http://sccode.org/1-5as
let midinote = 60
    gate_ = 1
    amp = 0.25
    asr = envASR 0.1 1 0.1 (EnvNum (-4))
    env = envGen kr gate_ 1 0 1 RemoveSynth asr
    freq = midiCps midinote
    width = range 0.2 0.8 (lfNoise2Id 'α' kr 1) * range 0.7 0.8 (sinOsc kr 5 (randId 'β' 0.0 1.0))
in varSaw ar freq 0 width * env * amp
