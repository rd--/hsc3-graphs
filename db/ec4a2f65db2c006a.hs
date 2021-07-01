-- pitch ; control param
let initFreq = control kr "initFreq" 440.0
    minFreq = control kr "minFreq" 60.0
    maxFreq = control kr "maxFreq" 4000.0
    execFreq = control kr "execFreq" 100.0
    maxBinsPerOctave = control kr "maxBinsPerOctave" 16.0
    median = control kr "median" 1.0
    ampThreshold = control kr "ampThreshold" 0.01
    peakThreshold = control kr "peakThreshold" 0.5
    downSample = control kr "downSample" 1.0
    clar = control kr "clar" 0.0
    p = pitch (soundIn 0) initFreq minFreq maxFreq execFreq maxBinsPerOctave median ampThreshold peakThreshold downSample clar
in sinOsc ar (mceChannel 0 p) 0 * 0.1
