-- formant ; modulate formant frequency, fundamental frequency stays constant
let f = mce [200, 300, 400, 500]
    ff = xLine KR 400 4000 8 RemoveSynth
in formant AR f ff 200 * 0.125
