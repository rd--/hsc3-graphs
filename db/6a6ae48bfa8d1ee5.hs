-- formant ; modulate formant frequency, fundamental frequency stays constant
let f = mce [200, 300, 400, 500]
    ff = xLine kr 400 4000 8 RemoveSynth
in splay (formant ar f ff 200) 1 1 0 True * 0.125
