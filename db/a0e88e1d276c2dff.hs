-- slope
let a = lfNoise2Id 'α' ar 2 {- quadratic noise -}
    b = slope a {- first derivative, line segments -}
    c = slope b {- second derivative, constant segments -}
    s = 0.0002
    f = mce [a, b * s, c * s * s] * 220 + 220
in mix (sinOsc ar f 0 * 0.1)
