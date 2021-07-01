-- index ; mouse control
let b = asLocalBufId 'α' [200, 300, 400, 500, 600, 800]
    f = index b (mouseX kr 0 7 Linear 0.2)
in sinOsc ar f 0 * 0.1
