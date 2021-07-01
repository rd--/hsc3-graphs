-- spring ; mouse control ; button=gate ; x=spring-constant ; y=damping
let inforce = k2a (mouseButton kr 0 1 0) `greater_than` 0
    k = mouseX kr 0.1 20 Exponential 0.2
    d = mouseY kr 0.00001 0.1 Exponential 0.2
    outforce = spring ar inforce k d
    freq = outforce * 400 + 500 -- modulate frequency with the force
in sinOsc ar freq 0 * 0.1
