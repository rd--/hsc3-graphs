-- varSaw ; slow indeterminate modulation of width, http://sccode.org/1-5as
let midinote = 60
    gate_ = 1
    amp = 0.25
    asr = envASR 0.1 1 0.1 (EnvNum (-4))
    env = envGen KR gate_ 1 0 1 RemoveSynth asr
    freq = midiCPS midinote
    width = range 0.2 0.8 (lfNoise2 'α' KR 1) * range 0.7 0.8 (sinOsc KR 5 (rand 'β' 0.0 1.0))
in varSaw AR freq 0 width * env * amp
