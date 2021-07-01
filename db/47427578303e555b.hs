-- whiteNoise ; speaker balance
let x = mouseX kr 0.1 2 Linear 0.2
    y = mouseY kr (-90) (-30) Linear 0.2
    l = sinOsc kr x 0
    n = whiteNoiseId 'α' ar
in pan2 n l (dbAmp y)
