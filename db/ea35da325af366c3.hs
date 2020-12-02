-- index ; mouse control
let b = asLocalBuf 'α' [200, 300, 400, 500, 600, 800]
    f = index b (mouseX KR 0 7 Linear 0.2)
in sinOsc AR f 0 * 0.1
