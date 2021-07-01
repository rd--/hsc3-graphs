-- sos ; same as twopole
let theta = line kr (0.2 * pi) pi 5 RemoveSynth
    rho = line kr 0.6 0.99 5 RemoveSynth
    b1 = 2 * rho * cos theta
    b2 = - (rho * rho)
in sos (lfSaw ar 200 0 * 0.1) 1 0 0 b1 b2
