-- indexL ; mouse control
let b = asLocalBufId 'α' [200,300,400,500,600,800]
    x = mouseX kr 0 7 Linear 0.2
in sinOsc ar (mce2 (indexL b x) (index b x)) 0 * 0.1
