;; SinOsc ; event control ; p-field
Voicer(16, { :e | SinOsc((e.p * 127).MidiCps, 0) * e.w * e.z }).Splay2
