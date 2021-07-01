-- pmOsc ; composite of sinOsc, ie. sinOsc r cf (sinOsc r mf mp * pm) ; modulate carfreq
pmOsc ar (line kr 600 900 5 DoNothing) 600 3 0 * 0.1
