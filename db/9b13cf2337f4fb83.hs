-- indexL ; mouse control
let b = asLocalBuf 'α' [200,300,400,500,600,800]
    x = mouseX KR 0 7 Linear 0.2
in sinOsc AR (mce2 (indexL b x) (index b x)) 0 * 0.1
