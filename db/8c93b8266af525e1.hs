-- https://swiki.hfbk-hamburg.de/MusicTechnology/851 march 2003 (adc) / (jrhb)
let freq = 50
    sustain = 1
    amp = 0.5
    hum = let t = dust kr (7 ** lfNoise1 kr 0.3)
              h = toggleFF (coinGate 0.4 t) * rlpf (lfPulse ar freq 0 0.5 + (lfNoise1 kr 2 * 0.5 - 0.5)) 6000 0.15
              n = trig t (tRand 0 0.01 (coinGate 0.4 t)) * whiteNoise ar
              m = trig t (tRand 0 0.01 (coinGate 0.4 t)) * brownNoise ar
              k = trig t (lfNoise1 kr (mce2 4 4.2) * 0.1 + 0.11) * lfClipNoise ar (lfNoise0 kr 7 * 30 + 40)
          in distort (leakDC ((h + n + m + k) * 10) 0.995)
    e = envGen kr 1 1 0 1 RemoveSynth (Envelope [amp,amp,0] [sustain,0] [] Nothing Nothing 0)
in clip2 hum 1 * e * 0.25
