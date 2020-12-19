-- spring ; button=gate ; x=spring-constant ; y=damping
let inforce = k2a (mouseButton KR 0 1 0) `greater_than` 0
    k = mouseX KR 0.1 20 Exponential 0.2
    d = mouseY KR 0.00001 0.1 Exponential 0.2
    outforce = spring AR inforce k d
    freq = outforce * 400 + 500 -- modulate frequency with the force
in sinOsc AR freq 0 * 0.1
