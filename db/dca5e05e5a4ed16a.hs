-- duty ; mouseX (control rate signal) determines duration
let n = dseq 'α' dinf (mce [204,400,201,502,300,200])
    x = mouseX KR 0.001 2 Linear 0.1
    f = duty KR x 0 RemoveSynth n
in sinOsc AR (f * mce2 1 1.01) 0 * 0.1
